<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductContent extends Model
{
    use HasFactory;

    public $timestamps = true;
    protected $table = 'product_contents';
    protected $fillable = [
        'product_id',
        'content'
    ];

    public function product(){
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
}
