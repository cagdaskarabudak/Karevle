<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Store extends Model
{
    use HasFactory;
    protected $table = 'stores';
    public $timestamps = true;
    protected $fillable = [
        'name',
        'short_name',
        'address'
    ];

    public function cargos(){
        return $this->hasManyThrough(Cargo::class, StoreCargo::class, 'store_id', 'id', 'id', 'cargo_id');
    }

    public function products(){
        return $this->hasManyThrough(Product::class, StoreProduct::class, 'store_id', 'id', 'id', 'product_id')
                        ->select('products.*', 'store_products.stock');
    }
}
