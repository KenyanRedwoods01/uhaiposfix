<?php
namespace App\Http\Controllers;
use App\Models\MoneyTransfer;
use App\Models\Account;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Auth;
class MoneyTransferController extends Controller
{
    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('money-transfer')){
            // Get the logged in user's pos_accnt_id
            $pos_accnt_id = Auth::user()->pos_accnt_id;
            
            // Filter money transfers based on pos_accnt_id
            $lims_money_transfer_all = MoneyTransfer::where('pos_accnt_id', $pos_accnt_id)->get();
            
            // Also filter accounts based on pos_accnt_id
            $lims_account_list = Account::where('is_active', true)
                                        ->where('pos_accnt_id', $pos_accnt_id)
                                        ->get();
                                        
            return view('backend.money_transfer.index', compact('lims_money_transfer_all', 'lims_account_list'));
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
        $data['reference_no'] = 'mtr-' . date("Ymd") . '-'. date("his");
        
        // Set the pos_accnt_id for the new money transfer
        $data['pos_accnt_id'] = Auth::user()->pos_accnt_id;
        
        MoneyTransfer::create($data);
        return redirect()->back()->with('message', 'Money transfered successfully');
    }
    
    public function show(MoneyTransfer $moneyTransfer)
    {
        // Check if the moneyTransfer belongs to the current user's pos_accnt_id
        if($moneyTransfer->pos_accnt_id != Auth::user()->pos_accnt_id) {
            return redirect()->back()->with('not_permitted', 'You are not authorized to view this record');
        }
        
        // Show logic here
    }
    
    public function edit(MoneyTransfer $moneyTransfer)
    {
        // Check if the moneyTransfer belongs to the current user's pos_accnt_id
        if($moneyTransfer->pos_accnt_id != Auth::user()->pos_accnt_id) {
            return redirect()->back()->with('not_permitted', 'You are not authorized to edit this record');
        }
        
        // Edit logic here
    }
    
    public function update(Request $request, $id)
    {
        $data = $request->all();
        
        // Check if the money transfer belongs to the current user's pos_accnt_id
        $moneyTransfer = MoneyTransfer::find($data['id']);
        if($moneyTransfer->pos_accnt_id != Auth::user()->pos_accnt_id) {
            return redirect()->back()->with('not_permitted', 'You are not authorized to update this record');
        }
        
        $moneyTransfer->update($data);
        return redirect()->back()->with('message', 'Money transfer updated successfully');
    }
    
    public function destroy($id)
    {
        // Check if the money transfer belongs to the current user's pos_accnt_id
        $moneyTransfer = MoneyTransfer::find($id);
        if($moneyTransfer->pos_accnt_id != Auth::user()->pos_accnt_id) {
            return redirect()->back()->with('not_permitted', 'You are not authorized to delete this record');
        }
        
        $moneyTransfer->delete();
        return redirect()->back()->with('not_permitted', 'Data deleted successfully');
    }
}