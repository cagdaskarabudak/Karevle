<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StoreCargo extends Model
{
    use HasFactory;
    protected $table = 'store_cargos';
    public $timestamps = true;
    protected $fillable = [
        'store_id',
        'cargo_id'
    ];

    public function store(){
        return $this->belongsTo(Store::class, 'store_id', 'id');
    }

    public function cargo(){
        return $this->belongsTo(Cargo::class, 'cargo_id', 'id');
    }
}
