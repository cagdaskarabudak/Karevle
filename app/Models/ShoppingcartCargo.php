<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShoppingcartCargo extends Model
{
    use HasFactory;
    protected $table = 'shoppingcart_cargos';
    public $timestamps = true;
    protected $fillable = [
        'shopping_cart_id',
        'cargo_id'
    ];

    public function shopping_cart(){
        return $this->belongsTo(Shoppingcart::class, 'shopping_cart_id', 'id');
    }

    public function cargo(){
        return $this->belongsTo(Cargo::class, 'cargo_id', 'id');
    }
}
