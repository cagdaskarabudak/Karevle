<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'coupons';
    protected $fillable = [
        'name',
        'content',
        'code',
        'coupon_amount',
        'expiration_time'
    ];

    public function users(){
        return $this->hasManyThrough(User::class, CouponUser::class, 'coupon_id', 'id', 'id', 'user_id');
    }

    public function used_users(){
        return $this->hasManyThrough(User::class, CouponUser::class, 'coupon_id', 'id', 'id', 'user_id')->where('is_used', '=', 1);
    }

    public function not_used_users(){
        return $this->hasManyThrough(User::class, CouponUser::class, 'coupon_id', 'id', 'id', 'user_id')->where('is_used', '=', 0);
    }
}
