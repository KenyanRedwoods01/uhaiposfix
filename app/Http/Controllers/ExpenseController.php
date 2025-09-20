<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Expense;
use App\Models\Account;
use App\Models\Warehouse;
use App\Models\CashRegister;
use App\Traits\StaffAccess;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Auth;
use DB;

class ExpenseController extends Controller
{
    use StaffAccess;

   public function index(Request $request)
{
    $role = Role::find(Auth::user()->role_id);
    if($role->hasPermissionTo('expenses-index')){
        // Get the current user's pos_accnt_id
        $userPosAccountId = Auth::user()->pos_accnt_id;
        
        $permissions = Role::findByName($role->name)->permissions;
        foreach ($permissions as $permission)
            $all_permission[] = $permission->name;
        if(empty($all_permission))
            $all_permission[] = 'dummy text';
        
        if($request->starting_date) {
            $starting_date = $request->starting_date;
            $ending_date = $request->ending_date;
        }
        else {
            $starting_date = date('Y-m-01', strtotime('-1 year', strtotime(date('Y-m-d'))));
            $ending_date = date("Y-m-d");
        }
        
        if($request->input('warehouse_id'))
            $warehouse_id = $request->input('warehouse_id');
        else
            $warehouse_id = 0;
            
        // Filter warehouse list by the user's pos_accnt_id
        $lims_warehouse_list = Warehouse::select('name', 'id')
            ->where('is_active', true)
            ->where('pos_accnt_id', $userPosAccountId)
            ->get();
            
        // Filter account list by the user's pos_accnt_id
        $lims_account_list = Account::where('is_active', true)
            ->where('pos_accnt_id', $userPosAccountId)
            ->get();
            
        return view('backend.expense.index', compact('lims_account_list', 'lims_warehouse_list', 'all_permission', 'starting_date', 'ending_date', 'warehouse_id'));
    }
    else
        return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
}

