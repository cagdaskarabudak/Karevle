<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Offer extends Model
{
    use HasFactory;
    protected $table = 'offers';
    public $timestamps = true;
    protected $fillable = [
        'name',
        'content',
        'amount',
        'type',
        'media_name'
    ];

    public function products(){
        return $this->hasManyThrough(Product::class, ProductOffer::class, 'offer_id', 'id', 'id', 'product_id');
    }
}
