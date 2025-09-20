<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CustomerGroup;
use App\Models\Customer;
use App\Models\Deposit;
use App\Models\User;
use App\Models\Supplier;
use App\Models\Sale;
use App\Models\Payment;
use App\Models\CashRegister;
use App\Models\Account;
use App\Models\MailSetting;
use Auth;
use DB;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Mail\CustomerCreate;
use App\Mail\SupplierCreate;
use App\Mail\CustomerDeposit;
use Mail;
use App\Models\CustomField;
use League\Csv\Reader;


class CustomerController extends Controller
{
    use \App\Traits\CacheForget;
    use \App\Traits\MailInfo;

    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('customers-index')){
            $permissions = Role::findByName($role->name)->permissions;
            foreach ($permissions as $permission)
                $all_permission[] = $permission->name;
            if(empty($all_permission))
                $all_permission[] = 'dummy text';
            $custom_fields = CustomField::where([
                                ['belongs_to', 'customer'],
                                ['is_table', true]
                            ])->pluck('name');
            $field_name = [];
            foreach($custom_fields as $fieldName) {
                $field_name[] = str_replace(" ", "_", strtolower($fieldName));
            }
            return view('backend.customer.index', compact('all_permission', 'custom_fields', 'field_name'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    


   public function customerData(Request $request)
    {
       // Get the logged-in admin's pos_accnt_id
    $admin_pos_accnt_id = Auth::user()->pos_accnt_id;

    // Query the customers where pos_accnt_id matches the logged-in admin's pos_accnt_id
   $q = Customer::where('pos_accnt_id', $admin_pos_accnt_id)
             ->whereIn('is_active', [1, 2])
             ->select('id', 'customer_group_id', 'name', 'company_name', 'email', 'phone_number', 
                      'address', 'city', 'country', 'points', 'deposit', 'expense', 'location', 
                      'origin', 'sub_county', 'ward', 'sublocation', 'village', 'next_of_kin', 
                      'MemberNo', 'next_of_kin_mobile', 'next_of_kin_relationship', 'INPL', 'assigned', 'is_active');


    $totalData = $q->count();
    $totalFiltered = $totalData;

    $limit = $request->input('length') != -1 ? $request->input('length') : $totalData;
    $start = $request->input('start');
    $order = 'created_at';
    $dir = $request->input('order.0.dir');

    $q = $q->offset($start)->limit($limit)->orderBy($order, $dir);

        if($request->input('length') != -1)
            $limit = $request->input('length');
        else
            $limit = $totalData;
        $start = $request->input('start');
        $order = 'created_at';
        $dir = $request->input('order.0.dir');
        //fetching custom fields data
        $custom_fields = CustomField::where([
                        ['belongs_to', 'customer'],
                        ['is_table', true]
                    ])->pluck('name');
        $field_names = [];
        foreach($custom_fields as $fieldName) {
            $field_names[] = str_replace(" ", "_", strtolower($fieldName));
        }

        $q = $q->offset($start)
            ->limit($limit)
            ->orderBy($order, $dir);
        if(empty($request->input('search.value'))) {
            $customers = $q->get();
        }
        else
       {
    $search = $request->input('search.value');
    $q = $q
        ->with('discountPlans', 'customerGroup')
        ->where('customers.name', 'LIKE', "%{$search}%")
        ->orwhere('customers.MemberNo', 'LIKE', "%{$search}%");
    foreach ($field_names as $key => $field_name) {
        $q = $q->orwhere('customers.' . $field_name, 'LIKE', "%{$search}%");
    }
    $customers = $q->get();
    $totalFiltered = $q->count();
}

        $data = array();
        if(!empty($customers))
        {
            foreach ($customers as $key=>$customer)
            {
                $nestedData['id'] = $customer->id;
                $nestedData['key'] = $key;
                
                $nestedData['customer_group'] = $customer->customerGroup->name;

                $nestedData['customer_details'] = 'Name: '.$customer->name;

if ($customer->email) {
    $nestedData['customer_details'] .= '<br>Email: '.$customer->email;
}

$nestedData['customer_details'] .= '<br>Phone: '.$customer->phone_number.'<br>Member No: '.$customer->MemberNo;

               

                $nestedData['discount_plan'] = '';
                foreach($customer->discountPlans as $index => $discount_plan) {
                    if($index)
                        $nestedData['discount_plan'] .= ', '.$discount_plan->name;
                    else
                        $nestedData['discount_plan'] .= $discount_plan->name;
                }

                $nestedData['reward_point'] = $customer->points;
                $nestedData['deposited_balance'] = number_format($customer->deposit - $customer->expense, 2);

                $returned_amount = DB::table('sales')
                                    ->join('returns', 'sales.id', '=', 'returns.sale_id')
                                    ->where([
                                        ['sales.customer_id', $customer->id],
                                        ['sales.payment_status', '!=', 4]
                                    ])
                                    ->sum('returns.grand_total');
                $saleData = DB::table('sales')->where([
                                ['customer_id', $customer->id],
                                ['payment_status', '!=', 4]
                            ])
                            ->selectRaw('SUM(grand_total) as grand_total,SUM(paid_amount) as paid_amount')
                            ->first();
                $nestedData['total_due'] = number_format($saleData->grand_total - $returned_amount - $saleData->paid_amount, 2);
                                $nestedData['location'] = $customer->location; //  'location' is a column in database

                                 $nestedData['origin'] = $customer->origin; // Country
            $nestedData['sub_county'] = $customer->sub_county;
            $nestedData['ward'] = $customer->ward;
                        $nestedData['sublocation'] = $customer->sublocation;
                        $nestedData['village'] = $customer->village;
$nestedData['next_of_kin'] = $customer->next_of_kin;
$nestedData['MemberNo'] = $customer->MemberNo;
$nestedData['next_of_kin_mobile'] = $customer->next_of_kin_mobile;
$nestedData['next_of_kin_relationship'] = $customer->next_of_kin_relationship;
$nestedData['INPL'] = $customer->INPL;
$nestedData['assigned'] = $customer->assigned;
$nestedData['status'] = $customer->is_active == 1 
    ? '<button class="btn btn-success toggle-status" data-id="'.$customer->id.'" data-status="1">Active</button>' 
    : '<button class="btn btn-danger toggle-status" data-id="'.$customer->id.'" data-status="2">Inactive</button>';


    
                //fetching custom fields data
                foreach($field_names as $field_name) {
                    $nestedData[$field_name] = $customer->$field_name;
                }

                $nestedData['options'] = '<div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.trans("file.action").'
                              <span class="caret"></span>
                              <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">';

                if(in_array("customers-edit", $request['all_permission'])){
                    $nestedData['options'] .= '<li>
                        <a href="'.route('customer.edit', $customer->id).'" class="btn btn-link"><i class="dripicons-document-edit"></i> '.trans('file.edit').'</a>
                        </li>';
                }

    
               
                if(in_array("customers-delete", $request['all_permission']))
                    $nestedData['options'] .= \Form::open(["route" => ["customer.destroy", $customer->id], "method" => "DELETE"] ).'
                            <li>
                              <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> '.trans("file.delete").'</button>
                            </li>'.\Form::close().'
                        </ul>
                    </div>';

                $data[] = $nestedData;
            }
        }
        $json_data = array(
            "draw"            => intval($request->input('draw')),
            "recordsTotal"    => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data"            => $data
        );
        echo json_encode($json_data);
    }

 public function updateStatus(Request $request)
{
    $customer = Customer::find($request->id);

    if (!$customer) {
        return response()->json(['success' => false, 'message' => 'Customer not found']);
    }

    // Store the previous status (before update)
    $previousStatus = $customer->is_active;

    // Update the status
    $customer->is_active = $request->status;
    $customer->save();

    // If status changes from 2 (inactive) to 1 (active), send an email
    if ($previousStatus == 2 && $customer->is_active == 1) {
        $this->sendStatusChangeEmail($customer);
    }

    return response()->json(['success' => true]);
}

protected function sendStatusChangeEmail($customer)
{
    // Assuming you have a mail template for customer status change
    try {
        $mailSetting = MailSetting::latest()->first();
        if ($customer->email && $mailSetting) {
            $this->setMailInfo($mailSetting);  // Set up the mail information (smtp settings, etc.)
            Mail::to($customer->email)->send(new CustomerCreate($customer));  // Send email to customer
        }
    } catch (\Exception $e) {
        // Handle error if email fails
        // Optionally log the error or send a fallback message
    }
}


    public function clearDue(Request $request)
    {
        $lims_due_sale_data = Sale::select('id', 'warehouse_id', 'grand_total', 'paid_amount', 'payment_status')
                            ->where([
                                ['payment_status', '!=', 4],
                                ['customer_id', $request->customer_id]
                            ])->get();
        //return $lims_due_sale_data;
        $total_paid_amount = $request->amount;
        foreach ($lims_due_sale_data as $key => $sale_data) {
            if($total_paid_amount == 0)
                break;
            $due_amount = $sale_data->grand_total - $sale_data->paid_amount;
            $lims_cash_register_data =  CashRegister::select('id')
                                        ->where([
                                            ['user_id', Auth::id()],
                                            ['warehouse_id', $sale_data->warehouse_id],
                                            ['status', 1]
                                        ])->first();
            if($lims_cash_register_data)
                $cash_register_id = $lims_cash_register_data->id;
            else
                $cash_register_id = null;
            $account_data = Account::select('id')->where('is_default', 1)->first();
            if($total_paid_amount >= $due_amount) {
                $paid_amount = $due_amount;
                $payment_status = 4;
            }
            else {
                $paid_amount = $total_paid_amount;
                $payment_status = 2;
            }
            Payment::create([
                'payment_reference' => 'spr-'.date("Ymd").'-'.date("his"),
                'sale_id' => $sale_data->id,
                'user_id' => Auth::id(),
                'cash_register_id' => $cash_register_id,
                'account_id' => $account_data->id,
                'amount' => $paid_amount,
                'change' => 0,
                'paying_method' => 'Cash',
                'payment_note' => $request->note
            ]);
            $sale_data->paid_amount += $paid_amount;
            $sale_data->payment_status = $payment_status;
            $sale_data->save();
            $total_paid_amount -= $paid_amount;
        }
        return redirect()->back()->with('message', 'Due cleared successfully');
    }

    public function create()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('customers-add')){
            $lims_customer_group_all = CustomerGroup::where('is_active',true)->get();
            $custom_fields = CustomField::where('belongs_to', 'customer')->get();
            return view('backend.customer.create', compact('lims_customer_group_all', 'custom_fields'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }


    public function store(Request $request)
{
     $this->validate($request, [
        'phone_number' => [
            'required',
            'max:255',
            Rule::unique('customers')->where(function ($query) {
                return $query->where('is_active', 1);
            }),
        ],
        'email' => [
            'nullable',
            'email',
            'max:255',
            Rule::unique('customers')->where(function ($query) {
                return $query->where('is_active', 1);
            }),
        ],
        'location' => 'nullable|string|max:255',
        'origin' => 'nullable|string|max:255',
        'sub_county' => 'nullable|string|max:255',
        'ward' => 'nullable|string|max:255',
        'sublocation' => 'nullable|string|max:255',
        'village' => 'nullable|string|max:255',
        'next_of_kin' => 'nullable|string|max:255',
        'next_of_kin_mobile' => 'nullable|string|max:255',
        'next_of_kin_relationship' => 'nullable|string|max:255',
        'INPL' => 'nullable|string|max:255',
        'customer_group_id' => 'nullable|string|max:255',
        'assigned' => 'nullable|string|max:255',
    ], [
        // Custom error messages
        'phone_number.unique' => 'This phone number is already registered with another active customer.',
        'email.unique' => 'This email address is already registered with another active customer.',
        'phone_number.required' => 'Phone number is required.',
        'email.email' => 'Please enter a valid email address.',
    ]);

    
    
    //validation for supplier if create both user and supplier
    if (isset($request->both)) {
        $this->validate($request, [
            'company_name' => [
                'max:255',
                Rule::unique('suppliers')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
            'nullable|email' => [
                'max:255',
                Rule::unique('suppliers')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
        ]);
    }
    
    //validation for user if given user access
    if (isset($request->user)) {
        $this->validate($request, [
            'name' => [
                'max:255',
                Rule::unique('users')->where(function ($query) {
                    return $query->where('is_deleted', false);
                }),
            ],
            'email' => [
                'nullable|email',
                Rule::unique('users')->where(function ($query) {
                    return $query->where('is_deleted', false);
                }),
            ],
        ]);
    }

    // Get the logged-in admin's pos_accnt_id
    $admin_pos_accnt_id = Auth::user()->pos_accnt_id;

    // Include pos_accnt_id in customer data
    $customer_data = $request->all();
    $customer_data['pos_accnt_id'] = $admin_pos_accnt_id;
    
    $customer_group = CustomerGroup::find($customer_data['customer_group_id']);

    if ($customer_data['email']) {
        $maxMemberNo = Customer::max('MemberNo');

        // If no MemberNos exist, set to 1, otherwise increment the max MemberNo
        $nextMemberNo = $maxMemberNo ? (int)$maxMemberNo + 1 : 1;

        // Format the next MemberNo to be 5 digits with leading zeros
        $newMemberNo = str_pad($nextMemberNo, 5, '0', STR_PAD_LEFT);

        $customer_data['MemberNo'] = $newMemberNo;
    } else {
        $customer_data['MemberNo'] = null;
    }

    $customer_data['is_active'] = true;
    $prefixMessage = 'Customer';
    
    if (isset($request->user)) {
        $customer_data['phone'] = $customer_data['phone_number'];
        $customer_data['role_id'] = 5;
        $customer_data['is_deleted'] = false;
        $customer_data['password'] = bcrypt($customer_data['password']);
        $user = User::create($customer_data);
        $customer_data['user_id'] = $user->id;
        $prefixMessage .= ', User';
    }
    
    $customer_data['name'] = $customer_data['customer_name'];
    
    if (isset($request->both)) {
        Supplier::create($customer_data);
        $prefixMessage .= ' and Supplier';
    }

    $fullMessage = $prefixMessage . ' created successfully!';
    $mail_setting = MailSetting::latest()->first();
    $message = $this->mailAction($customer_data, $mail_setting, $request, $fullMessage);

    if ($customer_data['email'] && $mail_setting && strtolower($customer_group->name) !== 'walk-in customer') {
        $this->setMailInfo($mail_setting);
        try {
            Mail::to($customer_data['email'])->send(new CustomerCreate($customer_data));
            if (isset($request->both))
                Mail::to($customer_data['email'])->send(new SupplierCreate($customer_data));
            $message .= ' created successfully!';
        } catch (\Exception $e) {
            $message .= ' created successfully. Please check your mail.';
        }
    } else {
        $message .= ' created successfully!';
    }

    $lims_customer_data = Customer::create($customer_data);

    // SMS Integration - Send SMS notification after customer creation
    // SMS API configuration
    $apikey = '8addf9a149d670ad5132a45c3bdff8b4';
    $partnerID = '9464';
    $shortcode = 'DENLA LTD';
    $domain = 'https://sms.textsms.co.ke/';

    // Send SMS notification if customer has phone number and member number
    if (!empty($customer_data['phone_number']) && !empty($customer_data['MemberNo'])) {
        try {
            // Format phone number to 254 format
            $phoneNumber = $this->formatPhoneNumber($customer_data['phone_number']);
            
            // Prepare SMS message
            $smsMessage = "Welcome to UHAI AFRICA! Your membership has been created successfully. Your Member Number is: " . $customer_data['MemberNo'] . ". Thank you for joining us!";
            
            // Prepare SMS data
            $smsData = [
                'apikey' => $apikey,
                'partnerID' => $partnerID,
                'mobile' => $phoneNumber,
                'message' => $smsMessage,
                'shortcode' => $shortcode,
                'pass_type' => 'plain'
            ];
            
            // Send SMS via cURL
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $domain . 'api/services/sendsms/');
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($smsData));
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/json',
                'Content-Length: ' . strlen(json_encode($smsData))
            ]);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_TIMEOUT, 30);
            
            $smsResponse = curl_exec($ch);
            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);
            
            // Log SMS response (optional)
            if ($httpCode == 200) {
                \Log::info('SMS sent successfully to ' . $phoneNumber . ' for customer: ' . $customer_data['name']);
            } else {
                \Log::warning('SMS failed to send to ' . $phoneNumber . ' - HTTP Code: ' . $httpCode);
            }
            
        } catch (\Exception $e) {
            // Log SMS error but don't break the customer creation process
            \Log::error('SMS sending failed: ' . $e->getMessage());
        }
    }

    //inserting data for custom fields
    $custom_field_data = [];
    $custom_fields = CustomField::where('belongs_to', 'customer')->select('name', 'type')->get();
    foreach ($custom_fields as $type => $custom_field) {
        $field_name = str_replace(' ', '_', strtolower($custom_field->name));
        if (isset($customer_data[$field_name])) {
            if ($custom_field->type == 'checkbox' || $custom_field->type == 'multi_select')
                $custom_field_data[$field_name] = implode(",", $customer_data[$field_name]);
            else
                $custom_field_data[$field_name] = $customer_data[$field_name];
        }
    }
    
    if (count($custom_field_data))
        DB::table('customers')->where('id', $lims_customer_data->id)->update($custom_field_data);
    
    $this->cacheForget('customer_list');
    $customerInfo['id'] = $lims_customer_data->id;
    $customerInfo['name'] = $lims_customer_data->name;
    $customerInfo['phone_number'] = $lims_customer_data->phone_number;
    
    if ($customer_data['pos'])
        return $customerInfo;
    else
        return redirect('customer')->with('create_message', $message);
}