    public function expenseData(Request $request)
{
    $columns = array(
        1 => 'created_at',
        2 => 'reference_no',
    );

    // Fetch the logged-in user's pos_accnt_id for multi-tenancy filtering
    $posAccntId = Auth::user()->pos_accnt_id;

    $warehouse_id = $request->input('warehouse_id');
    
    // Base query with pos_accnt_id filtering for multi-tenancy
    $baseQuery = Expense::where('pos_accnt_id', $posAccntId)
                        ->whereDate('created_at', '>=' ,$request->input('starting_date'))
                        ->whereDate('created_at', '<=' ,$request->input('ending_date'));

    // Apply warehouse filter if specified
    if ($warehouse_id) {
        $baseQuery->where('warehouse_id', $warehouse_id);
    }

    // Apply staff access check
    $this->staffAccessCheck($baseQuery);

    $totalData = $baseQuery->count();
    $totalFiltered = $totalData;

    // Determine limit
    $limit = ($request->input('length') != -1) ? $request->input('length') : $totalData;
    $start = $request->input('start');
    $order = 'expenses.' . $columns[$request->input('order.0.column')];
    $dir = $request->input('order.0.dir');

    // Process the query based on whether there's a search value
    if (empty($request->input('search.value'))) {
        // No search value, just apply filters and sorting
        $query = Expense::with('warehouse', 'expenseCategory')
                        ->where('pos_accnt_id', $posAccntId) // Multi-tenancy filter
                        ->whereDate('created_at', '>=' ,$request->input('starting_date'))
                        ->whereDate('created_at', '<=' ,$request->input('ending_date'))
                        ->offset($start)
                        ->limit($limit)
                        ->orderBy($order, $dir);

        // Apply warehouse filter if specified
        if ($warehouse_id) {
            $query->where('warehouse_id', $warehouse_id);
        }

        // Apply staff access check
        $this->staffAccessCheck($query);

        $expenses = $query->get();
    } else {
        // Handle search with multi-tenancy filtering
        $search = $request->input('search.value');
        
        // Different query handling based on user role and staff access configuration
        if (Auth::user()->role_id > 2 && config('staff_access') == 'own') {
            // Staff with 'own' access - can only see their own records
            $query = Expense::where('pos_accnt_id', $posAccntId) // Multi-tenancy filter
                           ->where('user_id', Auth::id())
                           ->where(function($q) use ($search) {
                                $q->whereDate('created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                                  ->orWhere('reference_no', 'LIKE', "%{$search}%");
                           })
                           ->offset($start)
                           ->limit($limit)
                           ->orderBy($order, $dir);
            
            $expenses = $query->with('warehouse', 'expenseCategory')->get();
            
            $totalFiltered = Expense::where('pos_accnt_id', $posAccntId) // Multi-tenancy filter for count
                                   ->where('user_id', Auth::id())
                                   ->where(function($q) use ($search) {
                                        $q->whereDate('created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                                          ->orWhere('reference_no', 'LIKE', "%{$search}%");
                                   })
                                   ->count();
        } 
        elseif (Auth::user()->role_id > 2 && config('staff_access') == 'warehouse') {
            // Staff with 'warehouse' access - can see records for their warehouse
            $query = Expense::where('pos_accnt_id', $posAccntId) // Multi-tenancy filter
                           ->where(function($q) use ($search) {
                                $q->where('user_id', Auth::id())
                                  ->orWhere(function($inner) use ($search) {
                                        $inner->where('reference_no', 'LIKE', "%{$search}%")
                                             ->where('warehouse_id', Auth::user()->warehouse_id);
                                  });
                           })
                           ->offset($start)
                           ->limit($limit)
                           ->orderBy($order, $dir);
            
            $expenses = $query->with('warehouse', 'expenseCategory')->get();
            
            $totalFiltered = Expense::where('pos_accnt_id', $posAccntId) // Multi-tenancy filter for count
                                   ->where(function($q) use ($search) {
                                        $q->where('user_id', Auth::id())
                                          ->orWhere(function($inner) use ($search) {
                                                $inner->where('reference_no', 'LIKE', "%{$search}%")
                                                     ->where('warehouse_id', Auth::user()->warehouse_id);
                                          });
                                   })
                                   ->count();
        } 
        else {
            // Admin or users with full access - can see all records within their pos_accnt_id
            $query = Expense::where('pos_accnt_id', $posAccntId) // Multi-tenancy filter
                           ->where(function($q) use ($search) {
                                $q->whereDate('created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                                  ->orWhere('reference_no', 'LIKE', "%{$search}%");
                           })
                           ->offset($start)
                           ->limit($limit)
                           ->orderBy($order, $dir);
            
            $expenses = $query->with('warehouse', 'expenseCategory')->get();
            
            $totalFiltered = Expense::where('pos_accnt_id', $posAccntId) // Multi-tenancy filter for count
                                   ->where(function($q) use ($search) {
                                        $q->whereDate('created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                                          ->orWhere('reference_no', 'LIKE', "%{$search}%");
                                   })
                                   ->count();
        }
    }

    // Format the data for DataTables
    $data = array();
    if (!empty($expenses)) {
        foreach ($expenses as $key => $expense) {
            $nestedData['id'] = $expense->id;
            $nestedData['key'] = $key;
            $nestedData['date'] = date(config('date_format'), strtotime($expense->created_at->toDateString()));
            $nestedData['reference_no'] = $expense->reference_no;
            $nestedData['warehouse'] = $expense->warehouse->name;
            $nestedData['expenseCategory'] = $expense->expenseCategory->name;
            $nestedData['amount'] = number_format($expense->amount, config('decimal'));
            $nestedData['note'] = $expense->note;
            $nestedData['options'] = '<div class="btn-group">
                        <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' . trans("file.action") . '
                          <span class="caret"></span>
                          <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">';
            
            if (in_array("expenses-edit", $request['all_permission'])) {
                $nestedData['options'] .= '<li>
                    <button type="button" data-id="' . $expense->id . '" class="open-Editexpense_categoryDialog btn btn-link" data-toggle="modal" data-target="#editModal"><i class="dripicons-document-edit"></i>' . trans('file.edit') . '</button>
                    </li>';
            }
            
            if (in_array("expenses-delete", $request['all_permission'])) {
                $nestedData['options'] .= \Form::open(["route" => ["expenses.destroy", $expense->id], "method" => "DELETE"]) . '
                        <li>
                          <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> ' . trans("file.delete") . '</button>
                        </li>' . \Form::close() . '
                    </ul>
                </div>';
            }
            
            $data[] = $nestedData;
        }
    }

    $json_data = array(
        "draw" => intval($request->input('draw')),
        "recordsTotal" => intval($totalData),
        "recordsFiltered" => intval($totalFiltered),
        "data" => $data
    );
    
    echo json_encode($json_data);
}


    public function create()
    {
        //
    }

    public function store(Request $request)
{
    $data = $request->all();
    
    // Check and set the created_at field
    if(isset($data['created_at'])) {
        $data['created_at'] = date("Y-m-d H:i:s", strtotime($data['created_at']));
    } else {
        $data['created_at'] = date("Y-m-d H:i:s");
    }

    // Generate a reference number for the expense
    $data['reference_no'] = 'er-' . date("Ymd") . '-'. date("his");

    // Get the logged-in user's ID and fetch their pos_accnt_id from the users table
    $data['user_id'] = Auth::id();
    $user = Auth::user();
    $data['pos_accnt_id'] = $user->pos_accnt_id;  // Add the logged-in user's pos_accnt_id to the data array

    // Check if there's an active cash register for this user and warehouse
    $cash_register_data = CashRegister::where([
        ['user_id', $data['user_id']],
        ['warehouse_id', $data['warehouse_id']],
        ['status', true]
    ])->first();
    
    // If cash register data is found, add the cash_register_id to the data
    if ($cash_register_data) {
        $data['cash_register_id'] = $cash_register_data->id;
    }

    // Create the expense record with the data
    Expense::create($data);

    // Redirect to the expenses page with a success message
    return redirect('expenses')->with('message', 'Data inserted successfully');
}




    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $role = Role::firstOrCreate(['id' => Auth::user()->role_id]);
        if ($role->hasPermissionTo('expenses-edit')) {
            $lims_expense_data = Expense::find($id);
            $lims_expense_data->date = date('d-m-Y', strtotime($lims_expense_data->created_at->toDateString()));
            return $lims_expense_data;
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function update(Request $request, $id)
    {
        $data = $request->all();
        $lims_expense_data = Expense::find($data['expense_id']);
        $data['created_at'] = date("Y-m-d H:i:s", strtotime($data['created_at']));
        $lims_expense_data->update($data);
        return redirect('expenses')->with('message', 'Data updated successfully');
    }

    public function deleteBySelection(Request $request)
    {
        $expense_id = $request['expenseIdArray'];
        foreach ($expense_id as $id) {
            $lims_expense_data = Expense::find($id);
            $lims_expense_data->delete();
        }
        return 'Expense deleted successfully!';
    }

    public function destroy($id)
    {
        $lims_expense_data = Expense::find($id);
        $lims_expense_data->delete();
        return redirect('expenses')->with('not_permitted', 'Data deleted successfully');
    }
}
