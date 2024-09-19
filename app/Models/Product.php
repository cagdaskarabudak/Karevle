<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    //*********************************************************//
    //SETTINGS --->
    //*********************************************************//

    public $timestamps = true;
    protected $table = 'products';
    protected $fillable = [
        'name',
        'slug',
        'price',
        'category_id',
    ];
    protected $appends = [
        'price_with_offers',
        'keys',
        'rate',
        'created_date'
    ];

    protected $with = [
        'images',
        'content',
        'comments',
        'category',
        'lists',
        'offers',
        'favoritedUsers'
    ];

    //*********************************************************//
    //RELATIONSHIPS --->
    //*********************************************************//

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

    public function favoritedUsers(){
        return $this->hasManyThrough(User::class, FavoritedProduct::class, 'product_id', 'id', 'id', 'user_id');
    }

    //*********************************************************//
    //ATTRIBUTE METHODS --->
    //*********************************************************//

    public function getPriceWithOffersAttribute(){
        if(count($this->offers) > 0){
            $new_price = $this->price;
            foreach($this->get_offers('rate') as $offer){
                $new_price = $new_price - ($new_price * $offer->amount) / 100;
            }
            foreach($this->get_offers('price') as $offer){
                $new_price = $new_price - $offer->amount;
            }
            return $this->new_price = number_format($new_price, 2);
        }
        else{
            return 0;
        }
    }

    public function getRateAttribute(){
        $totalrate = 0;

        foreach($this->comments as $comment){
            $totalrate = $totalrate + $comment->rate;
        }

        if(!count($this->comments) == 0){
            $totalrate = $totalrate / count($this->comments);
        }

        return $totalrate;
    }

    public function getKeysAttribute(){
        $words = explode(' ', $this->name);
        $lowercaseWords = array_map('strtolower', $words);

        return $lowercaseWords;
    }

    public function getCreatedDateAttribute(){
        return strtotime($this->created_at);
    }

    //*********************************************************//
    //METHODS --->
    //*********************************************************//

    public function get_offers($type = null){
        if ($type === 'rate' || $type === 'price') {
            return $this->offers->where('amount_type', '=', $type);
        }
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


    
}
