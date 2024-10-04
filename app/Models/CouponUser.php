<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CouponUser extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'coupon_users';
    protected $fillable = [
        'user_id',
        'coupon_id',
        'is_used'
    ];
    protected $with = [
        'coupon',
        'user'
    ];
    protected $appends = [
        'user_is_used'
    ];

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function coupon(){
        return $this->belongsTo(Coupon::class, 'coupon_id', 'id');
    }

    public function getUserIsUsedAttribute(){
        if($this->is_used == $this->coupon->user_use_limit){
            return true;
        }
        else{
            return false;
        }
    }
}
