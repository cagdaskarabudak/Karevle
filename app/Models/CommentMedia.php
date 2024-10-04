<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommentMedia extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'comment_medias';
    protected $fillable = [
        'comment_id',
        'name',
        'type'
    ];

    public function comment(){
        return $this->belongsTo(ProductComment::class, 'comment_id', 'id');
    }
}
