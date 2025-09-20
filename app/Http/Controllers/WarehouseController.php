<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Warehouse;
use Illuminate\Validation\Rule;
use Keygen;
use Auth;
use DB;
use App\Traits\CacheForget;

class WarehouseController extends Controller
{
    use CacheForget;
    public function index()
    {
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        $lims_warehouse_all = Warehouse::where('is_active', true)
                                      ->where('pos_accnt_id', $pos_accnt_id)
                                      ->get();
        $numberOfWarehouse = Warehouse::where('is_active', true)
                                     ->where('pos_accnt_id', $pos_accnt_id)
                                     ->count();
        return view('backend.warehouse.create', compact('lims_warehouse_all', 'numberOfWarehouse'));
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => [
                'max:255',
                    Rule::unique('warehouses')->where(function ($query) {
                    return $query->where('is_active', 1)
                                 ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
                }),
            ],
        ]);
        $input = $request->all();
        $input['is_active'] = true;
        $input['pos_accnt_id'] = Auth::user()->pos_accnt_id;
        Warehouse::create($input);
        $this->cacheForget('warehouse_list');
        return redirect('warehouse')->with('message', 'Data inserted successfully');
    }

    public function edit($id)
    {
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        $lims_warehouse_data = Warehouse::where('id', $id)
                                       ->where('pos_accnt_id', $pos_accnt_id)
                                       ->firstOrFail();
        return $lims_warehouse_data;
    }

    public function update(Request $request, $id)
    {
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        $this->validate($request, [
            'name' => [
                'max:255',
                    Rule::unique('warehouses')->ignore($request->warehouse_id)->where(function ($query) {
                    return $query->where('is_active', 1)
                                 ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
                }),
            ],
        ]);
        $input = $request->all();
        $lims_warehouse_data = Warehouse::where('id', $input['warehouse_id'])
                                       ->where('pos_accnt_id', $pos_accnt_id)
                                       ->firstOrFail();
        $lims_warehouse_data->update($input);
        $this->cacheForget('warehouse_list');
        return redirect('warehouse')->with('message', 'Data updated successfully');
    }

    public function importWarehouse(Request $request)
    {
        $pos_accnt_id = Auth::user()->pos_accnt_id;
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

           $warehouse = Warehouse::firstOrNew([
               'name' => $data['name'], 
               'pos_accnt_id' => $pos_accnt_id,
               'is_active' => true
           ]);
           $warehouse->name = $data['name'];
           $warehouse->phone = $data['phone'];
           $warehouse->email = $data['email'];
           $warehouse->address = $data['address'];
           $warehouse->pos_accnt_id = $pos_accnt_id;
           $warehouse->is_active = true;
           $warehouse->save();
        }
        $this->cacheForget('warehouse_list');
        return redirect('warehouse')->with('message', 'Warehouse imported successfully');
    }

    public function deleteBySelection(Request $request)
    {
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        $warehouse_id = $request['warehouseIdArray'];
        foreach ($warehouse_id as $id) {
            $lims_warehouse_data = Warehouse::where('id', $id)
                                          ->where('pos_accnt_id', $pos_accnt_id)
                                          ->first();
            if ($lims_warehouse_data) {
                $lims_warehouse_data->is_active = false;
                $lims_warehouse_data->save();
            }
        }
        $this->cacheForget('warehouse_list');
        return 'Warehouse deleted successfully!';
    }

    public function destroy($id)
    {
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        $lims_warehouse_data = Warehouse::where('id', $id)
                                       ->where('pos_accnt_id', $pos_accnt_id)
                                       ->firstOrFail();
        $lims_warehouse_data->is_active = false;
        $lims_warehouse_data->save();
        $this->cacheForget('warehouse_list');
        return redirect('warehouse')->with('message', 'Data deleted successfully');
    }

    public function warehouseAll()
    {
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        if(Auth::user()->role_id > 2)
            $lims_warehouse_list = DB::table('warehouses')->where([
                ['is_active', true],
                ['id', Auth::user()->warehouse_id],
                ['pos_accnt_id', $pos_accnt_id]
            ])->get();
        else
            $lims_warehouse_list = DB::table('warehouses')
                                  ->where('is_active', true)
                                  ->where('pos_accnt_id', $pos_accnt_id)
                                  ->get();

        $html = '';
        foreach($lims_warehouse_list as $warehouse){
            $html .='<option value="'.$warehouse->id.'">'.$warehouse->name.'</option>';
        }

        return response()->json($html);
    }
}