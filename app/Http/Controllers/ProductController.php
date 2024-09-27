<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Controllers\ShoppingCartController;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\FavoritedProduct;

class ProductController extends Controller
{
    public function viewAll(){
        $products = Product::all();
        return view('all-products')->with('products', $products);
    }

    public function viewProduct($slug){
        $product = Product::where('slug', '=', $slug)->first();

        return view('product')->with('product', $product);
    }
}
