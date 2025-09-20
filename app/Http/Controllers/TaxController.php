<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Tax;
use App\Models\Account; // Added Account model
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Auth;
class TaxController extends Controller
{
    use \App\Traits\CacheForget;
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
{
    $role = Role::find(Auth::user()->role_id);

    // Permission check: should be "tax-index" to stay consistent 
    // with route naming and other controllers (unit-index, brand-index, etc.)
    if($role->hasPermissionTo('tax-index')) {

        // Scoped by pos_accnt_id so each account only sees their own tax records
        $posAccntId = Auth::user()->pos_accnt_id;

        $lims_tax_all = Tax::where('is_active', true)
                           ->where('pos_accnt_id', $posAccntId)
                           ->get();

        // Fixed the view: this is the listing method, so it should return the index view
        return view('backend.tax.index', compact('lims_tax_all'));
    }
    else {
        return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }
}


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
{
    // Validation:
    // - Added pos_accnt_id in the unique check to enforce uniqueness per account.
    // - Ensured rate is between 0–100.
    // - TAX_SHORT_DESC is required.
    $this->validate($request, [
        'name' => [
            'max:255',
            Rule::unique('taxes')->where(function ($query) {
                return $query->where('is_active', 1)
                             ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
            }),
        ],
        'rate' => 'numeric|min:0|max:100',
        'TAX_SHORT_DESC' => 'required|max:255',
    ]);

    // Gather the form inputs
    $input = $request->all();
    $input['is_active'] = true;
    $input['pos_accnt_id'] = Auth::user()->pos_accnt_id; // attach ownership

    // Create the tax record
    $tax = Tax::create($input);

    // Business logic: also create a corresponding account entry
    $this->createCorrespondingAccount($tax);

    // Clear cache so new tax shows up everywhere
    $this->cacheForget('tax_list');

    // Handle AJAX vs. normal request
    if (isset($input['ajax'])) {
        return $tax;
    } else {
        return redirect('tax')->with('message', 'Tax created successfully');
    }
}


    /**
     * Create a corresponding account record for the tax
     *
     * @param  \App\Models\Tax  $tax
     * @return void
     */
    private function createCorrespondingAccount($tax)
    {
        // Check if an account with the same name already exists
        $accountExists = Account::where('name', $tax->name)
                           ->where('pos_accnt_id', Auth::user()->pos_accnt_id)
                           ->exists();
        
        if (!$accountExists) {
            // Create a new account record
            $account = new Account();
            $account->name = $tax->name;
            $account->short_descp = $tax->TAX_SHORT_DESC; // Assuming the column name is short_descp
            $account->is_active = true;
            $account->pos_accnt_id = Auth::user()->pos_accnt_id;
            $account->percentage = $tax->rate; // Store the tax rate in the percentage column
            
            // Check if this is the first account for this tenant
            $firstAccountExists = Account::where('is_active', true)
                                   ->where('pos_accnt_id', Auth::user()->pos_accnt_id)
                                   ->exists();
            
            // Set as default if it's the first account
            $account->is_default = !$firstAccountExists;
            
            // Generate a unique account number (you might want to customize this logic)
            $account->account_no = 'TAX-' . str_pad((string)$tax->id, 5, '0', STR_PAD_LEFT);
            
            // Set initial balance to 0
            $account->initial_balance = 0;
            $account->total_balance = 0;
            
            // Save the account
            $account->save();
        }
    }

