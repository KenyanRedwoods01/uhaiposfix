<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    protected $fillable =[

        "name", "image", "company_name", "vat_number",
        "email", "phone_number", "address", "city",
        "state", "postal_code", "country", "is_active", "pos_accnt_id"

    ];

    public function product()
    {
    	return $this->hasMany('App\Models\Product');
    }
}
