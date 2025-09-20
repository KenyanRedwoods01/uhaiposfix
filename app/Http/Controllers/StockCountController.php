<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Warehouse;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use DB;
use App\Models\StockCount;
use Auth;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class StockCountController extends Controller
{
    // Get the logged in user's pos_accnt_id
    private function getPosAccntId()
    {
        return Auth::user()->pos_accnt_id;
    }

    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if( $role->hasPermissionTo('stock_count') ) {
            $pos_accnt_id = $this->getPosAccntId();
            
            // Filter all queries by pos_accnt_id
            $lims_warehouse_list = Warehouse::where('is_active', true)
                                  ->where('pos_accnt_id', $pos_accnt_id)
                                  ->get();
            
            $lims_brand_list = Brand::where('is_active', true)
                             ->where('pos_accnt_id', $pos_accnt_id)
                             ->get();
            
            $lims_category_list = Category::where('is_active', true)
                                ->where('pos_accnt_id', $pos_accnt_id)
                                ->get();
            
            $general_setting = DB::table('general_settings')
                             ->where('pos_accnt_id', $pos_accnt_id)
                             ->latest()
                             ->first();
            
            // Base query with pos_accnt_id filter
            $stockCountQuery = StockCount::orderBy('id', 'desc')
                              ->where('pos_accnt_id', $pos_accnt_id);
            
            // Additional filtering based on user role
            if(Auth::user()->role_id > 2 && $general_setting && $general_setting->staff_access == 'own') {
                $lims_stock_count_all = $stockCountQuery->where('user_id', Auth::id())->get();
            } else {
                $lims_stock_count_all = $stockCountQuery->get();
            }

            return view('backend.stock_count.index', compact('lims_warehouse_list', 'lims_brand_list', 'lims_category_list', 'lims_stock_count_all'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function store(Request $request)
    {
        $data = $request->all();
        $pos_accnt_id = $this->getPosAccntId();
        
        // Base product query with pos_accnt_id
        $productQuery = DB::table('products')
                      ->join('product_warehouse', 'products.id', '=', 'product_warehouse.product_id')
                      ->where('products.is_active', true)
                      ->where('product_warehouse.warehouse_id', $data['warehouse_id'])
                      ->where('products.pos_accnt_id', $pos_accnt_id)
                      ->where('product_warehouse.pos_accnt_id', $pos_accnt_id);
        
        // Apply additional filters based on category and brand
        if(isset($data['brand_id']) && isset($data['category_id'])) {
            $lims_product_list = $productQuery->whereIn('products.category_id', $data['category_id'])
                                             ->whereIn('products.brand_id', $data['brand_id'])
                                             ->select('products.name', 'products.code', 'product_warehouse.imei_number', 'product_warehouse.qty')
                                             ->get();

            $data['category_id'] = implode(",", $data['category_id']);
            $data['brand_id'] = implode(",", $data['brand_id']);
        }
        elseif(isset($data['category_id'])) {
            $lims_product_list = $productQuery->whereIn('products.category_id', $data['category_id'])
                                             ->select('products.name', 'products.code', 'product_warehouse.imei_number', 'product_warehouse.qty')
                                             ->get();

            $data['category_id'] = implode(",", $data['category_id']);
        }
        elseif(isset($data['brand_id'])) {
            $lims_product_list = $productQuery->whereIn('products.brand_id', $data['brand_id'])
                                             ->select('products.name', 'products.code', 'product_warehouse.imei_number', 'product_warehouse.qty')
                                             ->get();

            $data['brand_id'] = implode(",", $data['brand_id']);
        }
        else {
            $lims_product_list = $productQuery->select('products.name', 'products.code', 'product_warehouse.imei_number', 'product_warehouse.qty')
                                             ->get();
        }

        if(count($lims_product_list)) {
            $csvData = array('Product Name, Product Code, IMEI or Serial Numbers, Expected, Counted');
            foreach ($lims_product_list as $product) {
                $csvData[] = $product->name.','.$product->code.','.str_replace(",","/",$product->imei_number).','.$product->qty.','.'';
            }
            
            $filename = date('Ymd').'-'.date('his'). ".csv";
            $file_path = public_path().'/stock_count/'.$filename;
            $file = fopen($file_path, "w+");
            foreach ($csvData as $cellData) {
                fputcsv($file, explode(',', $cellData));
            }
            fclose($file);

            $data['user_id'] = Auth::id();
            $data['pos_accnt_id'] = $pos_accnt_id; // Set pos_accnt_id for new record
            $data['reference_no'] = 'scr-' . date("Ymd") . '-'. date("his");
            $data['initial_file'] = $filename;
            $data['is_adjusted'] = false;
            StockCount::create($data);
            
            return redirect()->back()->with('message', 'Stock Count created successfully! Please download the initial file to complete it.');
        }
        else
            return redirect()->back()->with('not_permitted', 'No product found!');
    }

    public function finalize(Request $request)
    {
        $ext = pathinfo($request->final_file->getClientOriginalName(), PATHINFO_EXTENSION);
        //checking if this is a CSV file
        if($ext != 'csv')
            return redirect()->back()->with('not_permitted', 'Please upload a CSV file');

        $data = $request->all();
        $document = $request->final_file;
        $documentName = date('Ymd').'-'.date('his'). ".csv";
        $document->move(public_path('stock_count/'), $documentName);
        $data['final_file'] = $documentName;
        
        $pos_accnt_id = $this->getPosAccntId();
        
        // Get stock count record with pos_accnt_id filter
        $lims_stock_count_data = StockCount::where('id', $data['stock_count_id'])
                                ->where('pos_accnt_id', $pos_accnt_id)
                                ->first();
        
        if ($lims_stock_count_data) {
            $lims_stock_count_data->update($data);
            return redirect()->back()->with('message', 'Stock Count finalized successfully!');
        } else {
            return redirect()->back()->with('not_permitted', 'Stock count record not found or you don\'t have permission to modify it!');
        }
    }

    public function stockDif($id)
    {
        $pos_accnt_id = $this->getPosAccntId();
        
        // Get stock count with pos_accnt_id filter
        $lims_stock_count_data = StockCount::where('id', $id)
                                ->where('pos_accnt_id', $pos_accnt_id)
                                ->first();
        
        if (!$lims_stock_count_data) {
            return [];
        }
        
        $file_handle = fopen('stock_count/'.$lims_stock_count_data->final_file, 'r');
        $i = 0;
        $temp_dif = -1000000;
        $data = [];
        $product = [];
        while(!feof($file_handle)) {
            $current_line = fgetcsv($file_handle);
            if($current_line && $i > 0 && ($current_line[3] != $current_line[4])) {
                // Find product with pos_accnt_id filter
                $product_data = Product::where('code', $current_line[1])
                              ->where('pos_accnt_id', $pos_accnt_id)
                              ->first();
                
                if(!$product_data) {
                    $product_data = Product::where('code', 'LIKE', "%{$current_line[1]}%")
                                  ->where('pos_accnt_id', $pos_accnt_id)
                                  ->first();
                }
                
                if($product_data) {
                    $product[] = $current_line[0].' ['.$product_data->code.']';
                    $expected[] = $current_line[3];
                    if($current_line[4]) {
                        $difference[] = $temp_dif = $current_line[4] - $current_line[3];
                        $counted[] = $current_line[4];
                    }
                    else {
                        $difference[] = $temp_dif = $current_line[3] * (-1);
                        $counted[] = 0;
                    }
                    $cost[] = $product_data->cost * $temp_dif;
                }
            }
            $i++;
        }
        
        if($temp_dif == -1000000) {
            $lims_stock_count_data->is_adjusted = true;
            $lims_stock_count_data->save();
        }
        
        if(count($product)) {
            $data[] = $product;
            $data[] = $expected;
            $data[] = $counted;
            $data[] = $difference;
            $data[] = $cost;
            $data[] = $lims_stock_count_data->is_adjusted;
        }
        
        return $data;
    }

    public function qtyAdjustment($id)
    {
        $pos_accnt_id = $this->getPosAccntId();
        
        // Get filtered warehouse list by pos_accnt_id
        $lims_warehouse_list = Warehouse::where('is_active', true)
                             ->where('pos_accnt_id', $pos_accnt_id)
                             ->get();
        
        // Get stock count with pos_accnt_id filter
        $lims_stock_count_data = StockCount::where('id', $id)
                                ->where('pos_accnt_id', $pos_accnt_id)
                                ->first();
        
        if (!$lims_stock_count_data) {
            return redirect()->back()->with('not_permitted', 'Stock count record not found or you don\'t have permission to modify it!');
        }
        
        $warehouse_id = $lims_stock_count_data->warehouse_id;
        $file_handle = fopen('stock_count/'.$lims_stock_count_data->final_file, 'r');
        $i = 0;
        $product_id = [];
        $names = [];
        $code = [];
        $qty = [];
        $action = [];
        
        while(!feof($file_handle)) {
            $current_line = fgetcsv($file_handle);
            if($current_line && $i > 0 && ($current_line[3] != $current_line[4])) {
                // Find product with pos_accnt_id filter
                $product_data = Product::where('code', $current_line[1])
                              ->where('pos_accnt_id', $pos_accnt_id)
                              ->first();
                
                if ($product_data) {
                    $product_id[] = $product_data->id;
                    $names[] = $current_line[0];
                    $code[] = $current_line[1];

                    if($current_line[4])
                        $temp_qty = $current_line[4] - $current_line[3];
                    else
                        $temp_qty = $current_line[3] * (-1);

                    if($temp_qty < 0) {
                        $qty[] = $temp_qty * (-1);
                        $action[] = '-';
                    }
                    else {
                        $qty[] = $temp_qty;
                        $action[] = '+';
                    }
                }
            }
            $i++;
        }
        
        return view('backend.stock_count.qty_adjustment', compact('lims_warehouse_list', 'warehouse_id', 'id', 'product_id', 'names', 'code', 'qty', 'action'));
    }
    
    public function destroy($id)
    {
        $pos_accnt_id = $this->getPosAccntId();
        
        // Find stock count with pos_accnt_id filter
        $stock_count = StockCount::where('id', $id)
                     ->where('pos_accnt_id', $pos_accnt_id)
                     ->first();
        
        if ($stock_count) {
            // Implement delete logic if needed
        } else {
            return redirect()->back()->with('not_permitted', 'Stock count record not found or you don\'t have permission to delete it!');
        }
    }
}