<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\User;
use Illuminate\Support\Facades\Session;
use App\Models\UserBasket;
use App\Models\Shoppingcart;
use App\Models\ShoppingcartProduct;
use App\Models\ShoppingcartCargo;
use App\Models\ShoppingCartDeliveryAddress;
use App\Models\ShoppingCartInvoiceAddress;
use App\Models\Coupon;
use App\Models\CouponUser;
use App\Models\Cargo;
use App\Models\Address;
use App\Models\Tax;
use App\Models\Session as SessionModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use App\Models\ShoppingcartCoupon;
use App\Http\Controllers\IyzicoController;

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
            return view('shopping-cart.shopping-cart')->with('baskets', $baskets);
        }
        else{
            return view('shopping-cart.shopping-cart')->with('baskets', []);
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

                    $shopping_cart_cargo = new ShoppingcartCargo;
                    $active_cargo = Cargo::where('status', '=', 'active')->first();
                    $shopping_cart_cargo->cargo_id = $active_cargo->id;
                    $shopping_cart_cargo->shopping_cart_id = $shopping_cart->id;
                    $shopping_cart_cargo->save();

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

                    $shopping_cart_cargo = new ShoppingcartCargo;
                    $active_cargo = Cargo::where('status', '=', 'active')->first();
                    $shopping_cart_cargo->cargo_id = $active_cargo->id;
                    $shopping_cart_cargo->shopping_cart_id = $shopping_cart->id;
                    $shopping_cart_cargo->save();

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
                $shopping_cart = Shoppingcart::where('user_id', '=', Auth::user()->id)->first();
                if($shopping_cart){
                    $shopping_cart_baskets = $shopping_cart->baskets;
                    foreach($shopping_cart_baskets as $shopping_cart_basket){
                        $shopping_cart_basket->delete();
                    }
                    $shopping_cart_coupons = ShoppingcartCoupon::where('shopping_cart_id', '=', $shopping_cart->id)->get();
                    foreach($shopping_cart_coupons as $shopping_cart_coupon){
                        $shopping_cart_coupon->delete();
                    }
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
                if($couponQuery->expiration_time > Carbon::now()){
                    $couponUser = CouponUser::where('user_id', '=', Auth::user()->id)->where('coupon_id', '=', $couponQuery->id)->first();
                    if($couponUser){
                        if($couponQuery->user_use_limit > $couponUser->is_used){
                            if(Auth::check()){
                                $shopping_cart = Shoppingcart::where('user_id', '=', Auth::user()->id)->first();
                                $shopping_cart_coupon = new ShoppingcartCoupon;
                                $shopping_cart_coupon->coupon_id = $couponQuery->id;
                                $shopping_cart_coupon->shopping_cart_id = $shopping_cart->id;
                                $shopping_cart_coupon->save();
                                return response()->json(['status' => true, 'coupon' => $couponQuery]);
                            }
                        }
                        else{
                            return response()->json(['status' => false, 'message' => 'Kupon daha önce kullanılmış.']);
                        }
                    }
                    else{
                        return response()->json(['status' => false, 'message' => 'Bu kuponu kullanamazsınız.']);
                    }
                }
                else{
                    return response()->json(['status' => false, 'message' => 'Bu kupon kullanımdan kaldırılmış.']);
                }
            }
            else{
                return response()->json(['status' => false, 'message' => 'Kupon bulunamadı.']);
            }
        }catch(\Exception $e){
            return response()->json($e->getMessage());
        }

    }

    public function getDetails(Request $request){
        if(Auth::check()){
            $shopping_cart = Shoppingcart::where('user_id', '=', Auth::user()->id)->first();
        }
        else{
            $shopping_cart = Shoppingcart::where('session_id', '=', Session::getId())->first();
        }

        //baskets
        if($shopping_cart){
            $baskets = $shopping_cart->baskets;

            //vat_total
            $vatTotal = 0;
            foreach($baskets as $basket){
                $vatTotal += $basket->product->calc_vat * $basket->count;
            }

            //discounts_total
            $discountsTotal = 0;
            foreach($baskets as $basket){
                $discountsTotal += $basket->count * ($basket->product->sale_price - $basket->product->price);
            }

            return response()->json([
                "baskets" => $baskets,
                "vat_total" => $vatTotal,
                "cargo" => $shopping_cart->cargo,
                "coupon" => $shopping_cart->coupon,
                "discounts_total" => $discountsTotal
            ]);
        }
    }

    public function cancelCoupon(Request $request){

        if(Auth::check()){
            $shopping_cart = Shoppingcart::where('user_id', '=', Auth::user()->id)->first();
        }
        else{
            $shopping_cart = Shoppingcart::where('session_id', '=', Session::getId())->first();
        }
    
        $shopping_cart_coupon = ShoppingcartCoupon::where('shopping_cart_id', '=', $shopping_cart->id)->where('coupon_id', '=', $request->coupon_id)->first();
    
        if($shopping_cart_coupon){
            $shopping_cart_coupon->delete();
            return response()->json(true);
        }
        else{
            return response()->json(false);
        }
    }

    public function confirmView(){
        if(Auth::check()){
            $shopping_cart = Shoppingcart::where('user_id', '=', Auth::user()->id)->first();
        }
        else{
            $shopping_cart = Shoppingcart::where('session_id', '=', Session::getId())->first();
        }
        if($shopping_cart){
            $delivery_address = $shopping_cart->delivery_address;
            $invoice_address = $shopping_cart->invoice_address;
            return view('shopping-cart.shopping-cart-confirm')->with([
                'baskets' => $shopping_cart->baskets,
                'address' => $delivery_address,
                'invoice_address' => $invoice_address
            ]);
            
        }
        
    }

    public function addShoppingCartDeliveryAddress(Request $request){
        try{

            DB::beginTransaction();

            if(Auth::check()){
                $shopping_cart = Shoppingcart::where('user_id', '=', Auth::user()->id)->first();
                //WITH LOGIN
                $request->validate([
                    'delivery_address_id' => 'required'
                ]);

                $delivery_address = Address::where('id', '=', $request->delivery_address_id)->first();
                if($shopping_cart->delivery_address){
                    $address = $shopping_cart->delivery_address;
                }
                else{
                    $address = new ShoppingCartDeliveryAddress;
                }
                $address->shopping_cart_id = $shopping_cart->id;
                $address->address_id = $delivery_address->id;
                $address->save();
            }
            else{
                $shopping_cart = Shoppingcart::where('session_id', '=', Session::getId())->first();
                //WITHLESS LOGIN

                if($request->address_type){
                    if($request->address_type == 'personal'){
                        $request->validate([
                            'first_name' => 'string|required',
                            'last_name' => 'string|required',
                            'email' => 'required|email',
                            'phone' => 'required|string|max:10|min:10',
                            'country' => 'required|string',
                            'city' => 'required|string',
                            'district' => 'required|string',
                            'address' => 'required|string',
                            'postal_code' => 'required|string|min:5|max:5'
                        ]);

                        if($shopping_cart->delivery_address){
                            $address = $shopping_cart->delivery_address;
                        }
                        else{
                            $address = new ShoppingCartDeliveryAddress;
                        }
                        
                        $address->shopping_cart_id = $shopping_cart->id;
                        $address->type = $request->address_type;
                        $address->first_name = $request->first_name;
                        $address->last_name = $request->last_name;
                        $address->email = $request->email;
                        $address->phone = $request->phone;
                        $address->country = $request->country;
                        $address->city = $request->city;
                        $address->district = $request->district;
                        $address->address = $request->address;
                        $address->postal_code = $request->postal_code;
            
                        $address->save();
                    }
                    else if($request->address_type == 'personal_company'){
                        $request->validate([
                            'first_name' => 'string|required',
                            'last_name' => 'string|required',
                            'ID_number' => 'string|required|max:11',
                            'email' => 'required|email',
                            'phone' => 'required|string|max:10|min:10',
                            'country' => 'required|string',
                            'city' => 'required|string',
                            'district' => 'required|string',
                            'address' => 'required|string',
                            'postal_code' => 'required|string|min:5|max:5'
                        ]);
    

                        if($shopping_cart->delivery_address){
                            $address = $shopping_cart->delivery_address;
                        }
                        else{
                            $address = new ShoppingCartDeliveryAddress;
                        }
                        $address->shopping_cart_id = $shopping_cart->id;
                        $address->type = $request->address_type;
                        $address->first_name = $request->first_name;
                        $address->last_name = $request->last_name;
                        $address->ID_number = $request->ID_number;
                        $address->email = $request->email;
                        $address->phone = $request->phone;
                        $address->country = $request->country;
                        $address->city = $request->city;
                        $address->district = $request->district;
                        $address->address = $request->address;
                        $address->postal_code = $request->postal_code;
            
                        $address->save();
                    }
                    else if($request->address_type == 'company'){
                        $request->validate([
                            'first_name' => 'string|required',
                            'last_name' => 'string|required',
                            'company_name' => 'string|required',
                            'tax_office' => 'string|required',
                            'tax_number' => 'string|required',
                            'mersis_number' => 'string|required',
                            'email' => 'required|email',
                            'phone' => 'required|string|max:10|min:10',
                            'country' => 'required|string',
                            'city' => 'required|string',
                            'district' => 'required|string',
                            'address' => 'required|string',
                            'postal_code' => 'required|string|min:5|max:5'
                        ]);
    

                        if($shopping_cart->delivery_address){
                            $address = $shopping_cart->delivery_address;
                        }
                        else{
                            $address = new ShoppingCartDeliveryAddress;
                        }
                        $address->shopping_cart_id = $shopping_cart->id;
                        $address->type = $request->address_type;
                        $address->first_name = $request->first_name;
                        $address->last_name = $request->last_name;
                        $address->company_name = $request->company_name;
                        $address->tax_office = $request->tax_office;
                        $address->tax_number = $request->tax_number;
                        $address->mersis_number = $request->mersis_number;
                        $address->email = $request->email;
                        $address->phone = $request->phone;
                        $address->country = $request->country;
                        $address->city = $request->city;
                        $address->district = $request->district;
                        $address->address = $request->address;
                        $address->postal_code = $request->postal_code;
            
                        $address->save();
                    }
                }
            }

            DB::commit();

            return response()->json([
                'status' => true
            ]);
        }catch(\Exception $e){
            DB::rollback();
            return response()->json(['status' => false, 'message' => $e->getMessage()]);
        }
    }

    public function addShoppingCartInvoiceAddress(Request $request){


        try{

            DB::beginTransaction();

            if(Auth::check()){
                $shopping_cart = Shoppingcart::where('user_id', '=', Auth::user()->id)->first();
                //WITH LOGIN
                $request->validate([
                    'invoice_address_id' => 'required'
                ]);

                $invoice_address = Address::where('id', '=', $request->invoice_address_id)->first();
                if($shopping_cart->invoice_address){
                    $address = $shopping_cart->invoice_address;
                }
                else{
                    $address = new ShoppingCartInvoiceAddress;
                }
                $address->shopping_cart_id = $shopping_cart->id;
                $address->address_id = $invoice_address->id;
                $address->save();
            }
            else{
                $shopping_cart = Shoppingcart::where('session_id', '=', Session::getId())->first();
                //WITHLESS LOGIN

                if($request->address_type){
                    if($request->address_type == 'personal'){
                        $request->validate([
                            'first_name' => 'string|required',
                            'last_name' => 'string|required',
                            'email' => 'required|email',
                            'phone' => 'required|string|max:10|min:10',
                            'country' => 'required|string',
                            'city' => 'required|string',
                            'district' => 'required|string',
                            'address' => 'required|string',
                            'postal_code' => 'required|string|min:5|max:5'
                        ]);
    

                        if($shopping_cart->invoice_address){
                            $address = $shopping_cart->invoice_address;
                        }
                        else{
                            $address = new ShoppingCartInvoiceAddress;
                        }
                        $address->shopping_cart_id = $shopping_cart->id;
                        $address->type = $request->address_type;
                        $address->first_name = $request->first_name;
                        $address->last_name = $request->last_name;
                        $address->email = $request->email;
                        $address->phone = $request->phone;
                        $address->country = $request->country;
                        $address->city = $request->city;
                        $address->district = $request->district;
                        $address->address = $request->address;
                        $address->postal_code = $request->postal_code;
            
                        $address->save();
                    }
                    else if($request->address_type == 'personal_company'){
                        $request->validate([
                            'first_name' => 'string|required',
                            'last_name' => 'string|required',
                            'ID_number' => 'string|required|max:11',
                            'email' => 'required|email',
                            'phone' => 'required|string|max:10|min:10',
                            'country' => 'required|string',
                            'city' => 'required|string',
                            'district' => 'required|string',
                            'address' => 'required|string',
                            'postal_code' => 'required|string|min:5|max:5'
                        ]);
    
                        if($shopping_cart->invoice_address){
                            $address = $shopping_cart->invoice_address;
                        }
                        else{
                            $address = new ShoppingCartInvoiceAddress;
                        }
                        $address->shopping_cart_id = $shopping_cart->id;
                        $address->type = $request->address_type;
                        $address->first_name = $request->first_name;
                        $address->last_name = $request->last_name;
                        $address->ID_number = $request->ID_number;
                        $address->email = $request->email;
                        $address->phone = $request->phone;
                        $address->country = $request->country;
                        $address->city = $request->city;
                        $address->district = $request->district;
                        $address->address = $request->address;
                        $address->postal_code = $request->postal_code;
            
                        $address->save();
                    }
                    else if($request->address_type == 'company'){
                        $request->validate([
                            'first_name' => 'string|required',
                            'last_name' => 'string|required',
                            'company_name' => 'string|required',
                            'tax_office' => 'string|required',
                            'tax_number' => 'string|required',
                            'mersis_number' => 'string|required',
                            'email' => 'required|email',
                            'phone' => 'required|string|max:10|min:10',
                            'country' => 'required|string',
                            'city' => 'required|string',
                            'district' => 'required|string',
                            'address' => 'required|string',
                            'postal_code' => 'required|string|min:5|max:5'
                        ]);
    
                        if($shopping_cart->invoice_address){
                            $address = $shopping_cart->invoice_address;
                        }
                        else{
                            $address = new ShoppingCartInvoiceAddress;
                        }
                        $address->shopping_cart_id = $shopping_cart->id;
                        $address->type = $request->address_type;
                        $address->first_name = $request->first_name;
                        $address->last_name = $request->last_name;
                        $address->company_name = $request->company_name;
                        $address->tax_office = $request->tax_office;
                        $address->tax_number = $request->tax_number;
                        $address->mersis_number = $request->mersis_number;
                        $address->email = $request->email;
                        $address->phone = $request->phone;
                        $address->country = $request->country;
                        $address->city = $request->city;
                        $address->district = $request->district;
                        $address->address = $request->address;
                        $address->postal_code = $request->postal_code;
            
                        $address->save();
                    }
                }
            }

            DB::commit();

            return response()->json([
                'status' => true
            ]);
        }catch(\Exception $e){
            DB::rollback();
            return response()->json(['status' => false, 'message' => $e->getMessage()]);
        }
    }

    public function paymentView(){

        if(Auth::check()){
            $shopping_cart = Shoppingcart::where('user_id', '=', Auth::user()->id)->first();
        }
        else{
            $shopping_cart = Shoppingcart::where('session_id', '=', Session::getId())->first();
        }
        if($shopping_cart){
            return view('shopping-cart.shopping-cart-payment')->with([
                'baskets' => $shopping_cart->baskets,
            ]);
            
        }
    }

    public function paymentTransaction(Request $request){

        $card = [
            "number" => $request->cc_no,
            "month" => $request->cc_month,
            "year" => $request->cc_year,
            "cvc" => $request->cc_cvv,
            "user" => $request->cc_user
        ];

        $order = OrderController::create();

        if($order['status'] == true){
            $orderStatusUpdateTransaction = OrderController::status_update($order['order']->id, 2);
            if($orderStatusUpdateTransaction['status'] == true){
                if($request->has('threeds')){
                    return IyzicoController::paymentWith3DSecure($order['order'], $card);
                }
                else{
                    return IyzicoController::payment($order['order'], $card);
                }
            }
            else{
                return response()->json(['Order not updated!', $orderStatusUpdateTransaction['message'], $orderStatusUpdateTransaction['line']]);
            }
        }
        else{
            return response()->json(['Order not Created!', $order['message'], $order['line']]);
        }
        
    }

    public function destroy(){
        try{
            DB::beginTransaction();
            $shopping_cart = Auth::check() ? Shoppingcart::where('user_id', '=', Auth::user()->id)->first() : Shoppingcart::where('session_id', '=', Session::getId())->first();
            $shopping_cart->delete();
            DB::commit();
            return response()->json(['status' => true]);
        }
        catch(\Exception $e){
            DB::rollback();
            return response()->json(['status' => false, 'message' => $e->getMessage()]);
        }
    }
}


