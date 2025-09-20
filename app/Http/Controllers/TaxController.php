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
        if($role->hasPermissionTo('tax')) {
            // Filter tax records by the admin's pos_accnt_id
            $lims_tax_all = Tax::where('is_active', true)
                             ->where('pos_accnt_id', Auth::user()->pos_accnt_id)
                             ->get();
            return view('backend.tax.create', compact('lims_tax_all'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
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
        
        // Get all the form inputs
        $input = $request->all();
        $input['is_active'] = true;
        // Set the pos_accnt_id to the logged-in admin's pos_accnt_id
        $input['pos_accnt_id'] = Auth::user()->pos_accnt_id;
        
        // Create the new tax record in the database
        $tax = Tax::create($input);
        
        // Create corresponding account record
        $this->createCorrespondingAccount($tax);
        
        // Clear the cached tax list if necessary
        $this->cacheForget('tax_list');
        
        // If the form is submitted via AJAX, return the tax data
        if (isset($input['ajax'])) {
            return $tax;
        } else {
            // Redirect back with a success message
            return redirect('tax')->with('message', 'Data inserted successfully');
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
    public function limsTaxSearch()
    {
        $lims_tax_name = $_GET['lims_taxNameSearch'];
        $lims_tax_all = Tax::where('name', $lims_tax_name)
                          ->where('pos_accnt_id', Auth::user()->pos_accnt_id)
                          ->paginate(5);
        $lims_tax_list = Tax::where('pos_accnt_id', Auth::user()->pos_accnt_id)->get();
        return view('backend.tax.create', compact('lims_tax_all','lims_tax_list'));
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
        $this->validate($request, [
            'name' => [
                'max:255',
                Rule::unique('taxes')->ignore($request->tax_id)->where(function ($query) {
                    return $query->where('is_active', 1)
                               ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
                }),
            ],
            'rate' => 'numeric|min:0|max:100'
        ]);
        
        $input = $request->all();
        $lims_tax_data = Tax::where('id', $input['tax_id'])
                          ->where('pos_accnt_id', Auth::user()->pos_accnt_id)
                          ->firstOrFail();
        
        // Store old name to find the corresponding account
        $oldName = $lims_tax_data->name;
        
        $lims_tax_data->update($input);
        
        // Update corresponding account
        $this->updateCorrespondingAccount($oldName, $lims_tax_data);
        
        $this->cacheForget('tax_list');
        return redirect('tax')->with('message', 'Data updated successfully');
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
        $lims_tax_data = Tax::where('id', $id)
                          ->where('pos_accnt_id', Auth::user()->pos_accnt_id)
                          ->firstOrFail();
        
        // Deactivate corresponding account
        $this->deactivateCorrespondingAccount($lims_tax_data->name);
        
        $lims_tax_data->is_active = false;
        $lims_tax_data->save();
        $this->cacheForget('tax_list');
        return redirect('tax')->with('message', 'Data deleted successfully');
    }
}