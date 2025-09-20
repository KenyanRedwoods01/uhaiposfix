<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ExpenseCategory;
use Keygen;
use DB;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;

class ExpenseCategoryController extends Controller
{
    public function index()
    {
        // Get the logged-in user's pos_accnt_id
        $posAccntId = Auth::user()->pos_accnt_id;
        
        // Filter expense categories by pos_accnt_id and active status
        $lims_expense_category_all = ExpenseCategory::where('is_active', true)
                                                   ->where('pos_accnt_id', $posAccntId)
                                                   ->get();
        
        return view('backend.expense_category.index', compact('lims_expense_category_all'));
    }

    public function create()
    {
        //
    }

    public function generateCode()
    {
        $id = Keygen::numeric(8)->generate();
        return $id;
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'code' => [
                'max:255',
                    Rule::unique('expense_categories')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ]
        ]);

        $data = $request->all();
        // Set pos_accnt_id to the logged-in user's pos_accnt_id
        $data['pos_accnt_id'] = Auth::user()->pos_accnt_id;
        
        ExpenseCategory::create($data);
        return redirect('expense_categories')->with('message', 'Data inserted successfully');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        // Add security check to ensure the expense category belongs to the user's account
        $posAccntId = Auth::user()->pos_accnt_id;
        
        $lims_expense_category_data = ExpenseCategory::where('id', $id)
                                                    ->where('pos_accnt_id', $posAccntId)
                                                    ->first();
        
        if (!$lims_expense_category_data) {
            return response()->json(['error' => 'Unauthorized access'], 403);
        }
        
        return $lims_expense_category_data;
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'code' => [
                'max:255',
                    Rule::unique('expense_categories')->ignore($request->expense_category_id)->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ]
        ]);

        $data = $request->all();
        
        // Add security check to ensure the expense category belongs to the user's account
        $posAccntId = Auth::user()->pos_accnt_id;
        
        $lims_expense_category_data = ExpenseCategory::where('id', $data['expense_category_id'])
                                                    ->where('pos_accnt_id', $posAccntId)
                                                    ->first();
        
        if (!$lims_expense_category_data) {
            return redirect('expense_categories')->with('not_permitted', 'Unauthorized access');
        }
        
        $lims_expense_category_data->update($data);
        return redirect('expense_categories')->with('message', 'Data updated successfully');
    }

    public function import(Request $request)
    {
        //get file
        $upload=$request->file('file');
        $ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);
        if($ext != 'csv')
            return redirect()->back()->with('not_permitted', 'Please upload a CSV file');
        $filename =  $upload->getClientOriginalName();
        $filePath=$upload->getRealPath();
        //open and read
        $file=fopen($filePath, 'r');
        $header= fgetcsv($file);
        $escapedHeader=[];
        //validate
        foreach ($header as $key => $value) {
            $lheader=strtolower($value);
            $escapedItem=preg_replace('/[^a-z]/', '', $lheader);
            array_push($escapedHeader, $escapedItem);
        }
        
        // Get current user's pos_accnt_id for imported records
        $posAccntId = Auth::user()->pos_accnt_id;
        
        //looping through other columns
        while($columns=fgetcsv($file))
        {
            if($columns[0]=="")
                continue;
            foreach ($columns as $key => $value) {
                $value=preg_replace('/\D/','',$value);
            }
            $data = array_combine($escapedHeader, $columns);
            
            // Check if the expense category exists for this account
            $expense_category = ExpenseCategory::firstOrNew([
                'code' => $data['code'], 
                'pos_accnt_id' => $posAccntId,
                'is_active' => true
            ]);
            
            $expense_category->code = $data['code'];
            $expense_category->name = $data['name'];
            $expense_category->pos_accnt_id = $posAccntId;
            $expense_category->is_active = true;
            $expense_category->save();
        }
        return redirect('expense_categories')->with('message', 'ExpenseCategory imported successfully');
    }

    public function deleteBySelection(Request $request)
    {
        $expense_category_id = $request['expense_categoryIdArray'];
        $posAccntId = Auth::user()->pos_accnt_id;
        
        foreach ($expense_category_id as $id) {
            // Only delete expense categories that belong to the user's account
            $lims_expense_category_data = ExpenseCategory::where('id', $id)
                                                        ->where('pos_accnt_id', $posAccntId)
                                                        ->first();
            
            if ($lims_expense_category_data) {
                $lims_expense_category_data->is_active = false;
                $lims_expense_category_data->save();
            }
        }
        return 'Expense Category deleted successfully!';
    }

    public function destroy($id)
    {
        // Add security check to ensure the expense category belongs to the user's account
        $posAccntId = Auth::user()->pos_accnt_id;
        
        $lims_expense_category_data = ExpenseCategory::where('id', $id)
                                                    ->where('pos_accnt_id', $posAccntId)
                                                    ->first();
        
        if (!$lims_expense_category_data) {
            return redirect('expense_categories')->with('not_permitted', 'Unauthorized access');
        }
        
        $lims_expense_category_data->is_active = false;
        $lims_expense_category_data->save();
        return redirect('expense_categories')->with('not_permitted', 'Data deleted successfully');
    }

    public function expenseCategoriesAll()
    {
        // Get the logged-in user's pos_accnt_id
        $posAccntId = Auth::user()->pos_accnt_id;

        // Get the active expense categories that match the logged-in user's pos_accnt_id
        $lims_expense_category_list = DB::table('expense_categories')
                                        ->where('pos_accnt_id', $posAccntId)
                                        ->where('is_active', true)
                                        ->get();

        // Initialize the HTML string
        $html = '';

        // Loop through the expense categories and create the option elements
        foreach ($lims_expense_category_list as $expense_category) {
            $html .= '<option value="' . $expense_category->id . '">' . $expense_category->name . ' (' . $expense_category->code . ')</option>';
        }

        // Return the HTML as a JSON response
        return response()->json($html);
    }
}