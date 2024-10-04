<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderAddress extends Model
{
    use HasFactory;
    protected $table = 'order_addresses';
    public $timestamps = true;
    protected $fillable = [
        'order_id',
        'type',
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

    public function order(){
        return $this->belongsTo(Order::class, 'order_id', 'id');
    }
}
