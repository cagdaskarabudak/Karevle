<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\FavoritedProduct;
use App\Models\Product;

class FavoriteController extends Controller
{
    public function viewFavorites(){
        return view('user.favorites');
    }

    public function addFavorites(Request $request){
        try{
            DB::beginTransaction();
            $product = Product::where('id', '=', $request->productid)->first();
            if(!$product->isFavoritedUser(Auth::user()->id)){
                $favoritedProduct = new FavoritedProduct;
                $favoritedProduct->product_id = $product->id;
                $favoritedProduct->user_id = Auth::user()->id;
                $favoritedProduct->save();
            }
            else{
                return response()->json(false);
            }

            DB::commit();
            return response()->json(true);
        }
        catch(\Exception $e){
            DB::rollBack();

            return response()->json($e->getMessage());
        }
    }

    public function removeFavorites(Request $request){
        try{
            DB::beginTransaction();
            $product = Product::where('id', '=', $request->productid)->first();
            if($product->isFavoritedUser(Auth::user()->id)){
                $favoritedProduct = FavoritedProduct::where('product_id', '=', $product->id)->where('user_id', '=', Auth::user()->id)->first();
                $favoritedProduct->delete();
            }
            else{
                return response()->json(false);
            }

            DB::commit();
            return response()->json(true);
        }
        catch(\Exception $e){
            DB::rollBack();

            return response()->json($e->getMessage());
        }
    }
}
