<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shoppingcart extends Model
{
    use HasFactory;
    protected $table = 'shopping_carts';
    public $timestamps = true;
    protected $fillable = [
        'user_id',
        'session_id'
    ];
    protected $appends = [
        'total_price'
    ];
    protected $with = [
        'delivery_address',
        'invoice_address'
    ];

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function session(){
        return $this->belongsTo(Session::class, 'session_id', 'id');
    }

    public function baskets(){
        return $this->hasMany(ShoppingcartProduct::class, 'shopping_cart_id', 'id');
    }

    public function coupon(){
        return $this->hasOneThrough(Coupon::class, ShoppingcartCoupon::class, 'shopping_cart_id', 'id', 'id', 'coupon_id');
    }

    public function delivery_address(){
        return $this->hasOne(ShoppingCartDeliveryAddress::class, 'shopping_cart_id', 'id');
    }

    public function invoice_address(){
        return $this->hasOne(ShoppingCartInvoiceAddress::class, 'shopping_cart_id', 'id');
    }

    public function cargo(){
        return $this->hasOneThrough(Cargo::class, ShoppingcartCargo::class, 'shopping_cart_id', 'id', 'id', 'cargo_id');
    }

    public function getTotalPriceAttribute(){
        $total_price = 0;
        foreach($this->baskets as $basket){
            $total_price += $basket->count * $basket->product->price;
        }

        $total_price += $this->cargo->price;

        //coupon
        if($this->coupon){
            $total_price -= $this->coupon->coupon_amount;
        }

        return $total_price;
        
    }
}
