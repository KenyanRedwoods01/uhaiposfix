<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class IncomeStatementController extends Controller
{
    public function index()
    {
        return view('incomeStatement.index');
    }
}
