<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Roles;
use App\Models\Biller;
use App\Models\Warehouse;
use App\Models\CustomerGroup;
use App\Models\Customer;
use DB;
use Auth;
use Hash;
use Keygen;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Mail\UserDetails;
use Mail;
use App\Models\MailSetting;

class UserController extends Controller
{
    use \App\Traits\MailInfo;

   public function index()
{
    $role = Role::find(Auth::user()->role_id);

    if ($role->hasPermissionTo('users-index')) {
        $permissions = Role::findByName($role->name)->permissions;
        foreach ($permissions as $permission)
            $all_permission[] = $permission->name;

        // Fetch the logged-in admin's pos_accnt_id
        $admin_pos_accnt_id = Auth::user()->pos_accnt_id;

        // Get the users whose pos_accnt_id matches the admin's pos_accnt_id
        $lims_user_list = User::where('is_deleted', false)
            ->where('pos_accnt_id', $admin_pos_accnt_id)
            ->get();

        $numberOfUserAccount = User::where('is_active', true)->count();

        return view('backend.user.index', compact('lims_user_list', 'all_permission', 'numberOfUserAccount'));
    } else {
        return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }
}


    public function create()
{
    $role = Role::find(Auth::user()->role_id);
    if($role->hasPermissionTo('users-add')){
        // Get the logged-in admin's pos_accnt_id for multi-tenancy filtering
        $adminPosAccntId = Auth::user()->pos_accnt_id;
        
        // Filter all data based on the admin's pos_accnt_id
        $lims_role_list = Roles::where('is_active', true)
                               ->where('pos_accnt_id', $adminPosAccntId)
                               ->get();
        
        $lims_biller_list = Biller::where('is_active', true)
                                 ->where('pos_accnt_id', $adminPosAccntId)
                                 ->get();
        
        $lims_warehouse_list = Warehouse::where('is_active', true)
                                      ->where('pos_accnt_id', $adminPosAccntId)
                                      ->get();
        
        $lims_customer_group_list = CustomerGroup::where('is_active', true)
                                                ->where('pos_accnt_id', $adminPosAccntId)
                                                ->get();
        
        $numberOfUserAccount = User::where('is_active', true)
                                 ->where('pos_accnt_id', $adminPosAccntId)
                                 ->count();
        
        return view('backend.user.create', compact('lims_role_list', 'lims_biller_list', 'lims_warehouse_list', 'lims_customer_group_list', 'numberOfUserAccount'));
    }
    else
        return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
}

    public function generatePassword()
    {
        $id = Keygen::numeric(6)->generate();
        return $id;
    }

    public function store(Request $request)
{
    $this->validate($request, [
        'name' => [
            'max:255',
            Rule::unique('users')->where(function ($query) {
                return $query->where('is_deleted', false);
            }),
        ],
        'email' => [
            'email',
            'max:255',
            Rule::unique('users')->where(function ($query) {
                return $query->where('is_deleted', false);
            }),
        ],
    ]);

    if ($request->role_id == 5) {
        $this->validate($request, [
            'phone_number' => [
                'max:255',
                Rule::unique('customers')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
        ]);
    }

    // Fetch pos_accnt_id from the request (or from the logged-in admin)
    $admin_pos_accnt_id = Auth::user()->pos_accnt_id;  // Default to the logged-in admin's pos_accnt_id
    if ($request->has('pos_accnt_id')) {
        $admin_pos_accnt_id = $request->input('pos_accnt_id');  // Use form value if provided
    }

    $data = $request->all();
    $message = 'User created successfully';

    $mail_setting = MailSetting::latest()->first();
    if ($mail_setting) {
        $this->setMailInfo($mail_setting);
        try {
            Mail::to($data['email'])->send(new UserDetails($data));
        } catch (\Exception $e) {
            $message = 'User created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
        }
    }

    if (!isset($data['is_active'])) {
        $data['is_active'] = false;
    }

    // Insert admin's pos_accnt_id into the new user record
    $data['pos_accnt_id'] = $admin_pos_accnt_id;  // Ensure pos_accnt_id is the same as admin's

    $data['is_deleted'] = false;
    $data['password'] = bcrypt($data['password']);
    $data['phone'] = $data['phone_number'];

    // Create the user
    $user_data = User::create($data);

    if ($data['role_id'] == 5) {
        $data['user_id'] = $user_data->id;
        $data['name'] = $data['customer_name'];
        $data['phone_number'] = $data['phone'];
        $data['is_active'] = true;

        // Create the customer with the same pos_accnt_id
        $data['pos_accnt_id'] = $admin_pos_accnt_id;  // Ensure customer has the same pos_accnt_id

        Customer::create($data);
    }

    return redirect('user')->with('message1', $message);
}


    public function edit($id)
{
    $role = Role::find(Auth::user()->role_id);
    if($role->hasPermissionTo('users-edit')){
        // Get the logged in admin's pos_accnt_id
        $admin_pos_accnt_id = Auth::user()->pos_accnt_id;
        
        // Find the user but ensure it belongs to the same account as admin
        $lims_user_data = User::where('id', $id)
                              ->where('pos_accnt_id', $admin_pos_accnt_id)
                              ->first();
        
        // If no matching user found, return with not permitted message
        if(!$lims_user_data) {
            return redirect()->back()->with('not_permitted', 'Sorry! You do not have access to this user');
        }
        
        // Filter all lists by admin's pos_accnt_id
        $lims_role_list = Roles::where('is_active', true)
                               ->where('pos_accnt_id', $admin_pos_accnt_id)
                               ->get();
        $lims_biller_list = Biller::where('is_active', true)
                                  ->where('pos_accnt_id', $admin_pos_accnt_id)
                                  ->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)
                                        ->where('pos_accnt_id', $admin_pos_accnt_id)
                                        ->get();
        
        return view('backend.user.edit', compact('lims_user_data', 'lims_role_list', 'lims_biller_list', 'lims_warehouse_list'));
    }
    else
        return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
}

public function update(Request $request, $id)
{
    if(!env('USER_VERIFIED'))
        return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');
    
    // Get the logged in admin's pos_accnt_id
    $admin_pos_accnt_id = Auth::user()->pos_accnt_id;
    
    // Check if the user being updated belongs to the admin's account
    $lims_user_data = User::where('id', $id)
                          ->where('pos_accnt_id', $admin_pos_accnt_id)
                          ->first();
    
    if(!$lims_user_data) {
        return redirect()->back()->with('not_permitted', 'Sorry! You do not have access to this user');
    }
    
    $this->validate($request, [
        'name' => [
            'max:255',
            Rule::unique('users')->ignore($id)->where(function ($query) use ($admin_pos_accnt_id) {
                return $query->where('is_deleted', false)
                             ->where('pos_accnt_id', $admin_pos_accnt_id);
            }),
        ],
        'email' => [
            'email',
            'max:255',
                Rule::unique('users')->ignore($id)->where(function ($query) use ($admin_pos_accnt_id) {
                return $query->where('is_deleted', false)
                             ->where('pos_accnt_id', $admin_pos_accnt_id);
            }),
        ],
    ]);
    
    $input = $request->except('password');
    
    // Ensure the pos_accnt_id stays the same as the admin's
    $input['pos_accnt_id'] = $admin_pos_accnt_id;
    
    if(!isset($input['is_active']))
        $input['is_active'] = false;
    if(!empty($request['password']))
        $input['password'] = bcrypt($request['password']);
    
    $lims_user_data->update($input);
    cache()->forget('user_role');
    return redirect('user')->with('message2', 'Data updated successfullly');
}

