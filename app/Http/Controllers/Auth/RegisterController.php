<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use App\Models\Customer;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Validation\Rule;
use App\Models\Roles;
use App\Models\CustomerGroup;
use App\Models\Biller;
use App\Models\Warehouse;
use Illuminate\Support\Facades\DB;


class RegisterController extends Controller
{


    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Show the application registration form.
     *
     * @return \Illuminate\View\View
     */
public function showRegistrationForm()
{

    // Existing logic to fetch other records
    $lims_role_list = Roles::where('is_active', true)->get();
    $lims_customer_group_list = CustomerGroup::where('is_active', true)->get();
    $lims_biller_list = Biller::where('is_active', true)->get();
    $lims_warehouse_list = Warehouse::where('is_active', true)->get();
    $numberOfUserAccount = User::where('is_active', true)->count();

    return view('backend.auth.register', compact(
        'lims_role_list', 
        'lims_customer_group_list', 
        'lims_biller_list', 
        'lims_warehouse_list', 
        'numberOfUserAccount',
    ));
}




    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|string|max:255|unique:users',
            'email' => [
                'email',
                'max:255',
                    Rule::unique('users')->where(function ($query) {
                    return $query->where('is_deleted', false);
                }),
            ],
            'password' => 'required|string|confirmed',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
{
    $data['is_active'] = false;
    $user = User::create([
        'name' => $data['name'],
        'email' => $data['email'],
        'phone' => $data['phone_number'],
        'company_name' => $data['company_name'],
        'role_id' => $data['role_id'] == 1 ? 1 : null, // Only allow 'role_id' to be set if admin
        'pos_accnt_id' => $data['account_id'],
        'biller_id' => $data['biller_id'],
        'warehouse_id' => $data['warehouse_id'],
        'is_active' => $data['is_active'],
        'is_deleted' => false,
        'password' => bcrypt($data['password']),
    ]);

    if ($data['role_id'] == 5) {
        $data['name'] = $data['customer_name'];
        $data['user_id'] = $user->id;
        $data['is_active'] = true;
        Customer::create($data);
    }

    return $user;
}

}
