<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PosIncome extends Model
{
    protected $fillable = [
        'category_id',
        'amount',
        'note',
        'date',
            'warehouse_id', // add this

        'user_id',
    ];

    public function category()
    {
        return $this->belongsTo(PosIncomeCategory::class, 'category_id');
    }

    public function warehouse()
{
    return $this->belongsTo(Warehouse::class);
}

}
