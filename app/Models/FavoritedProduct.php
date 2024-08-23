<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FavoritedProduct extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'favorited_products';
    protected $fillable = [
        'product_id',
        'user_id'
    ];

    public function product(){
        return $this->belongsTo(Product::class, 'product_id', 'id')->with('images');
    }

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
