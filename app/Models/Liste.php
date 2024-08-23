<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Liste extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'lists';
    protected $fillable = [
        'name',
        'slug',
        'short_name',
        'sort',
        'icon',
        'color'
    ];

    public function products(){
        return $this->hasManyThrough(Product::class, ProductList::class, 'list_id', 'id', 'id', 'product_id');
    }
}
