<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\FavoritedProduct;
use App\Models\Category;
use App\Models\Product;

class FavoriteController extends Controller
{

    public function viewFavorites(){
        $favorites = FavoritedProduct::where('user_id', '=', Auth::user()->id)->with('product')->get();
        $categories = Category::all();

        return view('favorites')->with([
            'favorites' => $favorites,
            'categories' => $categories
        ]);
    }

    public function favoritedProduct(Request $request){
        try{
            DB::beginTransaction();
            $product = Product::where('id', '=', $request->product_id)->first();
            $isFavoritedProduct = FavoritedProduct::where('user_id', '=', Auth::user()->id)->where('product_id', '=', $product->id)->first();

            if($product && !$isFavoritedProduct){
                $favoritedProduct = new FavoritedProduct;
                $favoritedProduct->user_id = Auth::user()->id;
                $favoritedProduct->product_id = $product->id;
                $favoritedProduct->save();

                DB::commit();
            }

            return response()->json('Success');

        } catch(\Exception $e){
            DB::rollBack();
            return response()->json([
                'errors' => $e->getMessage(),
                'message' => 'Error!'
            ]);
        }
    }

    public function unFavoritedProduct(Request $request){
        try{
            DB::beginTransaction();
            $favoritedProduct = FavoritedProduct::where('product_id', '=', $request->product_id)->where('user_id', '=', Auth::user()->id)->first();
            if($favoritedProduct){
                $favoritedProduct->delete();
                DB::commit();
            }

            return response()->json('Success');

        } catch(\Exception $e){
            DB::rollBack();

            return response()->json([
                'errors' => $e->getMessage(),
                'message' => 'Error!'
            ]);
        }
    }

    public function getFavoritedProducts(Request $request){
        if(Auth::check()){
            $products = FavoritedProduct::where('user_id', '=', Auth::user()->id)->with('product')->get();

            return response()->json($products);
        }
        else{
            return abort(404);
        }
    }
}
