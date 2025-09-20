<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tax extends Model
{
    protected $fillable =[
        "name", "rate",  "TAX_SHORT_DESC", "is_active", "woocommerce_tax_id", "pos_accnt_id"
    ];

    public function product()
    {
    	return $this->hasMany('App\ModelsProduct');
    }
}
