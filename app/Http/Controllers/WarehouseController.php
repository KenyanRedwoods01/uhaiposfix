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
        // Ownership: only fetch warehouses that belong to the current account
        $posAccntId = Auth::user()->pos_accnt_id;

        $lims_warehouse_all = Warehouse::where('is_active', true)
                                       ->where('pos_accnt_id', $posAccntId)
                                       ->get();

        $numberOfWarehouse = Warehouse::where('is_active', true)
                                      ->where('pos_accnt_id', $posAccntId)
                                      ->count();

        // Fixed view: should point to index instead of create
        return view('backend.warehouse.index', compact('lims_warehouse_all', 'numberOfWarehouse'));
    }

    public function store(Request $request)
    {
        // Validation: uniqueness scoped by pos_accnt_id
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

        return redirect('warehouse')->with('message', 'Warehouse created successfully');
    }

    public function edit($id)
    {
        $posAccntId = Auth::user()->pos_accnt_id;

        // Ownership enforced here
        $lims_warehouse_data = Warehouse::where('id', $id)
                                        ->where('pos_accnt_id', $posAccntId)
                                        ->firstOrFail();

        return $lims_warehouse_data;
    }

    public function update(Request $request, $id)
    {
        $posAccntId = Auth::user()->pos_accnt_id;

        // Validation: changed ignore() to use route param $id instead of $request->warehouse_id
        $this->validate($request, [
            'name' => [
                'max:255',
                Rule::unique('warehouses')->ignore($id)->where(function ($query) {
                    return $query->where('is_active', 1)
                                 ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
                }),
            ],
        ]);

        $input = $request->all();

        // Ownership enforced here
        $lims_warehouse_data = Warehouse::where('id', $id)
                                        ->where('pos_accnt_id', $posAccntId)
                                        ->firstOrFail();

        $lims_warehouse_data->update($input);

        $this->cacheForget('warehouse_list');

        return redirect('warehouse')->with('message', 'Warehouse updated successfully');
    }

    public function importWarehouse(Request $request)
    {
        $posAccntId = Auth::user()->pos_accnt_id;

        $upload = $request->file('file');
        $ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);

        if ($ext != 'csv') {
            return redirect()->back()->with('not_permitted', 'Please upload a CSV file');
        }

        $filePath = $upload->getRealPath();
        $file = fopen($filePath, 'r');
        $header = fgetcsv($file);

        $escapedHeader = [];
        foreach ($header as $key => $value) {
            $lheader = strtolower($value);
            $escapedItem = preg_replace('/[^a-z]/', '', $lheader);
            array_push($escapedHeader, $escapedItem);
        }

        // Loop rows
        while ($columns = fgetcsv($file)) {
            if ($columns[0] == "") {
                continue;
            }

            $data = array_combine($escapedHeader, $columns);

            $warehouse = Warehouse::firstOrNew([
                'name' => $data['name'],
                'pos_accnt_id' => $posAccntId,
                'is_active' => true
            ]);

            $warehouse->name = $data['name'];
            $warehouse->phone = $data['phone'];
            $warehouse->email = $data['email'];
            $warehouse->address = $data['address'];
            $warehouse->pos_accnt_id = $posAccntId;
            $warehouse->is_active = true;
            $warehouse->save();
        }

        $this->cacheForget('warehouse_list');

        return redirect('warehouse')->with('message', 'Warehouses imported successfully');
    }

    public function deleteBySelection(Request $request)
    {
        $posAccntId = Auth::user()->pos_accnt_id;
        $warehouseIds = $request['warehouseIdArray'];

        foreach ($warehouseIds as $id) {
            $lims_warehouse_data = Warehouse::where('id', $id)
                                            ->where('pos_accnt_id', $posAccntId)
                                            ->first();

            if ($lims_warehouse_data) {
                $lims_warehouse_data->is_active = false;
                $lims_warehouse_data->save();
            }
        }

        $this->cacheForget('warehouse_list');

        return response()->json(['message' => 'Warehouses deleted successfully']);
    }

    public function destroy($id)
    {
        $posAccntId = Auth::user()->pos_accnt_id;

        // Ownership enforced here
        $lims_warehouse_data = Warehouse::where('id', $id)
                                        ->where('pos_accnt_id', $posAccntId)
                                        ->firstOrFail();

        $lims_warehouse_data->is_active = false;
        $lims_warehouse_data->save();

        $this->cacheForget('warehouse_list');

        return redirect('warehouse')->with('message', 'Warehouse deleted successfully');
    }

    public function warehouseAll()
    {
        $posAccntId = Auth::user()->pos_accnt_id;

        // Role-based check: non-admins only see their assigned warehouse
        if (Auth::user()->role_id > 2) {
            $lims_warehouse_list = DB::table('warehouses')->where([
                ['is_active', true],
                ['id', Auth::user()->warehouse_id],
                ['pos_accnt_id', $posAccntId]
            ])->get();
        } else {
            $lims_warehouse_list = DB::table('warehouses')
                                     ->where('is_active', true)
                                     ->where('pos_accnt_id', $posAccntId)
                                     ->get();
        }

        // Build options HTML
        $html = '';
        foreach ($lims_warehouse_list as $warehouse) {
            $html .= '<option value="'.$warehouse->id.'">'.$warehouse->name.'</option>';
        }

        return response()->json($html);
    }
}