// Helper method to format phone numbers - Add this to your controller class
private function formatPhoneNumber($phone)
{
    // Remove any spaces, dashes, or other non-numeric characters
    $phone = preg_replace('/[^0-9]/', '', $phone);
    
    // Handle different phone number formats for Kenya
    if (strlen($phone) == 10 && substr($phone, 0, 1) == '0') {
        // Format: 0712345678 -> 254712345678
        return '254' . substr($phone, 1);
    } elseif (strlen($phone) == 9) {
        // Format: 712345678 -> 254712345678
        return '254' . $phone;
    } elseif (strlen($phone) == 12 && substr($phone, 0, 3) == '254') {
        // Already in 254 format
        return $phone;
    } elseif (strlen($phone) == 13 && substr($phone, 0, 4) == '+254') {
        // Format: +254712345678 -> 254712345678
        return substr($phone, 1);
    }
    
    // Return original if format is not recognized
    return $phone;
}
    

    public function edit($id)
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('customers-edit')){
            $lims_customer_data = Customer::find($id);
            $lims_customer_group_all = CustomerGroup::where('is_active',true)->get();
            $custom_fields = CustomField::where('belongs_to', 'customer')->get();
            return view('backend.customer.edit', compact('lims_customer_data','lims_customer_group_all', 'custom_fields'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'phone_number' => [
                'max:255',
                    Rule::unique('customers')->ignore($id)->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
        ]);

        $input = $request->all();
        $lims_customer_data = Customer::find($id);

        if(isset($input['user'])) {
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

            $input['phone'] = $input['phone_number'];
            $input['role_id'] = 5;
            $input['is_active'] = true;
            $input['is_deleted'] = false;
            $input['password'] = bcrypt($input['password']);
            $user = User::create($input);
            $input['user_id'] = $user->id;
            $message = 'Customer updated and user created successfully';
        }
        else {
            $message = 'Customer updated successfully';
        }

        $input['name'] = $input['customer_name'];
        $lims_customer_data->update($input);
        //update custom field data
        $custom_field_data = [];
        $custom_fields = CustomField::where('belongs_to', 'customer')->select('name', 'type')->get();
        foreach ($custom_fields as $type => $custom_field) {
            $field_name = str_replace(' ', '_', strtolower($custom_field->name));
            if(isset($input[$field_name])) {
                if($custom_field->type == 'checkbox' || $custom_field->type == 'multi_select')
                    $custom_field_data[$field_name] = implode(",", $input[$field_name]);
                else
                    $custom_field_data[$field_name] = $input[$field_name];
            }
        }
        if(count($custom_field_data))
            DB::table('customers')->where('id', $lims_customer_data->id)->update($custom_field_data);
        $this->cacheForget('customer_list');

        return redirect('customer')->with('edit_message', $message);
    }

public function importCustomer(Request $request)
{
    $role = Role::find(Auth::user()->role_id);
    if (!$role->hasPermissionTo('customers-add')) {
        return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    // Get csv file
    $upload = $request->file('file');
    $ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);
    if ($ext != 'csv') {
        return redirect()->back()->with('not_permitted', 'Please upload a valid CSV file.');
    }

    $filePath = $upload->getRealPath();
    $file = fopen($filePath, 'r');
    $header = fgetcsv($file);
    if (!$header) {
        fclose($file);
        return redirect()->back()->with('not_permitted', 'CSV file is empty or invalid.');
    }

    // Define column mappings (CSV header => Database field)
    $columnMapping = [
        'Customer Group' => 'customer_group',
        'Name' => 'name',
        'University' => 'company_name',
        'Email' => 'email',
        'Phone Number' => 'phone_number',
        'Phone Number 2' => 'tax_no',
        'Campus' => 'address',
        'Year of Study' => 'city',
        'Programme' => 'state',
        'Nationality' => 'postal_code',
        'Student ID' => 'country',  // Unique identifier
        'National ID' => 'location',
        'Country' => 'origin',
        'Sub County' => 'sub_county',
        'Ward' => 'ward',
        'Sublocation' => 'sublocation',
        'Village' => 'village',
        'Member Number' => 'MemberNo',
        'Next of Kin - Name' => 'next_of_kin',
        'Next of Kin - Mobile' => 'next_of_kin_mobile',
        'Next of Kin - Relationship' => 'next_of_kin_relationship',
        'INPL' => 'INPL',
                'assigned' => 'assigned',

    ];

    // Convert csv headers to lowercase and trim spaces
    $normalizedHeader = array_map('trim', $header);

    // Replace csv headers with database field names
    $escapedHeader = [];
    foreach ($normalizedHeader as $key => $value) {
        $escapedHeader[] = $columnMapping[$value] ?? null; // Use mapping, else null
    }

    if (in_array(null, $escapedHeader, true)) {
        fclose($file);
        return redirect()->back()->with('not_permitted', 'CSV file format is incorrect. Check column names.');
    }

    $mail_setting = MailSetting::latest()->first();
    try {
        while ($columns = fgetcsv($file)) {
            if (count($escapedHeader) !== count($columns)) {
                fclose($file);
                return redirect()->back()->with('not_permitted', 'CSV file format is incorrect.');
            }

            // Map CSV data to database fields
            $data = array_combine($escapedHeader, $columns);

            // Validate and sanitize input
            $data['name'] = htmlspecialchars(trim($data['name']));
            $data['email'] = filter_var(trim($data['email']), FILTER_VALIDATE_EMAIL) ? trim($data['email']) : null;
            $data['phone_number'] = preg_replace('/\D/', '', $data['phone_number']);
            $data['next_of_kin_mobile'] = preg_replace('/\D/', '', $data['next_of_kin_mobile'] ?? '');

            // Handle customer group
            $customer_group = CustomerGroup::firstOrCreate(['name' => $data['customer_group'], 'is_active' => true]);

            // Check if the customer already exists based on Student ID (mapped to 'country')
            $existingCustomer = Customer::where('country', $data['country'])->first();

            if ($existingCustomer) {
                // If customer exists, skip MemberNo generation and do not update the existing data
                $data['MemberNo'] = $existingCustomer->MemberNo;
            } else {
                // Generate a new MemberNo if the customer is not found in the database
                if (empty($data['MemberNo'])) {
                    // Get the highest current MemberNo from the database
                    $maxMemberNo = Customer::max('MemberNo');

                    // If no MemberNos exist, set to 1, otherwise increment the max MemberNo
                    $nextMemberNo = $maxMemberNo ? (int)$maxMemberNo + 1 : 1;

                    // Format the next MemberNo to be 5 digits with leading zeros
                    $newMemberNo = str_pad($nextMemberNo, 5, '0', STR_PAD_LEFT);

                    // Ensure the MemberNo is unique by checking if it already exists
                    while (Customer::where('MemberNo', $newMemberNo)->exists()) {
                        $nextMemberNo++;  // Increment the MemberNo
                        $newMemberNo = str_pad($nextMemberNo, 5, '0', STR_PAD_LEFT);  // Reformat with leading zeros
                    }

                    // Assign the unique MemberNo
                    $data['MemberNo'] = $newMemberNo;
                }
            }

            // Create or update customer
            $customer = Customer::firstOrNew(['name' => $data['name'], 'country' => $data['country'], 'is_active' => true]);
            $customer->fill([
                'customer_group_id' => $customer_group->id,
                'company_name' => $data['company_name'] ?? null,
                'email' => $data['email'],
                'phone_number' => $data['phone_number'],
                'address' => $data['address'] ?? null,
                'city' => $data['city'] ?? null,
                'state' => $data['state'] ?? null,
                'postal_code' => $data['postal_code'] ?? null,
                'country' => $data['country'] ?? null,
                'location' => $data['location'] ?? null,
                'origin' => $data['origin'] ?? null,
                'sub_county' => $data['sub_county'] ?? null,
                'ward' => $data['ward'] ?? null,
                'sublocation' => $data['sublocation'] ?? null,
                'village' => $data['village'] ?? null,
                'MemberNo' => $data['MemberNo'],  // Save the generated or existing MemberNo
                'next_of_kin' => $data['next_of_kin'] ?? null,
                'next_of_kin_mobile' => $data['next_of_kin_mobile'] ?? null,
                'next_of_kin_relationship' => $data['next_of_kin_relationship'] ?? null,
                'INPL' => $data['INPL'] ?? null,
                                'assigned' => $data['INPL'] ?? null,

                'is_active' => true,

            ]);
            $customer->save();

            // Send mail if configured
            if ($data['email'] && $mail_setting) {
                $this->setMailInfo($mail_setting);
                try {
                    Mail::to($data['email'])->send(new CustomerCreate($data));
                } catch (\Exception $e) {
                    $message = 'Customer imported successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
                }
            }
        }

        fclose($file);
        $this->cacheForget('customer_list');
        return redirect('customer')->with('import_message', 'Customers imported successfully!');
    } catch (\Exception $e) {
        fclose($file);
        return redirect()->back()->with('not_permitted', 'Error: ' . $e->getMessage());
    }
}



    public function getDeposit($id)
    {
        $lims_deposit_list = Deposit::where('customer_id', $id)->get();
        $deposit_id = [];
        $deposits = [];
        foreach ($lims_deposit_list as $deposit) {
            $deposit_id[] = $deposit->id;
            $date[] = $deposit->created_at->toDateString() . ' '. $deposit->created_at->toTimeString();
            $amount[] = $deposit->amount;
            $note[] = $deposit->note;
            $lims_user_data = User::find($deposit->user_id);
            $name[] = $lims_user_data->name;
            $email[] = $lims_user_data->email;
        }
        if(!empty($deposit_id)){
            $deposits[] = $deposit_id;
            $deposits[] = $date;
            $deposits[] = $amount;
            $deposits[] = $note;
            $deposits[] = $name;
            $deposits[] = $email;
        }
        return $deposits;
    }

    public function addDeposit(Request $request)
    {
        $data = $request->all();
        $data['user_id'] = Auth::id();
        $lims_customer_data = Customer::find($data['customer_id']);
        $lims_customer_data->deposit += $data['amount'];
        $lims_customer_data->save();
        Deposit::create($data);
        $message = 'Data inserted successfully';
        $mail_setting = MailSetting::latest()->first();

        if($lims_customer_data->email && $mail_setting) {
            $data['name'] = $lims_customer_data->name;
            $data['email'] = $lims_customer_data->email;
            $data['balance'] = $lims_customer_data->deposit - $lims_customer_data->expense;
            $data['currency'] = config('currency');
            $message = $this->mailAction($data, $mail_setting, $request);

            // $this->setMailInfo($mail_setting);
            // try {
            //     Mail::to($data['email'])->send(new CustomerDeposit($data));
            // }
            // catch(\Exception $e){
            //     $message = 'Data inserted successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            // }
        }
        return redirect('customer')->with('create_message', $message);
    }

    public function updateDeposit(Request $request)
    {
        $data = $request->all();
        $lims_deposit_data = Deposit::find($data['deposit_id']);
        $lims_customer_data = Customer::find($lims_deposit_data->customer_id);
        $amount_dif = $data['amount'] - $lims_deposit_data->amount;
        $lims_customer_data->deposit += $amount_dif;
        $lims_customer_data->save();
        $lims_deposit_data->update($data);
        return redirect('customer')->with('create_message', 'Data updated successfully');
    }

    public function deleteDeposit(Request $request)
    {
        $data = $request->all();
        $lims_deposit_data = Deposit::find($data['id']);
        $lims_customer_data = Customer::find($lims_deposit_data->customer_id);
        $lims_customer_data->deposit -= $lims_deposit_data->amount;
        $lims_customer_data->save();
        $lims_deposit_data->delete();
        return redirect('customer')->with('not_permitted', 'Data deleted successfully');
    }

    public function deleteBySelection(Request $request)
    {
        $customer_id = $request['customerIdArray'];
        foreach ($customer_id as $id) {
            $lims_customer_data = Customer::find($id);
            $lims_customer_data->is_active = false;
            $lims_customer_data->save();
        }
        $this->cacheForget('customer_list');
        return 'Customer deleted successfully!';
    }

    public function destroy($id)
    {
        $lims_customer_data = Customer::find($id);
        $lims_customer_data->is_active = false;
        $lims_customer_data->save();
        $this->cacheForget('customer_list');
        return redirect('customer')->with('not_permitted','Data deleted Successfully');
    }

    protected function mailAction($data, $mailSetting, $request, $customMessage=null)
    {
        $message = $customMessage ?? 'Data inserted successfully';
        if(!$mailSetting) {
            $message = 'Data inserted successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
        }
        else if($data['email'] && $mailSetting) {
            try{
                $this->setMailInfo($mailSetting);
                Mail::to($data['email'])->send(new CustomerCreate($data));
                if(isset($request->both))
                    Mail::to($data['email'])->send(new SupplierCreate($data));
            }
            catch(\Exception $e){
                $message = $e->getMessage();
            }
        }
        return $message;
    }

    public function customersAll()
    {
        $lims_customer_list = DB::table('customers')->where('is_active', true)->get();

        $html = '';
        foreach($lims_customer_list as $customer){
            $html .='<option value="'.$customer->id.'">'.$customer->name . ' (' . $customer->phone_number. ')'.'</option>';
        }

        return response()->json($html);
    }

}
