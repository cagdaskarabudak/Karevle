<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShoppingcartProduct extends Model
{
    use HasFactory;
    protected $table = 'shopping_cart_product';
    public $timestamps = true;
    protected $fillable = [
        'shopping_cart_id',
        'product_id',
        'count'
    ];

    protected $with = [
        'product'
    ];

    public function shopping_cart(){
        return $this->belongsTo(Shoppingcart::class, 'shopping_cart_id', 'id');
    }

    public function product(){
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
}
