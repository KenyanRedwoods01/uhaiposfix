<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ExpenseCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Check if Purchase category already exists
        $existingCategory = DB::table('expense_categories')
            ->where('code', 'PUR001')
            ->orWhere('name', 'Purchase')
            ->first();

        if (!$existingCategory) {
            DB::table('expense_categories')->insert([
                'code' => 'PUR001',
                'name' => 'Purchase',
                'is_active' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}