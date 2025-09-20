<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CustomerGroup;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Auth;
use DB;
use App\Traits\CacheForget;

class CustomerGroupController extends Controller
{
    use CacheForget;

    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('customer_group')) {
            // Filter customer groups by admin's pos_accnt_id
            $pos_accnt_id = Auth::user()->pos_accnt_id;
            $lims_customer_group_all = CustomerGroup::where('is_active', true)
                                     ->where('pos_accnt_id', $pos_accnt_id)
                                     ->get();
            return view('backend.customer_group.create',compact('lims_customer_group_all'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => [
                'max:255',
                    Rule::unique('customer_groups')->where(function ($query) {
                    return $query->where('is_active', 1)
                                 ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
                }),
            ],
        ]);
        $lims_customer_group_data = $request->all();
        $lims_customer_group_data['is_active'] = true;
        // Add pos_accnt_id to the customer group data
        $lims_customer_group_data['pos_accnt_id'] = Auth::user()->pos_accnt_id;
        CustomerGroup::create($lims_customer_group_data);
        $this->cacheForget('customer_group_list');
        return redirect('customer_group')->with('message', 'Data inserted successfully');
    }

    public function edit($id)
    {
        // Ensure the customer group belongs to the logged-in admin
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        $lims_customer_group_data = CustomerGroup::where('id', $id)
                                   ->where('pos_accnt_id', $pos_accnt_id)
                                   ->first();
        
        if(!$lims_customer_group_data) {
            return response()->json(['error' => 'Unauthorized access'], 403);
        }
        
        return $lims_customer_group_data;
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => [
                'max:255',
                    Rule::unique('customer_groups')->ignore($request->customer_group_id)->where(function ($query) {
                    return $query->where('is_active', 1)
                                 ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
                }),
            ],
        ]);

        $input = $request->all();
        // Ensure the customer group belongs to the logged-in admin
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        $lims_customer_group_data = CustomerGroup::where('id', $input['customer_group_id'])
                                   ->where('pos_accnt_id', $pos_accnt_id)
                                   ->first();
        
        if(!$lims_customer_group_data) {
            return redirect('customer_group')->with('not_permitted', 'Unauthorized access');
        }
        
        $lims_customer_group_data->update($input);
        $this->cacheForget('customer_group_list');
        return redirect('customer_group')->with('message', 'Data updated successfully');
    }

    public function importCustomerGroup(Request $request)
    {
        //get file
        $upload=$request->file('file');
        $ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);
        if($ext != 'csv')
            return redirect()->back()->with('not_permitted', 'Please upload a CSV file');
        $filename =  $upload->getClientOriginalName();
        $upload=$request->file('file');
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
        //looping through othe columns
        while($columns=fgetcsv($file))
        {
            if($columns[0]=="")
                continue;
            foreach ($columns as $key => $value) {
                $value=preg_replace('/\D/','',$value);
            }
           $data= array_combine($escapedHeader, $columns);

           $customer_group = CustomerGroup::firstOrNew([
               'name' => $data['name'], 
               'is_active' => true,
               'pos_accnt_id' => Auth::user()->pos_accnt_id // Ensure imported records are linked to admin
           ]);
           $customer_group->name = $data['name'];
           $customer_group->percentage = $data['percentage'];
           $customer_group->is_active = true;
           $customer_group->pos_accnt_id = Auth::user()->pos_accnt_id;
           $customer_group->save();
        }
        $this->cacheForget('customer_group_list');
        return redirect('customer_group')->with('message', 'Customer Group imported successfully');
    }

    public function exportCustomerGroup(Request $request)
    {
        $lims_customer_group_data = $request['customer_groupArray'];
        $csvData=array('name, percentage');
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        
        foreach ($lims_customer_group_data as $customer_group) {
            if($customer_group > 0) {
                // Only export customer groups belonging to the logged-in admin
                $data = CustomerGroup::where('id', $customer_group)
                       ->where('pos_accnt_id', $pos_accnt_id)
                       ->first();
                
                if($data) {
                    $csvData[]=$data->name. ',' . $data->percentage;
                }
            }
        }
        $filename="customer_group- " .date('d-m-Y').".csv";
        $file_path=public_path().'/downloads/'.$filename;
        $file_url=url('/').'/downloads/'.$filename;
        $file = fopen($file_path,"w+");
        foreach ($csvData as $exp_data){
          fputcsv($file,explode(',',$exp_data));
        }
        fclose($file);
        return $file_url;
    }

    public function deleteBySelection(Request $request)
    {
        $customer_group_id = $request['customer_groupIdArray'];
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        
        foreach ($customer_group_id as $id) {
            // Only delete customer groups belonging to the logged-in admin
            $lims_customer_group_data = CustomerGroup::where('id', $id)
                                       ->where('pos_accnt_id', $pos_accnt_id)
                                       ->first();
            
            if($lims_customer_group_data) {
                $lims_customer_group_data->is_active = false;
                $lims_customer_group_data->save();
            }
        }

        $this->cacheForget('customer_group_list');

        return 'Customer Group deleted successfully!';
    }

    public function destroy($id)
    {
        // Only delete customer groups belonging to the logged-in admin
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        $lims_customer_group_data = CustomerGroup::where('id', $id)
                                   ->where('pos_accnt_id', $pos_accnt_id)
                                   ->first();
        
        if(!$lims_customer_group_data) {
            return redirect('customer_group')->with('not_permitted', 'Unauthorized access');
        }
        
        $lims_customer_group_data->is_active = false;
        $lims_customer_group_data->save();

        $this->cacheForget('customer_group_list');

        return redirect('customer_group')->with('not_permitted', 'Data deleted successfully');
    }

    public function customerGroupAll()
    {
        // Only return customer groups belonging to the logged-in admin
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        $lims_customer_group_list = DB::table('customer_groups')
                                  ->where('is_active', true)
                                  ->where('pos_accnt_id', $pos_accnt_id)
                                  ->get();
        
        $html = '';
        foreach($lims_customer_group_list as $customer_group){
            $html .='<option value="'.$customer_group->id.'">'.$customer_group->name .'</option>';
        }

        return response()->json($html);
    }
}