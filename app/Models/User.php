<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'first_name',
        'last_name',
        'username',
        'email',
        'phone',
        'password',
        'avatar',
        'role_id'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password'
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'password' => 'hashed'
        ];
    }

    public function shopping_cart(){
        return $this->hasOne(Shoppingcart::class, 'user_id', 'id');
    }

    public function favorites(){
        return $this->hasManyThrough(Product::class, FavoritedProduct::class, 'user_id', 'id', 'id', 'product_id');
    }

    public function role(){
        return $this->belongsTo(Role::class,'role_id', 'id');
    }

    public function addresses(){
        return $this->hasMany(Address::class, 'user_id', 'id');
    }

    public function coupons(){
        return $this->hasMany(CouponUser::class, 'user_id', 'id');
    }

    public function orders(){
        return $this->hasMany(Order::class, 'user_id', 'id');
    }
}
