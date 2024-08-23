<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Productlist extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'products_and_lists';
    protected $fillable = [
        'list_id',
        'product_id'
    ];

    public function product(){
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }

    public function list(){
        return $this->belongsTo(Liste::class, 'list_id', 'id');
    }
}
