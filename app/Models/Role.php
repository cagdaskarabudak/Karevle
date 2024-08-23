<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'roles';
    protected $fillable = [
        'name'
    ];

    public function users(){
        return $this->hasMany(User::class, 'role_id', 'id');
    }

    public function permissions(){
        return $this->hasManyThrough(Permission::class, RolePermission::class, 'role_id', 'id', 'id', 'permission_id');
    }
}
