<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Collection;
use App\Models\Account;
use App\Models\Payment;
use App\Models\Returns;
use App\Models\ReturnPurchase;
use App\Models\Expense;
use App\Models\Payroll;
use App\Models\MoneyTransfer;
use DB;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Auth;


class AccountsController extends Controller
{
    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('account-index')){
            // Modified to only show accounts that match the user's pos_accnt_id
            $pos_accnt_id = Auth::user()->pos_accnt_id;
            $lims_account_all = Account::where('is_active', true)
                                ->where('pos_accnt_id', $pos_accnt_id)
                                ->get();
            return view('backend.account.index', compact('lims_account_all'));
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
        $this->validate($request, [
            'account_no' => [
                'max:255',
                    Rule::unique('accounts')->where(function ($query) {
                    return $query->where('is_active', 1)
                                ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
                }),
            ],
        ]);

        // Get first account for this tenant only
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        $lims_account_data = Account::where('is_active', true)
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->first();

        $data = $request->all();
        if($data['initial_balance'])
            $data['total_balance'] = $data['initial_balance'];
        else
            $data['total_balance'] = 0;
        if(!$lims_account_data)
            $data['is_default'] = 1;
        $data['is_active'] = true;
        // Add the pos_accnt_id to the new account
        $data['pos_accnt_id'] = Auth::user()->pos_accnt_id;
        Account::create($data);
        return redirect('accounts')->with('message', 'Account created successfully');
    }

    public function makeDefault($id)
    {
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        
        // Update only accounts belonging to this tenant
        $lims_account_data = Account::where('is_default', true)
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->first();
        
        if($lims_account_data) {
            $lims_account_data->is_default = false;
            $lims_account_data->save();
        }

        // Verify the account belongs to this tenant before updating
        $lims_account_data = Account::where('id', $id)
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->first();
        
        if($lims_account_data) {
            $lims_account_data->is_default = true;
            $lims_account_data->save();
            return 'Account set as default successfully';
        }
        
        return 'Error: Account not found or not authorized';
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        
        $this->validate($request, [
            'account_no' => [
                'max:255',
                    Rule::unique('accounts')->ignore($request->account_id)->where(function ($query) {
                    return $query->where('is_active', 1)
                                ->where('pos_accnt_id', Auth::user()->pos_accnt_id);
                }),
            ],
        ]);

        $data = $request->all();
        
        // Verify account belongs to this tenant
        $lims_account_data = Account::where('id', $data['account_id'])
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->first();
        
        if(!$lims_account_data) {
            return redirect('accounts')->with('not_permitted', 'You are not authorized to update this account');
        }
        
        if($data['initial_balance'])
            $data['total_balance'] = $data['initial_balance'];
        else
            $data['total_balance'] = 0;
        $lims_account_data->update($data);
        return redirect('accounts')->with('message', 'Account updated successfully');
    }

    public function balanceSheet()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('balance-sheet')){
            $pos_accnt_id = Auth::user()->pos_accnt_id;
            
            // Fetch only accounts for this tenant
            $lims_account_list = Account::where('is_active', true)
                                ->where('pos_accnt_id', $pos_accnt_id)
                                ->get();
            
            $debit = [];
            $credit = [];
            foreach ($lims_account_list as $account) {
                // Filter all queries by pos_accnt_id
                $payment_recieved = Payment::whereNotNull('sale_id')
                                    ->where('account_id', $account->id)
                                    ->where('pos_accnt_id', $pos_accnt_id)
                                    ->sum('amount');
                
                $payment_sent = Payment::whereNotNull('purchase_id')
                                ->where('account_id', $account->id)
                                ->where('pos_accnt_id', $pos_accnt_id)
                                ->sum('amount');
                
                $returns = DB::table('returns')
                            ->where('account_id', $account->id)
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->sum('grand_total');
                
                $return_purchase = DB::table('return_purchases')
                                    ->where('account_id', $account->id)
                                    ->where('pos_accnt_id', $pos_accnt_id)
                                    ->sum('grand_total');
                
                $expenses = DB::table('expenses')
                            ->where('account_id', $account->id)
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->sum('amount');
                
                $payrolls = DB::table('payrolls')
                            ->where('account_id', $account->id)
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->sum('amount');
                
                $sent_money_via_transfer = MoneyTransfer::where('from_account_id', $account->id)
                                          ->where('pos_accnt_id', $pos_accnt_id)
                                          ->sum('amount');
                
                $recieved_money_via_transfer = MoneyTransfer::where('to_account_id', $account->id)
                                              ->where('pos_accnt_id', $pos_accnt_id)
                                              ->sum('amount');

                $credit[] = $payment_recieved + $return_purchase + $recieved_money_via_transfer + $account->initial_balance;
                $debit[] = $payment_sent + $returns + $expenses + $payrolls + $sent_money_via_transfer;
            }
            return view('backend.account.balance_sheet', compact('lims_account_list', 'debit', 'credit'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function accountStatement(Request $request)
    {
        $data = $request->all();
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        
        // Verify account belongs to this tenant
        $lims_account_data = Account::where('id', $data['account_id'])
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->first();
        
        if(!$lims_account_data) {
            return redirect()->back()->with('not_permitted', 'You are not authorized to view this account');
        }
        
        $credit_list = new Collection;
        $debit_list = new Collection;
        $expense_list = new Collection;
        $return_list = new Collection;
        $purchase_return_list = new Collection;
        $payroll_list = new Collection;
        $recieved_money_transfer_list = new Collection;
        $sent_money_transfer_list = new Collection;

        if($data['type'] == '0' || $data['type'] == '2') {
            $credit_list = Payment::whereNotNull('sale_id')
                            ->where('account_id', $data['account_id'])
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->whereDate('created_at', '>=' , $data['start_date'])
                            ->whereDate('created_at', '<=' , $data['end_date'])
                            ->select('payment_reference as reference_no', 'sale_id', 'amount', 'created_at')
                            ->get();

            $recieved_money_transfer_list = MoneyTransfer::where('to_account_id', $data['account_id'])
                                            ->where('pos_accnt_id', $pos_accnt_id)
                                            ->whereDate('created_at', '>=' , $data['start_date'])
                                            ->whereDate('created_at', '<=' , $data['end_date'])
                                            ->select('reference_no', 'to_account_id', 'amount', 'created_at')
                                            ->get();
                                            
            $purchase_return_list = ReturnPurchase::where('account_id', $data['account_id'])
                                    ->where('pos_accnt_id', $pos_accnt_id)
                                    ->whereDate('created_at', '>=' , $data['start_date'])
                                    ->whereDate('created_at', '<=' , $data['end_date'])
                                    ->select('reference_no', 'grand_total as amount', 'created_at')
                                    ->get();
        }
        if($data['type'] == '0' || $data['type'] == '1') {
            $debit_list = Payment::whereNotNull('purchase_id')
                            ->where('account_id', $data['account_id'])
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->whereDate('created_at', '>=' , $data['start_date'])
                            ->whereDate('created_at', '<=' , $data['end_date'])
                            ->select('payment_reference as reference_no', 'purchase_id', 'amount', 'created_at')
                            ->get();
                            
            $expense_list = Expense::where('account_id', $data['account_id'])
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->whereDate('created_at', '>=' , $data['start_date'])
                            ->whereDate('created_at', '<=' , $data['end_date'])
                            ->select('reference_no', 'amount', 'created_at')
                            ->get();
                            
            $return_list = Returns::where('account_id', $data['account_id'])
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->whereDate('created_at', '>=' , $data['start_date'])
                            ->whereDate('created_at', '<=' , $data['end_date'])
                            ->select('reference_no', 'grand_total as amount', 'created_at')
                            ->get();
                            
            $payroll_list = Payroll::where('account_id', $data['account_id'])
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->whereDate('created_at', '>=' , $data['start_date'])
                            ->whereDate('created_at', '<=' , $data['end_date'])
                            ->select('reference_no', 'amount', 'created_at')
                            ->get();
                            
            $sent_money_transfer_list = MoneyTransfer::where('from_account_id', $data['account_id'])
                                        ->where('pos_accnt_id', $pos_accnt_id)
                                        ->whereDate('created_at', '>=' , $data['start_date'])
                                        ->whereDate('created_at', '<=' , $data['end_date'])
                                        ->select('reference_no', 'to_account_id', 'amount', 'created_at')
                                        ->get();
        }
        $all_transaction_list = new Collection;
        $all_transaction_list = $credit_list->concat($recieved_money_transfer_list)
                                ->concat($debit_list)
                                ->concat($expense_list)
                                ->concat($return_list)
                                ->concat($purchase_return_list)
                                ->concat($payroll_list)
                                ->concat($sent_money_transfer_list)
                                ->sortByDesc('created_at');
        $balance = 0;
        return view('backend.account.account_statement', compact('lims_account_data', 'all_transaction_list', 'balance'));
    }

    public function destroy($id)
    {
        if(!env('USER_VERIFIED'))
            return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');
        
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        
        // Verify account belongs to this tenant before deletion
        $lims_account_data = Account::where('id', $id)
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->first();
        
        if(!$lims_account_data) {
            return redirect('accounts')->with('not_permitted', 'You are not authorized to delete this account');
        }
        
        if(!$lims_account_data->is_default){
            $lims_account_data->is_active = false;
            $lims_account_data->save();
            return redirect('accounts')->with('not_permitted', 'Account deleted successfully!');
        }
        else
            return redirect('accounts')->with('not_permitted', 'Please make another account default first!');
    }

    public function accountsAll()
    {
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        
        // Filter accounts by tenant
        $lims_account_list = DB::table('accounts')
                            ->where('is_active', true)
                            ->where('pos_accnt_id', $pos_accnt_id)
                            ->get();
        
        $html = '';
        foreach($lims_account_list as $account){
            if($account->is_default == 1){
                $html .='<option selected value="'.$account->id.'">'.$account->name . ' (' . $account->account_no. ')'.'</option>';
            }else{
                $html .='<option value="'.$account->id.'">'.$account->name . ' (' . $account->account_no. ')'.'</option>';
            }      
        }

        return response()->json($html);
    }
}