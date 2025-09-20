<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PosIncomeCategory;

class PosIncomeCategoryController extends Controller
{
    public function index()
    {
        // Check if "SALES INCOME" category exists for this user, create if not
        PosIncomeCategory::firstOrCreate([
            'name' => 'SALES INCOME',
            'user_id' => auth()->id()
        ]);
        
        $categories = PosIncomeCategory::where('user_id', auth()->id())->get();
        return view('pos_income_categories.index', compact('categories'));
    }

    public function create()
    {
        return view('pos_income_categories.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255'
        ]);

        PosIncomeCategory::create([
            'name' => $request->name,
            'user_id' => auth()->id()
        ]);

        return redirect()->route('pos_income_categories.index')->with('success', 'Category created successfully.');
    }

    public function edit($id)
    {
        $category = PosIncomeCategory::findOrFail($id);
        return view('pos_income_categories.edit', compact('category'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255'
        ]);

        $category = PosIncomeCategory::findOrFail($id);
        $category->update([
            'name' => $request->name
        ]);

        return redirect()->route('pos_income_categories.index')->with('success', 'Category updated successfully.');
    }

    public function destroy($id)
    {
        $category = PosIncomeCategory::findOrFail($id);
        $category->delete();

        return redirect()->route('pos_income_categories.index')->with('success', 'Category deleted successfully.');
    }


}