<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductComment extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'product_comments';
    protected $fillable = [
        'product_id',
        'user_id',
        'comment',
        'rate'
    ];

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function product(){
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }

    public function medias(){
        return $this->hasMany(CommentMedia::class, 'comment_id', 'id');
    }
}
