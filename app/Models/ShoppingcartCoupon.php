<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShoppingcartCoupon extends Model
{
    use HasFactory;
    protected $table = 'shopping_cart_coupons';
    public $timestamps = true;
    protected $fillable = [
        'shopping_cart_id',
        'coupon_id'
    ];

    public function shopping_cart(){
        return $this->belongsTo(Shoppingcart::class, 'shopping_cart_id', 'id');
    }

    public function coupon(){
        return $this->belongsTo(Coupon::class, 'coupon_id', 'id');
    }
}
