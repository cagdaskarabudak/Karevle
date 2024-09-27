<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\User;
use Illuminate\Support\Facades\Session;
use App\Models\UserBasket;
use App\Models\Shoppingcart;
use App\Models\ShoppingcartProduct;
use App\Models\Coupon;
use App\Models\Cargo;
use App\Models\Tax;
use App\Models\Session as SessionModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ShoppingCartController extends Controller
{
    public function view(){
        if(Auth::check()){
            $baskets = Shoppingcart::where('user_id', '=', Auth::user()->id)->first()?->baskets;
        }
        else{
            $baskets = Shoppingcart::where('session_id', '=', Session::getId())->first()?->baskets;
        }
        if($baskets){
            return view('shopping-cart')->with('baskets', $baskets);
        }
        else{
            return view('shopping-cart')->with('baskets', []);
        }
    }

    public function add(Request $request){
        try{
            DB::beginTransaction();
            if(Auth::check()){
                $shopping_cart = Shoppingcart::where('user_id', '=', Auth::user()->id)->first();
                if($shopping_cart){
                    $shopping_cart_basket = $shopping_cart->baskets->where('product_id', '=', $request->productid)->first();
                    if($shopping_cart_basket){
                        $shopping_cart_basket->count++;
                        $shopping_cart_basket->save();
                    }
                    else{
                        $shopping_cart_basket = new ShoppingcartProduct;
                        $shopping_cart_basket->product_id = $request->productid;
                        $shopping_cart_basket->shopping_cart_id = $shopping_cart->id;
                        $shopping_cart_basket->count = 1;
                        $shopping_cart_basket->save();
                    }
                }
                else{
                    $shopping_cart = new Shoppingcart;
                    $shopping_cart->user_id = Auth::user()->id;
                    $shopping_cart->save();

                    $shopping_cart_basket = new ShoppingcartProduct;
                    $shopping_cart_basket->product_id = $request->productid;
                    $shopping_cart_basket->shopping_cart_id = $shopping_cart->id;
                    $shopping_cart_basket->count = 1;
                    $shopping_cart_basket->save();
                }
            }
            else{                
                $shopping_cart = Shoppingcart::where('session_id', '=', Session::getId())->first();
                if($shopping_cart){
                    $shopping_cart_basket = $shopping_cart->baskets->where('product_id', '=', $request->productid)->first();
                    if($shopping_cart_basket){
                        $shopping_cart_basket->count++;
                        $shopping_cart_basket->save();
                    }
                    else{
                        $shopping_cart_basket = new ShoppingcartProduct;
                        $shopping_cart_basket->product_id = $request->productid;
                        $shopping_cart_basket->shopping_cart_id = $shopping_cart->id;
                        $shopping_cart_basket->count = 1;
                        $shopping_cart_basket->save();
                    }
                }
                else{
                    $shopping_cart = new Shoppingcart;
                    $shopping_cart->session_id = Session::getId();
                    $shopping_cart->save();

                    $shopping_cart_basket = new ShoppingcartProduct;
                    $shopping_cart_basket->product_id = $request->productid;
                    $shopping_cart_basket->shopping_cart_id = $shopping_cart->id;
                    $shopping_cart_basket->count = 1;
                    $shopping_cart_basket->save();
                }
            }

            DB::commit();

            return response()->json(true);
        }catch(\Exception $e){
            DB::rollback();
            return response()->json([
                'error' => $e->getMessage()
            ]);
        }
    }

    public function remove(Request $request){
        try{
            DB::beginTransaction();
            if(Auth::check()){
                $shopping_cart_basket = Shoppingcart::where('user_id', '=', Auth::user()->id)->first()?->baskets->where('product_id', '=', $request->productid)->first();
                if($shopping_cart_basket->count > 1){
                    $shopping_cart_basket->count--;
                    $shopping_cart_basket->save();
                }
                else{
                    $shopping_cart_basket->delete();
                }
            }
            else{                
                $shopping_cart_basket = Shoppingcart::where('session_id', '=', Session::getId())->first()?->baskets->where('product_id', '=', $request->productid)->first();
                if($shopping_cart_basket->count > 1){
                    $shopping_cart_basket->count--;
                    $shopping_cart_basket->save();
                }
                else{
                    $shopping_cart_basket->delete();
                }
            }

            DB::commit();

            return response()->json(true);
        }catch(\Exception $e){
            DB::rollback();
            return response()->json([
                'error' => $e->getMessage()
            ]);
        }
    }

    public function clean(Request $request){
        try{
            DB::beginTransaction();
            if(Auth::check()){
                $shopping_cart_baskets = Shoppingcart::where('user_id', '=', Auth::user()->id)->first()?->baskets;
                foreach($shopping_cart_baskets as $shopping_cart_basket){
                    $shopping_cart_basket->delete();
                }
            }
            else{                
                $shopping_cart_baskets = Shoppingcart::where('session_id', '=', Session::getId())->first()?->baskets;
                foreach($shopping_cart_baskets as $shopping_cart_basket){
                    $shopping_cart_basket->delete();
                }
            }

            DB::commit();

            return response()->json(true);
        }catch(\Exception $e){
            DB::rollback();
            return response()->json([
                'error' => $e->getMessage()
            ]);
        }
    }

    public function getCount(){
        if(Auth::check()){
            $shopping_cart_baskets = Shoppingcart::where('user_id', '=', Auth::user()->id)
                                    ->first()?->baskets;
        }
        else{
            $shopping_cart_baskets = Shoppingcart::where('session_id', '=', Session::getId())
                                    ->first()?->baskets;
        }

        $count = 0;

        if($shopping_cart_baskets){
            foreach($shopping_cart_baskets as $shopping_cart_basket){
                $count += $shopping_cart_basket->count;
            }
        }
        return response()->json($count);
    }

    public function checkCoupon(Request $request){
        try{
            $requestCode = $request->coupon_code;

            $couponQuery = Coupon::where('code', '=', $requestCode)->first();
    
            if($couponQuery){
                return response()->json($couponQuery);
            }
        }catch(\Exception $e){
            return response()->json($e->getMessage());
        }

    }

    public function getDetails(Request $request){
        $taxes = [];
        $discounts = [];
        $allTaxes = Tax::all();
        if(Auth::check()){
            $baskets = Shoppingcart::where('user_id', '=', Auth::user()->id)->first()?->baskets;
        }
        else{
            $baskets = Shoppingcart::where('session_id', '=', Session::getId())->first()?->baskets;
        }

        foreach($allTaxes as $tax){
            $taxTotal = 0;
            foreach($baskets as $basket){
                foreach($basket->product->taxes as $productTax){
                    if($productTax->id == $tax->id){
                        if($tax->type == 'percentage'){
                            $taxTotal += ($basket->product->price * $tax->amount / 100) * $basket->count; 
                        }
                        else if($tax->type == 'currency'){
                            $taxTotal += $tax->amount;
                        }
                    }
                }
            }
            $taxes[] = [
                "name" => $tax->name,
                "amount" => $tax->amount.($tax->type == 'percentage' ? '%' : 'TL'),
                "price" => $taxTotal,
            ];
        }
        
        $cargo = Cargo::where('status', '=', 'active')->first();
        
        $discount = [
            "name" => "NONE",
            "price" => 0
        ];
        $discounts[] = $discount;

        return response()->json([
            "baskets" => $baskets,
            "taxes" => $taxes,
            "cargo" => $cargo,
            "discounts" => $discounts
        ]);
    }
}
