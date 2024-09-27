<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    use HasFactory;
    protected $table = 'user_addresses';
    public $timestamps = true;
    protected $fillable = [
        'title',
        'user_id',
        'first_name',
        'last_name',
        'phone',
        'country',
        'city',
        'district',
        'address',
        'postal_code',
        'is_default'
    ];

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
