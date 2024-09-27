<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductTax extends Model
{
    use HasFactory;
    protected $table = 'product_taxes';
    public $timestamps = true;
    protected $fillable = [
        'product_id',
        'tax_id'
    ];

    public function product(){
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }

    public function tax(){
        return $this->belongsTo(Tax::class, 'tax_id', 'id');
    }
}
