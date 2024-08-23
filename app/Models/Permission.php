<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'permissions';
    protected $fillable = [
        'name',
        'content',
        'route',
        'route_name'
    ];

    public function roles(){
        return $this->hasManyThrough(Role::class, RolePermission::class, 'permission_id', 'id', 'id', 'role_id');
    }


}
