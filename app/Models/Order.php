<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $table = 'orders';
    public $timestamps = true;
    protected $fillable = [
        'user_id',
        'status_id'
    ];

    public function status(){
        return $this->belongsTo(OrderStatus::class, 'status_id', 'id');
    }

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function address(){
        return $this->hasOne(OrderAddress::class, 'order_id', 'id');
    }

    public function invoice_address(){
        return $this->hasOne(OrderInvoiceAddress::class, 'order_id', 'id');
    }

    public function cargo(){
        return $this->hasOne(OrderCargo::class, 'order_id', 'id');
    }

    public function coupon(){
        return $this->hasOneThrough(Coupon::class, OrderCoupon::class, 'order_id', 'id', 'id', 'coupon_id');
    }

    public function baskets(){
        return $this->hasMany(OrderProduct::class, 'order_id', 'id');
    }

    public function getTotalPriceAttribute(){
        $total_price = 0;
        foreach($this->baskets as $basket){
            $total_price += $basket->count * $basket->price;
        }

        $total_price += $this->cargo->price;

        //coupon
        if($this->coupon){
            $total_price -= $this->coupon->coupon_amount;
        }

        return $total_price;
        
    }
}
