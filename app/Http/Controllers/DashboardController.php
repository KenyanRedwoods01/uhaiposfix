<?php
namespace App\Http\Controllers;
use App\Traits\AutoUpdateTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    use AutoUpdateTrait;
    
    public function index()
    {
        // Get the logged in admin's pos_accnt_id
        $loggedInUserPosAccntId = Auth::user()->pos_accnt_id;
        
        // Get auto update data
        $autoUpdateData = $this->general();
        $alertBugEnable = $autoUpdateData['alertBugEnable'];
        $alertVersionUpgradeEnable = $autoUpdateData['alertVersionUpgradeEnable'];
        
        // Get data from various tables filtered by pos_accnt_id
        $userData = DB::table('users')
            ->where('pos_accnt_id', $loggedInUserPosAccntId)
            ->get();
            
        $accountsData = DB::table('accounts')
            ->where('pos_accnt_id', $loggedInUserPosAccntId)
            ->get();
            
        // You can add more tables with filtering as needed
        // Example: 
        $productsData = DB::table('products')
           ->where('pos_accnt_id', $loggedInUserPosAccntId)
        ->get();
        
        return view('dashboard', compact(
            'alertBugEnable',
            'alertVersionUpgradeEnable',
            'userData',
            'accountsData'
            // Add more variables as needed
        ));
    }
}