<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderCoupon extends Model
{
    use HasFactory;
    protected $table = 'order_coupons';
    public $timestamps = true;
    protected $fillable = [
        'order_id',
        'coupon_id'
    ];

    public function order(){
        return $this->belongsTo(Order::class, 'order_id', 'id');
    }

    public function coupon(){
        return $this->belongsTo(Coupon::class, 'coupon_id', 'id');
    }
}
