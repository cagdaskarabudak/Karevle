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
    public function viewProduct(String $slug){
        $product = Product::where('slug', '=', $slug)->first();

        if($product){
            return view('product')->with('product', $product);
        }
        else{
            return abort('404');
        }
    }

    public function basketProduct(Request $request){
        $product = Product::where('id', '=', $request->product_id)->first();

        return ShoppingCartController::basket($product);
    }

    public function unBasketProduct(Request $request){
        $product = Product::where('id', '=', $request->product_id)->first();

        return ShoppingCartController::unBasket($product);
    }

    public function getProductInfo(Request $request){
        $product = Product::where('id', '=', $request->product_id)->with('images')->first();

        return response()->json($product);
    }

    public function getProducts(Request $request){
        //    
    }

}
