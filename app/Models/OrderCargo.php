<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderCargo extends Model
{
    use HasFactory;
    protected $table = 'order_cargos';
    public $timestamps = true;
    protected $fillable = [
        'order_id',
        'cargo_id',
        'price',
        'tracking_number'
    ];

    public function order(){
        return $this->belongsTo(Order::class, 'order_id', 'id');
    }

    public function cargo(){
        return $this->belongsTo(Cargo::class, 'cargo_id', 'id');
    }
}
