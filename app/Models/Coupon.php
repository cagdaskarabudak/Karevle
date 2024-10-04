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
        'user_use_limit',
        'expiration_time'
    ];

    public function users(){
        return $this->hasManyThrough(User::class, CouponUser::class, 'coupon_id', 'id', 'id', 'user_id');
    }

    public function definedUser($userid){
        $couponuser = CouponUser::where('user_id', '=', $userid)->where('coupon_id', '=', $this->id)->first();
        if($couponuser){
            return $couponuser;
        }
        else{
            return false;
        }
    }
}
