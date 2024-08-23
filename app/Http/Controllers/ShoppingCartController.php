<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\User;
use Illuminate\Support\Facades\Session;
use App\Models\UserBasket;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ShoppingCartController extends Controller
{
    public function view(){
        if(Auth::check()){
            $baskets = UserBasket::where('user_id', '=', Auth::user()->id)->where('session_id', '=', Session::getId())->with('product')->get();
        }
        else{
            $baskets = UserBasket::where('session_id', '=', Session::getId())->with('product')->get();
        }

        return view('shopping-card')->with('baskets', $baskets);
    }

    public static function basket(Product $product){
        try{
            DB::beginTransaction();
            $userBasket = UserBasket::Where('session_id', '=', Session::getId())->where('product_id', '=', $product->id)->first();
            if($userBasket){
                $userBasket->count++;
                $userBasket->save();
            }
            else{
                $userBasket = new UserBasket;
                $userBasket->session_id = Session::getId();
                if(Auth::check()){
                    $userBasket->user_id = Auth::user()->id;
                }
                $userBasket->product_id = $product->id;
                $userBasket->count = 1;
    
                $userBasket->save();
            }

            DB::commit();

            return response()->json('Success');

        } catch(\Exception $e){
            DB::rollBack();
            return response()->json([
                'errors' => $e->getMessage(),
                'message' => 'Error!'
            ]);
        }
    }

    public static function unBasket(Product $product){
        try{
            DB::beginTransaction();
            if(Auth::check()){
                $userBasket = UserBasket::where('user_id', '=', Auth::user()->id)->where('session_id', '=', Session::getId())->where('product_id', '=', $product->id)->first();
            }
            else{
                $userBasket = UserBasket::where('session_id', '=', Session::getId())->where('product_id', '=', $product->id)->first();
            }

            if($userBasket->count > 1){
                $userBasket->count--;
                $userBasket->save();
            }
            else{
                $userBasket->delete();
            }
            DB::commit();
            
            return response()->json('success');
        } catch(\Exception $e){
            return response()->json([
                'errors' => $e->getMessage(),
                'message' => 'errorr!'
            ]);
        }
    }

    public function getBaskets(Request $request){
        if(Auth::check()){
            $baskets = UserBasket::where('user_id', '=', Auth::user()->id)->where('session_id', '=', Session::getId())->with('product')->get();
        }
        else{
            $baskets = UserBasket::where('session_id', '=', Session::getId())->with('product')->get();
        }

        return response()->json($baskets);
    }

    public function clearBasket(){

        try{

            DB::beginTransaction();

            if(Auth::check()){
                $baskets = UserBasket::where('user_id', '=', Auth::user()->id)->where('session_id', '=', Session::getId())->delete();
            }
            else{
                $baskets = UserBasket::where('session_id', '=', Session::getId())->with('product')->delete();
            }

            DB::commit();

            return response()->json('success');
        } catch(\Exception $e){
            return response()->json([
                'errors' => $e->getMessage(),
                'message' => 'errorr!'
            ]);
        }
    }
}
