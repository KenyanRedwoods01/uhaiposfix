<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
protected $fillable = [
    "customer_group_id", "user_id", "name", "company_name",
    "email", "phone_number", "tax_no", "address", "city",
    "state", "postal_code", "country", "location", 
    "points",'LoyaltyPoints',  "wishlist", "origin", "sub_county", "ward", "sublocation", "village", "next_of_kin", "MemberNo", "next_of_kin_mobile", "next_of_kin_relationship", "INPL", "is_active", "pos_accnt_id", "is_active", "assigned" ];


    public function customerGroup()
    {
        return $this->belongsTo('App\Models\CustomerGroup');
    }

    public function user()
    {
    	return $this->belongsTo('App\Models\User');
    }

    public function discountPlans()
    {
        return $this->belongsToMany('App\Models\DiscountPlan', 'discount_plan_customers');
    }
}
