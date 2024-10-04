<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use App\Models\Order;
use App\Models\OrderAddress;
use App\Models\OrderInvoiceAddress;
use App\Models\Shoppingcart;
use App\Models\OrderCoupon;
use App\Models\OrderCargo;
use App\Models\OrderProduct;

class OrderController extends Controller
{
    public static function create(){
        try{
            DB::beginTransaction();

            if(Auth::check()){
                $shopping_cart = Shoppingcart::where('user_id', '=', Auth::user()->id)->first();
            }
            else{
                $shopping_cart = Shoppingcart::where('session_id', '=', Session::getId())->first();
            }
    
            $order = new Order;
            $order->user_id = Auth::check() ? Auth::user()->id : null;
            $order->status_id = 1;
            $order->save();
    
            $order_delivery_address = new OrderAddress;
            $order_delivery_address->order_id = $order->id;
            $order_delivery_address->type = Auth::check() ? $shopping_cart->delivery_address->user_address->type : $shopping_cart->delivery_address->type;
            $order_delivery_address->first_name = Auth::check() ? $shopping_cart->delivery_address->user_address->first_name : $shopping_cart->delivery_address->first_name;
            $order_delivery_address->last_name = Auth::check() ? $shopping_cart->delivery_address->user_address->last_name : $shopping_cart->delivery_address->last_name;
            $order_delivery_address->ID_number = Auth::check() ? $shopping_cart->delivery_address->user_address->ID_number : $shopping_cart->delivery_address->ID_number;
            $order_delivery_address->company_name = Auth::check() ? $shopping_cart->delivery_address->user_address->company_name : $shopping_cart->delivery_address->company_name;
            $order_delivery_address->tax_office = Auth::check() ? $shopping_cart->delivery_address->user_address->tax_office : $shopping_cart->delivery_address->tax_office;
            $order_delivery_address->tax_number = Auth::check() ? $shopping_cart->delivery_address->user_address->tax_number : $shopping_cart->delivery_address->tax_number;
            $order_delivery_address->mersis_number = Auth::check() ? $shopping_cart->delivery_address->user_address->mersis_number : $shopping_cart->delivery_address->mersis_number;
            $order_delivery_address->email = Auth::check() ? $shopping_cart->delivery_address->user_address->email : $shopping_cart->delivery_address->email;
            $order_delivery_address->phone = Auth::check() ? $shopping_cart->delivery_address->user_address->phone : $shopping_cart->delivery_address->phone;
            $order_delivery_address->country = Auth::check() ? $shopping_cart->delivery_address->user_address->country : $shopping_cart->delivery_address->country;
            $order_delivery_address->city = Auth::check() ? $shopping_cart->delivery_address->user_address->city : $shopping_cart->delivery_address->city;
            $order_delivery_address->district = Auth::check() ? $shopping_cart->delivery_address->user_address->district : $shopping_cart->delivery_address->district;
            $order_delivery_address->address = Auth::check() ? $shopping_cart->delivery_address->user_address->address : $shopping_cart->delivery_address->address;
            $order_delivery_address->postal_code = Auth::check() ? $shopping_cart->delivery_address->user_address->postal_code : $shopping_cart->delivery_address->postal_code;
            $order_delivery_address->save();
    
            $order_invoice_address = new OrderInvoiceAddress;
            $order_invoice_address->order_id = $order->id;
            $order_invoice_address->type = Auth::check() ? $shopping_cart->invoice_address->user_address->type : $shopping_cart->invoice_address->type;
            $order_invoice_address->first_name = Auth::check() ? $shopping_cart->invoice_address->user_address->first_name : $shopping_cart->invoice_address->first_name;
            $order_invoice_address->last_name = Auth::check() ? $shopping_cart->invoice_address->user_address->last_name : $shopping_cart->invoice_address->last_name;
            $order_invoice_address->ID_number = Auth::check() ? $shopping_cart->invoice_address->user_address->ID_number : $shopping_cart->invoice_address->ID_number;
            $order_invoice_address->company_name = Auth::check() ? $shopping_cart->invoice_address->user_address->company_name : $shopping_cart->invoice_address->company_name;
            $order_invoice_address->tax_office = Auth::check() ? $shopping_cart->invoice_address->user_address->tax_office : $shopping_cart->invoice_address->tax_office;
            $order_invoice_address->tax_number = Auth::check() ? $shopping_cart->invoice_address->user_address->tax_number : $shopping_cart->invoice_address->tax_number;
            $order_invoice_address->mersis_number = Auth::check() ? $shopping_cart->invoice_address->user_address->mersis_number : $shopping_cart->invoice_address->mersis_number;
            $order_invoice_address->email = Auth::check() ? $shopping_cart->invoice_address->user_address->email : $shopping_cart->invoice_address->email;
            $order_invoice_address->phone = Auth::check() ? $shopping_cart->invoice_address->user_address->phone : $shopping_cart->invoice_address->phone;
            $order_invoice_address->country = Auth::check() ? $shopping_cart->invoice_address->user_address->country : $shopping_cart->invoice_address->country;
            $order_invoice_address->city = Auth::check() ? $shopping_cart->invoice_address->user_address->city : $shopping_cart->invoice_address->city;
            $order_invoice_address->district = Auth::check() ? $shopping_cart->invoice_address->user_address->district : $shopping_cart->invoice_address->district;
            $order_invoice_address->address = Auth::check() ? $shopping_cart->invoice_address->user_address->address : $shopping_cart->invoice_address->address;
            $order_invoice_address->postal_code = Auth::check() ? $shopping_cart->invoice_address->user_address->postal_code : $shopping_cart->invoice_address->postal_code;
            $order_invoice_address->save();
    
            if($shopping_cart->coupon){
                $order_coupon = new OrderCoupon;
                $order_coupon->order_id = $order->id;
                $order_coupon->coupon_id = $shopping_cart->coupon->id;
                $order_coupon->save();
            }
    
            foreach($shopping_cart->baskets as $basket){
                $order_product = new OrderProduct;
                $order_product->order_id = $order->id;
                $order_product->product_id = $basket->product->id;
                $order_product->sale_price = $basket->product->sale_price;
                $order_product->vat_price = $basket->product->calc_vat;
                $order_product->price = $basket->product->price;
                $order_product->count = $basket->count;
                $order_product->save();
            }
    
            $order_cargo = new OrderCargo;
            $order_cargo->order_id = $order->id;
            $order_cargo->cargo_id = $shopping_cart->cargo->id;
            $order_cargo->price = $shopping_cart->cargo->price;
            $order_cargo->tracking_number = null;
            $order_cargo->save();

            DB::commit();
            return ['status' => true, 'order' => $order];
        } catch(\Exception $e){
            DB::rollBack();
            return ['status' => false, 'message' => $e->getMessage(), 'line' => $e->getLine()];
        }

    }

    public static function status_update($order_id, $status_id){
        try{
            DB::beginTransaction();
            $order = Order::where('id', '=', $order_id)->first();
            $order->status_id = $status_id;
            $order->save();

            DB::commit();
            return ['status' => true, 'order' => $order];
        }
        catch(\Exception $e){

            DB::rollback();
            return ['status' => false, 'message' => $e->getMessage()];
        }
    }

    public function destroy($id){
        try{
            DB::beginTransaction();
            $order = Order::where('id', '=', $id)->first();
            $order->delete();
            DB::commit();
            return ['status' => true];
        }catch(\Exception $e){
            DB::rollBack();
            return ['status' => false, 'message' => $e->getMessage(), 'line' => $e->getLine()];
        }
    }

    public function view(){
        //
    }

    public function getAllOrders(){
        //
    }
}
