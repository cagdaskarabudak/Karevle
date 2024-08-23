<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Offer extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'offers';
    protected $fillable = [
        'name',
        'content',
        'amount',
        'amount_type',
        'expiration_time'
    ];

    public function products(){
        return $this->hasManyThrough(Product::class, OfferProduct::class, 'offer_id', 'id', 'id', 'product_id');
    }

    
}