    /**
     * Search for specific tax records.
     *
     * @return \Illuminate\Http\Response
     */
    public function limsTaxSearch(Request $request)
{
    // Use Request instead of raw $_GET — cleaner and more testable
    $query = $request->input('lims_taxNameSearch');

    $posAccntId = Auth::user()->pos_accnt_id;

    // Search by partial match instead of exact name, so it's more user-friendly
    $lims_tax_all = Tax::where('name', 'LIKE', "%{$query}%")
                       ->where('is_active', true) // only show active taxes
                       ->where('pos_accnt_id', $posAccntId)
                       ->paginate(5);

    // Get full list for dropdowns or other UI use, but filter by active + account
    $lims_tax_list = Tax::where('pos_accnt_id', $posAccntId)
                        ->where('is_active', true)
                        ->get();

    // Fixed the view: search results belong in index, not create
    return view('backend.tax.index', compact('lims_tax_all', 'lims_tax_list'));
}


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $lims_tax_data = Tax::where('id', $id)
                          ->where('pos_accnt_id', Auth::user()->pos_accnt_id)
                          ->firstOrFail();
        return $lims_tax_data;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
{
    // Validation:
    // - Use $id directly in ignore() instead of $request->tax_id, 
    //   since $id comes from the route and is the reliable identifier.
    // - Still scoping uniqueness by pos_accnt_id so names are unique per account.
    $this->validate($request, [
        'name' => [
            'max:255',
            Rule::unique('taxes')->ignore($id)->where(function ($query) {
                return $query->where('is_active', 1)
                             ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
            }),
        ],
        'rate' => 'numeric|min:0|max:100'
    ]);

    $input = $request->all();

    // Ownership check: make sure the tax belongs to this account
    $posAccntId = Auth::user()->pos_accnt_id;
    $lims_tax_data = Tax::where('id', $id)
                        ->where('pos_accnt_id', $posAccntId)
                        ->firstOrFail();

    // Store old name before update (needed for updating corresponding account)
    $oldName = $lims_tax_data->name;

    // Perform the update
    $lims_tax_data->update($input);

    // Update the related account record to stay in sync
    $this->updateCorrespondingAccount($oldName, $lims_tax_data);

    // Clear cache so changes reflect everywhere
    $this->cacheForget('tax_list');

    return redirect('tax')->with('message', 'Tax updated successfully');
}

    
    /**
     * Update the corresponding account record for the tax
     *
     * @param  string  $oldName
     * @param  \App\Models\Tax  $tax
     * @return void
     */
    private function updateCorrespondingAccount($oldName, $tax)
    {
        // Find the corresponding account by name
        $account = Account::where('name', $oldName)
                     ->where('pos_accnt_id', Auth::user()->pos_accnt_id)
                     ->first();
        
        if ($account) {
            // Update the account details
            $account->name = $tax->name;
            $account->short_descp = $tax->TAX_SHORT_DESC;
            $account->percentage = $tax->rate; // Update the percentage column with the tax rate
            $account->save();
        } else {
            // If no corresponding account exists, create one
            $this->createCorrespondingAccount($tax);
        }
    }
    
    /**
     * Remove multiple resources from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string
     */
    public function deleteBySelection(Request $request)
    {
        $tax_id = $request['taxIdArray'];
        foreach ($tax_id as $id) {
            $lims_tax_data = Tax::where('id', $id)
                              ->where('pos_accnt_id', Auth::user()->pos_accnt_id)
                              ->firstOrFail();
            
            // Deactivate corresponding account
            $this->deactivateCorrespondingAccount($lims_tax_data->name);
            
            $lims_tax_data->is_active = false;
            $lims_tax_data->save();
        }
        $this->cacheForget('tax_list');
        return 'Tax deleted successfully!';
    }

    /**
     * Deactivate the corresponding account record for the tax
     *
     * @param  string  $taxName
     * @return void
     */
    private function deactivateCorrespondingAccount($taxName)
    {
        // Find the corresponding account by name
        $account = Account::where('name', $taxName)
                     ->where('pos_accnt_id', Auth::user()->pos_accnt_id)
                     ->where('is_active', true)
                     ->first();
        
        if ($account) {
            // Check if this is the default account
            if ($account->is_default) {
                // Find another account to make default
                $otherAccount = Account::where('id', '!=', $account->id)
                                 ->where('pos_accnt_id', Auth::user()->pos_accnt_id)
                                 ->where('is_active', true)
                                 ->first();
                
                if ($otherAccount) {
                    $otherAccount->is_default = true;
                    $otherAccount->save();
                }
            }
            
            // Deactivate the account
            $account->is_active = false;
            $account->save();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
{
    // Ownership check: only allow deletion of tax records 
    // that belong to the logged-in account
    $posAccntId = Auth::user()->pos_accnt_id;
    $lims_tax_data = Tax::where('id', $id)
                        ->where('pos_accnt_id', $posAccntId)
                        ->firstOrFail();

    // Also deactivate the corresponding account so bookkeeping stays in sync
    $this->deactivateCorrespondingAccount($lims_tax_data->name);

    // Soft-delete: mark as inactive instead of removing from DB
    $lims_tax_data->is_active = false;
    $lims_tax_data->save();

    // Clear cache so the deleted tax doesn’t show in lists
    $this->cacheForget('tax_list');

    return redirect('tax')->with('message', 'Tax deleted successfully');
}

}
