<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cargo extends Model
{
    use HasFactory;
    protected $table = 'cargos';
    public $timestamps = true;
    protected $fillable = [
        'name',
        'price',
        'status'
    ];

    public function stores(){
        return $this->hasManyThrough(Store::class, StoreCargo::class, 'cargo_id', 'id', 'id', 'store_id');
    }
}
