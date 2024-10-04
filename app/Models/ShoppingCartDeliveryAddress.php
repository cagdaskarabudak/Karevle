<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShoppingCartDeliveryAddress extends Model
{
    use HasFactory;
    protected $table = 'shoppingcart_delivery_addresses';
    public $timestamps = true;
    protected $fillable = [
        'shopping_cart_id',
        'address_id',
        'first_name',
        'last_name',
        'ID_number',
        'company_name',
        'tax_office',
        'tax_number',
        'mersis_number',
        'email',
        'phone',
        'country',
        'city',
        'district',
        'address',
        'postal_code'
    ];

    public function user_address(){
        return $this->belongsTo(Address::class, 'address_id', 'id');
    }

    public function shopping_cart(){
        return $this->belongsTo(Shoppingcart::class, 'shopping_cart_id', 'id');
    }
}
