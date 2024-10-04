<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

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
        'sale_price',
        'category_id',
    ];
    protected $appends = [
        'keys',
        'rate',
        'created_date',
        'price',
        'calc_vat',
        'calc_vatless_price'
    ];

    protected $with = [
        'medias',
        'content',
        'comments',
        'category',
        'lists',
        'favoritedUsers',
        'vat',
        'stores',
        'offer'
    ];

    //*********************************************************//
    //RELATIONSHIPS --->
    //*********************************************************//

    public function medias(){
        return $this->hasMany(ProductMedia::class, 'product_id', 'id')->orderBy('sort');
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

    public function favoritedUsers(){
        return $this->hasManyThrough(User::class, FavoritedProduct::class, 'product_id', 'id', 'id', 'user_id');
    }

    public function vat(){
        return $this->hasOneThrough(Tax::class, ProductTax::class, 'product_id', 'id', 'id', 'tax_id');
    }

    public function stores(){
        return $this->hasManyThrough(Store::class, StoreProduct::class, 'product_id', 'id', 'id', 'store_id')
                    ->select('stores.*', 'store_products.stock');
    }

    public function offer(){
        return $this->hasOneThrough(Offer::class, ProductOffer::class, 'product_id', 'id', 'id', 'offer_id');
    }

    //*********************************************************//
    //ATTRIBUTE METHODS --->
    //*********************************************************//

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

    public function getPriceAttribute(){
        if($this->offer){
            if($this->offer->type == 'currency'){
                $totalDiscount = $this->sale_price - $this->offer->amount;
            }
            elseif($this->offer->type == 'percentage'){
                $totalDiscount = $this->sale_price * $this->offer->amount / 100;
            }
        }
        else{
            $totalDiscount = 0;
        }

        $price = $this->sale_price - $totalDiscount;

        return $price;
    }

    public function getCalcVatAttribute(){

        return $this->sale_price - $this->calc_vatless_price;
    }

    public function getCalcVatlessPriceAttribute(){
        $vat_amount = $this->vat->amount;

        return $this->sale_price / ( 1 + ($vat_amount / 100));
    }

    //*********************************************************//
    //METHODS --->
    //*********************************************************//

    public function isFavoritedUser($userid){
        $query = FavoritedProduct::where('product_id', '=', $this->id)->where('user_id', '=', $userid)->first();

        if($query){
            return true;
        }
        else{
            return false;
        }
    }

    public function isInBasket(){
        if(Auth::check()){
            $query = Shoppingcart::where('user_id', Auth::user()->id)
            ->first()?->baskets->where('product_id', $this->id)->first();
        }
        else{
            $query = Shoppingcart::where('session_id', Session::getId())
            ->first()?->baskets->where('product_id', $this->id)->first();
        }

        if($query){
            return true;
        }
        else{
            return false;
        }
    }


    
}
