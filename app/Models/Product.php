<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    public $timestamps = true;
    protected $table = 'products';
    protected $fillable = [
        'name',
        'slug',
        'price',
        'category_id',
    ];

    public function images(){
        return $this->hasMany(ProductImage::class, 'product_id', 'id')->orderBy('sort');
    }

    public function content(){
        return $this->hasOne(ProductContent::class, 'product_id', 'id');
    }

    public function comments(){
        return $this->hasMany(ProductComment::class, 'product_id', 'id');
    }

    public function category(){
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    public function lists(){
        return $this->hasManyThrough(Liste::class, ProductList::class, 'product_id', 'id', 'id', 'list_id')->orderBy('sort');
    }

    public function offers(){
        return $this->hasManyThrough(Offer::class, OfferProduct::class, 'product_id', 'id', 'id', 'offer_id');
    }

    public function get_offers($type = null){
        if ($type === 'rate' || $type === 'price') {
            return $this->offers->where('amount_type', '=', $type);
        }
    }

    public function new_price(){
        if(count($this->offers) > 0){
            $new_price = $this->price;
            foreach($this->get_offers('rate') as $offer){
                $new_price = $new_price - ($new_price * $offer->amount) / 100;
            }
            foreach($this->get_offers('price') as $offer){
                $new_price = $new_price - $offer->amount;
            }

            return $new_price;
        }
        else{
            return 0;
        }
    }

    public function rate(){
        $totalrate = 0;

        foreach($this->comments as $comment){
            $totalrate = $totalrate + $comment->rate;
        }

        if(!count($this->comments) == 0){
            $totalrate = $totalrate / count($this->comments);
        }

        return $totalrate;
    }

    public function favoritedUsers(){
        return $this->hasManyThrough(User::class, FavoritedProduct::class, 'product_id', 'id', 'id', 'user_id');
    }

    public function isFavoritedUser($userid){
        $query = FavoritedProduct::where('product_id', '=', $this->id)->where('user_id', '=', $userid)->first();

        if($query){
            return true;
        }
        else{
            return false;
        }
    }

    public function getKeys(){
        // Cümleyi boşluklara göre böler
        $words = explode(' ', $this->name);

        // Her kelimeyi küçük harfe dönüştürür
        $lowercaseWords = array_map('strtolower', $words);

        return $lowercaseWords;
    }
    
}
