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

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function session(){
        return $this->belongsTo(Session::class, 'session_id', 'id');
    }

    public function baskets(){
        return $this->hasMany(ShoppingcartProduct::class, 'shopping_cart_id', 'id');
    }
}