    public function superadminProfile($id)
    {
        $lims_user_data = User::find($id);
        return view('landlord.profile', compact('lims_user_data'));
    }

    public function profile($id)
    {
        $lims_user_data = User::find($id);
        return view('backend.user.profile', compact('lims_user_data'));
    }

    public function profileUpdate(Request $request, $id)
    {
        if(!env('USER_VERIFIED'))
            return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');

        $input = $request->all();
        $lims_user_data = User::find($id);
        $lims_user_data->update($input);
        return redirect()->back()->with('message3', 'Data updated successfullly');
    }

    public function changePassword(Request $request, $id)
    {
        if(!env('USER_VERIFIED'))
            return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');

        $input = $request->all();
        $lims_user_data = User::find($id);
        if($input['new_pass'] != $input['confirm_pass'])
            return redirect("user/" .  "profile/" . $id )->with('message2', "Please Confirm your new password");

        if (Hash::check($input['current_pass'], $lims_user_data->password)) {
            $lims_user_data->password = bcrypt($input['new_pass']);
            $lims_user_data->save();
        }
        else {
            return redirect("user/" .  "profile/" . $id )->with('message1', "Current Password doesn't match");
        }
        auth()->logout();
        return redirect('/');
    }

    public function deleteBySelection(Request $request)
    {
        $user_id = $request['userIdArray'];
        foreach ($user_id as $id) {
            $lims_user_data = User::find($id);
            $lims_user_data->is_deleted = true;
            $lims_user_data->is_active = false;
            $lims_user_data->save();
        }
        return 'User deleted successfully!';
    }

    public function destroy($id)
    {
        if(!env('USER_VERIFIED'))
            return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');

        $lims_user_data = User::find($id);
        $lims_user_data->is_deleted = true;
        $lims_user_data->is_active = false;
        $lims_user_data->save();
        if(Auth::id() == $id){
            auth()->logout();
            return redirect('/login');
        }
        else
            return redirect('user')->with('message3', 'Data deleted successfullly');
    }

    public function notificationUsers()
    {
        $notification_users = DB::table('users')->where([
            ['is_active', true],
            ['id', '!=', \Auth::user()->id],
            ['role_id', '!=', '5']
        ])->get();

        $html = '';
        foreach($notification_users as $user){
            $html .='<option value="'.$user->id.'">'.$user->name . ' (' . $user->email. ')'.'</option>';
        }

        return response()->json($html);
    }

    public function allUsers()
    {
        $lims_user_list = DB::table('users')->where('is_active', true)->get();

        $html = '';
        foreach($lims_user_list as $user){
            $html .='<option value="'.$user->id.'">'.$user->name . ' (' . $user->phone. ')'.'</option>';
        }

        return response()->json($html);
    }
}
