<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PosIncome;
use App\Models\PosIncomeCategory;
use Illuminate\Support\Facades\DB;

class PosIncomeController extends Controller
{
    public function index()
    {
        // Create default category and income entry if they don't exist
        $this->createDefaultSalesIncome();
        
        $incomes = PosIncome::where('user_id', auth()->id())->get();
        return view('pos_incomes.index', compact('incomes'));
    }

    public function create()
    {
        // Create default category and income entry if they don't exist
        $this->createDefaultSalesIncome();
        
        $categories = PosIncomeCategory::all();

        // Fetch warehouses
        $lims_warehouse_list = \App\Models\Warehouse::where('is_active', true)->get();

        // Optional: get default warehouse_id if needed
        $warehouse_id = auth()->user()->warehouse_id ?? null;

        return view('pos_incomes.create', compact('categories', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'category_id' => 'required|numeric',
            'amount' => 'required|numeric',
            'date' => 'required|date',
            'note' => 'nullable|string',
            'warehouse_id' => 'nullable|numeric',
        ]);

        PosIncome::create([
            'category_id' => $request->category_id,
            'amount' => $request->amount,
            'date' => $request->date,
            'note' => $request->note,
            'warehouse_id' => $request->warehouse_id,
            'user_id' => auth()->id(),
        ]);

        return redirect()->route('pos_incomes.index')->with('success', 'Income added successfully.');
    }

    public function edit($id)
    {
        $income = PosIncome::findOrFail($id);
        $categories = PosIncomeCategory::where('user_id', auth()->id())->get();
        return view('pos_incomes.edit', compact('income', 'categories'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'category_id' => 'required|numeric',
            'amount' => 'required|numeric',
            'note' => 'nullable|string',
            'date' => 'required|date',
        ]);

        $income = PosIncome::findOrFail($id);
        $income->update([
            'category_id' => $request->category_id,
            'amount' => $request->amount,
            'note' => $request->note,
            'date' => $request->date,
        ]);

        return redirect()->route('pos_incomes.index')->with('success', 'Income updated successfully.');
    }

    public function destroy($id)
    {
        $income = PosIncome::findOrFail($id);
        $income->delete();

        return redirect()->route('pos_incomes.index')->with('success', 'Income deleted successfully.');
    }

    /**
     * Get total profit/loss from sales for the current user based on pos_accnt_id
     */
    private function getTotalProfitLoss()
    {
        $userPosAccntId = auth()->user()->pos_accnt_id;
        
        // Calculate total profit/loss from product sales filtered by user's pos_accnt_id
        $totalProfitLoss = DB::table('product_sales')
            ->join('sales', 'product_sales.sale_id', '=', 'sales.id')
            ->join('products', 'product_sales.product_id', '=', 'products.id')
            ->select(
                DB::raw('SUM(product_sales.total - (products.cost * product_sales.qty)) as total_profit_loss')
            )
            ->where('sales.pos_accnt_id', '=', $userPosAccntId)
            ->first();

        return $totalProfitLoss->total_profit_loss ?? 0.00;
    }

    /**
     * Create default SALES INCOME category and SALES INCOME JOURNAL entry if they don't exist
     */
    private function createDefaultSalesIncome()
    {
        $userId = auth()->id();
        
        // Check if SALES INCOME category exists for this user
        $salesIncomeCategory = PosIncomeCategory::where('user_id', $userId)
            ->where('name', 'SALES INCOME')
            ->first();

        // Create category if it doesn't exist
        if (!$salesIncomeCategory) {
            $salesIncomeCategory = PosIncomeCategory::create([
                'name' => 'SALES INCOME',
                'user_id' => $userId,
            ]);
        }

        // Check if SALES INCOME JOURNAL entry exists for this user and category
        $salesIncomeJournal = PosIncome::where('user_id', $userId)
            ->where('category_id', $salesIncomeCategory->id)
            ->where('note', 'SALES INCOME JOURNAL')
            ->first();

        // Get dynamic profit/loss amount
        $dynamicAmount = $this->getTotalProfitLoss();

        // Create income entry if it doesn't exist
        if (!$salesIncomeJournal) {
            PosIncome::create([
                'category_id' => $salesIncomeCategory->id,
                'amount' => $dynamicAmount, // Dynamically calculated from profit/loss
                'date' => now()->format('Y-m-d'),
                'note' => 'SALES INCOME JOURNAL',
                'warehouse_id' => auth()->user()->warehouse_id ?? null,
                'user_id' => $userId,
            ]);
        } else {
            // Update existing entry with current profit/loss
            $salesIncomeJournal->update([
                'amount' => $dynamicAmount,
            ]);
        }
    }
}