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

    public function user(){
        return $this->belongsTo(User::class, 'id', 'user_id');
    }

    public function coupon(){
        return $this->belongsTo(Coupon::class, 'id', 'coupon_id');
    }
}
