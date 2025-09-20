<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\GeneralSetting;

class SalesJournalController extends Controller
{
    public function index()
    {
        $sales = [
            ['date' => '2025-07-27', 'customer' => 'Ali Mohamed', 'amount' => 1200],
            ['date' => '2025-07-28', 'customer' => 'Fatuma Noor', 'amount' => 1750],
        ];


 $general_setting = GeneralSetting::first();

    return view('sales_journal.index', compact('sales', 'general_setting'));    }
}
