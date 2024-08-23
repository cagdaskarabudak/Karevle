<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommentImage extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'comment_images';
    protected $fillable = [
        'comment_id',
        'name'
    ];

    public function comment(){
        return $this->belongsTo(ProductComment::class, 'comment_id', 'id');
    }
}
