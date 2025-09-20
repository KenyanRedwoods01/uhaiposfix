<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Expense;
use App\Models\ExpenseCategory;
use App\Models\Warehouse;
use App\Models\User;

class DefaultPurchaseExpenseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // First, create or get the Purchase category
        $purchaseCategory = ExpenseCategory::firstOrCreate([
            'name' => 'Purchase',
            'code' => 'PUR'
        ], [
            'is_active' => true,
            'created_at' => now(),
            'updated_at' => now()
        ]);

        // Get all active pos_accnt_ids to create default expenses for each tenant
        $posAccounts = User::distinct('pos_accnt_id')->pluck('pos_accnt_id');

        foreach ($posAccounts as $posAccntId) {
            // Get the first warehouse for this pos_accnt_id
            $warehouse = Warehouse::where('pos_accnt_id', $posAccntId)
                                 ->where('is_active', true)
                                 ->first();

            // Get the first user for this pos_accnt_id (preferably admin)
            $user = User::where('pos_accnt_id', $posAccntId)
                       ->orderBy('role_id')
                       ->first();

            if ($warehouse && $user) {
                // Check if Purchase_List expense already exists for this tenant
                $existingExpense = Expense::where('pos_accnt_id', $posAccntId)
                                         ->where('reference_no', 'LIKE', '%Purchase_List%')
                                         ->first();

                if (!$existingExpense) {
                    // Create the default Purchase_List expense
                    Expense::create([
                        'reference_no' => 'Purchase_List_' . date('Ymd_His'),
                        'warehouse_id' => $warehouse->id,
                        'expense_category_id' => $purchaseCategory->id,
                        'user_id' => $user->id,
                        'pos_accnt_id' => $posAccntId,
                        'amount' => 0.00, // Default amount
                        'note' => 'Default Purchase List expense entry',
                        'created_at' => now(),
                        'updated_at' => now()
                    ]);
                }
            }
        }

        $this->command->info('Default Purchase_List expenses created successfully!');
    }
}