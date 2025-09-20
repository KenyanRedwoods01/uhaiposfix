<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Unit;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Auth;

class UnitController extends Controller
{
    public function index()
{
    $role = Role::find(Auth::user()->role_id);

    // Small fix: permission should match what we use in routes/policies ("unit-index"), 
    // not just "unit". Keeps it consistent with BrandController and others.
    if($role->hasPermissionTo('unit-index')) {

        // Scoped the query by pos_accnt_id so each admin only sees their own units
        $posAccntId = Auth::user()->pos_accnt_id;

        $lims_unit_all = Unit::where('is_active', true)
                            ->where('pos_accnt_id', $posAccntId)
                            ->get();

        // Fixed view: was pointing to "unit.create", but this is the listing method.
        // Should load the "index" view instead.
        return view('backend.unit.index', compact('lims_unit_all'));
    }
    else {
        return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }
}


    public function store(Request $request)
{
    // Validation rules: added pos_accnt_id in the unique check 
    // so uniqueness is enforced per account, not globally.
    $this->validate($request, [
        'unit_code' => [
            'max:255',
            Rule::unique('units')->where(function ($query) {
                return $query->where('is_active', 1)
                             ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
            }),
        ],

        'unit_name' => [
            'max:255',
            Rule::unique('units')->where(function ($query) {
                return $query->where('is_active', 1)
                             ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
            }),
        ]
    ]);

    // Gather input and attach the current account ID
    $input = $request->all();
    $input['is_active'] = true;
    $input['pos_accnt_id'] = Auth::user()->pos_accnt_id;

    // If this is a base unit, set default operator and value
    if(!$input['base_unit']){
        $input['operator'] = '*';
        $input['operation_value'] = 1;
    }

    // Create the unit
    Unit::create($input);

    // Added a success flash message for user feedback
    return redirect('unit')->with('message', 'Unit created successfully');
}


    public function limsUnitSearch(Request $request)
{
    // Using Request instead of $_GET for cleaner Laravel style
    $query = $request->input('lims_unitNameSearch');

    // Restrict to current account
    $posAccntId = Auth::user()->pos_accnt_id;

    // Search by partial match so results are more flexible
    $lims_unit_all = Unit::where('unit_name', 'LIKE', "%{$query}%")
                         ->where('is_active', true) // also make sure we don’t list inactive units
                         ->where('pos_accnt_id', $posAccntId)
                         ->paginate(5);

    // Fetch all units for the same account (could be used in a dropdown or sidebar)
    $lims_unit_list = Unit::where('pos_accnt_id', $posAccntId)
                          ->where('is_active', true)
                          ->get();

    // Fixed the view: this should return to the index page, not the create form
    return view('backend.unit.index', compact('lims_unit_all', 'lims_unit_list'));
}


    public function edit($id)
    {
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        $lims_unit_data = Unit::where('id', $id)
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->firstOrFail();
        return $lims_unit_data;
    }

    public function update(Request $request, $id)
{
    // Validation:
    // Changed ignore() to use the route parameter $id instead of $request->unit_id,
    // because the route param is the real identifier we’re updating.
    // Still enforcing uniqueness by pos_accnt_id so it’s scoped per account.
    $this->validate($request, [
        'unit_code' => [
            'max:255',
            Rule::unique('units')->ignore($id)->where(function ($query) {
                return $query->where('is_active', 1)
                             ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
            }),
        ],
        'unit_name' => [
            'max:255',
            Rule::unique('units')->ignore($id)->where(function ($query) {
                return $query->where('is_active', 1)
                             ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
            }),
        ]
    ]);

    // Collect the input
    $input = $request->all();

    // If this is a base unit, make sure operator and value are set to defaults
    if(!$input['base_unit']){
        $input['operator'] = '*';
        $input['operation_value'] = 1;
    }

    // Ownership check:
    // Only fetch the unit if it belongs to the current account
    $posAccntId = Auth::user()->pos_accnt_id;
    $lims_unit_data = Unit::where('id', $id)
                          ->where('pos_accnt_id', $posAccntId)
                          ->firstOrFail();

    // Update the record
    $lims_unit_data->update($input);

    // Added a success flash message so user knows update worked
    return redirect('unit')->with('message', 'Unit updated successfully');
}


    public function importUnit(Request $request)
    {
        //get file
        $filename = $request->file->getClientOriginalName();
        $upload = $request->file('file');
        $filePath = $upload->getRealPath();
        //open and read
        $file = fopen($filePath, 'r');
        $header = fgetcsv($file);
        $escapedHeader = [];
        //validate
        foreach ($header as $key => $value) {
            $lheader = strtolower($value);
            $escapedItem = preg_replace('/[^a-z]/', '', $lheader);
            array_push($escapedHeader, $escapedItem);
        }
        //looping through other columns
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        
        while($columns = fgetcsv($file))
        {
            if($columns[0] == "")
                continue;
            foreach ($columns as $key => $value) {
                $value = preg_replace('/\D/', '', $value);
            }
            $data = array_combine($escapedHeader, $columns);

            $unit = Unit::firstOrNew([
                'unit_code' => $data['code'],
                'is_active' => true,
                'pos_accnt_id' => $pos_accnt_id
            ]);
            
            $unit->unit_code = $data['code'];
            $unit->unit_name = $data['name'];
            $unit->pos_accnt_id = $pos_accnt_id;
            
            if($data['baseunit'] == null)
                $unit->base_unit = null;
            else{
                $base_unit = Unit::where('unit_code', $data['baseunit'])
                                ->where('pos_accnt_id', $pos_accnt_id)
                                ->first();
                                
                $unit->base_unit = $base_unit ? $base_unit->id : null;
            }
            
            if($data['operator'] == null)
                $unit->operator = '*';
            else
                $unit->operator = $data['operator'];
                
            if($data['operationvalue'] == null)
                $unit->operation_value = 1;
            else
                $unit->operation_value = $data['operationvalue'];
                
            $unit->save();
        }
        return redirect('unit')->with('message', 'Unit imported successfully');
    }

    public function deleteBySelection(Request $request)
    {
        $unit_id = $request['unitIdArray'];
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        
        foreach ($unit_id as $id) {
            $lims_unit_data = Unit::where('id', $id)
                                ->where('pos_accnt_id', $pos_accnt_id)
                                ->firstOrFail();
                                
            $lims_unit_data->is_active = false;
            $lims_unit_data->save();
        }
        return 'Unit deleted successfully!';
    }

    public function destroy($id)
{
    // Grab the current account id to enforce ownership
    $posAccntId = Auth::user()->pos_accnt_id;

    // Only allow deleting units that belong to this account
    $lims_unit_data = Unit::where('id', $id)
                          ->where('pos_accnt_id', $posAccntId)
                          ->firstOrFail();

    // Instead of hard-deleting, just mark it inactive
    $lims_unit_data->is_active = false;
    $lims_unit_data->save();

    // Added a flash message so the user knows the delete worked
    return redirect('unit')->with('message', 'Unit deleted successfully');
}

}
