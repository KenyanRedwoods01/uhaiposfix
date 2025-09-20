<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Account;
use App\Models\Employee;
use App\Models\Payroll;
use Auth;
use DB;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Mail\PayrollDetails;
use Mail;
use App\Models\MailSetting;

class PayrollController extends Controller
{
    use \App\Traits\MailInfo;

    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('payroll')){
            $lims_account_list = Account::where('is_active', true)->get();
            $lims_employee_list = Employee::where('is_active', true)->get();
            $general_setting = DB::table('general_settings')->latest()->first();
            if(Auth::user()->role_id > 2 && $general_setting->staff_access == 'own')
                $lims_payroll_all = Payroll::orderBy('id', 'desc')->where('user_id', Auth::id())->get();
            else
                $lims_payroll_all = Payroll::orderBy('id', 'desc')->get();

            return view('backend.payroll.index', compact('lims_account_list', 'lims_employee_list', 'lims_payroll_all'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $data = $request->all();
        if(isset($data['created_at']))
            $data['created_at'] = date("Y-m-d", strtotime(str_replace("/", "-", $data['created_at'])));
        else
            $data['created_at'] = date("Y-m-d");
        $data['reference_no'] = 'payroll-' . date("Ymd") . '-'. date("his");
        $data['user_id'] = Auth::id();
        Payroll::create($data);
        $message = 'Payroll creared succesfully';
        //collecting mail data
        $lims_employee_data = Employee::find($data['employee_id']);
        $mail_data['reference_no'] = $data['reference_no'];
        $mail_data['amount'] = $data['amount'];
        $mail_data['name'] = $lims_employee_data->name;
        $mail_data['email'] = $lims_employee_data->email;
        $mail_data['currency'] = config('currency');
        $mail_setting = MailSetting::latest()->first();
        if($mail_setting) {
            $this->setMailInfo($mail_setting);
            try{
                Mail::to($mail_data['email'])->send(new PayrollDetails($mail_data));
            }
            catch(\Exception $e){
                $message = ' Payroll created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('payroll')->with('message', $message);
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        $data = $request->all();
        if(isset($data['created_at']))
            $data['created_at'] = date("Y-m-d", strtotime(str_replace("/", "-", $data['created_at'])));
        else
            $data['created_at'] = date("Y-m-d");
        $lims_payroll_data = Payroll::find($data['payroll_id']);
        $lims_payroll_data->update($data);
        return redirect('payroll')->with('message', 'Payroll updated succesfully');
    }

    public function deleteBySelection(Request $request)
    {
        $payroll_id = $request['payrollIdArray'];
        foreach ($payroll_id as $id) {
            $lims_payroll_data = Payroll::find($id);
            $lims_payroll_data->delete();
        }
        return 'Payroll deleted successfully!';
    }

    public function destroy($id)
    {
        $lims_payroll_data = Payroll::find($id);
        $lims_payroll_data->delete();
        return redirect('payroll')->with('not_permitted', 'Payroll deleted succesfully');
    }
    public function import(Request $request)
    {
        // Validate the uploaded file
        $request->validate([
            'file' => 'required|mimes:csv,txt'
        ]);

        // Open and read the CSV file
        $file = fopen($request->file('file'), 'r');
        $header = fgetcsv($file); // Read the first row (column names)

        // Loop through CSV rows and insert into the database
        while ($row = fgetcsv($file)) {
            Payroll::create([
                'created_at' => $row[0], // Date
                'reference' => $row[1],  // Reference
                'employee_id' => $this->getEmployeeIdByName($row[2]), // Convert employee name to ID
                'account_id' => $this->getAccountIdByName($row[3]),  // Convert account name to ID
                'amount' => $row[4],     // Amount
                'paying_method' => $this->getPayingMethod($row[5]),  // Convert method to stored value
            ]);
        }

        fclose($file); // Close the file

        return redirect()->back()->with('success', 'Payroll imported successfully!');
    }

    // Helper function to get employee ID by name
    private function getEmployeeIdByName($name)
    {
        $employee = \App\Models\Employee::where('name', $name)->first();
        return $employee ? $employee->id : null;
    }

    // Helper function to get account ID by name
    private function getAccountIdByName($name)
    {
        $account = \App\Models\Account::where('name', $name)->first();
        return $account ? $account->id : null;
    }

    // Helper function to convert payment method to stored value
    private function getPayingMethod($method)
    {
        $methods = [
            'Cash' => 0,
            'Cheque' => 1,
            'Credit Card' => 2,
        ];
        return $methods[$method] ?? 0; // Default to Cash
    }
}
