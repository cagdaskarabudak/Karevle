<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserBasket extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'user_baskets';
    protected $fillable = [
        'user_id',
        'session_id',
        'product_id',
        'count'
    ];

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function product(){
        return $this->belongsTo(Product::class, 'product_id', 'id')->with('images');
    }
}
