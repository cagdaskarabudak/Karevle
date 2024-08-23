<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Session extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'sessions';
    protected $fillable = [
        'user_id',
        'payload',
        'last_activity',
        'ip_address',
        'user_agent'
    ];

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function sessionBaskets(){
        return $this->hasMany(UserBasket::class, 'session_id', 'id');
    }
}
