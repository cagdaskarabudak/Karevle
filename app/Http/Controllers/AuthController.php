<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use App\Models\Shoppingcart;
use App\Models\ShoppingcartProduct;

class AuthController extends Controller
{
    public function loginView(){
        return view('auth.login');
    }

    public function registerView(){
        return view('auth.register');
    }

    public function register(Request $request){
        $request->validate([
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'username' => 'required|max:32|min:6|string|unique:users',
            'password' => 'required|min:8|max:32|string|confirmed',
            'email' => 'required|email|string|unique:users',
            'phone' => 'required|string|min:10|max:10|unique:users',
            'kvkk' => 'accepted'
        ]);

        try{
            DB::beginTransaction();

            $user = new User;
            $user->first_name = $request->first_name;
            $user->last_name = $request->last_name;
            $user->username = $request->username;
            $user->email = $request->email;
            $user->phone = $request->phone;
            $user->password = Hash::make($request->password);
            $user->save();
            
            DB::commit();

            $shopping_cart = Shoppingcart::where('session_id', '=', Session::getId())->first();
            if($shopping_cart){
                $user_shopping_cart = new Shoppingcart;
                $user_shopping_cart->save();
                foreach($shopping_cart->baskets as $basket){
                    $basket->shopping_cart_id = $user_shopping_cart->id;
                    $basket->save();
                }
                $shopping_cart->delete();
            }
            Auth::login($user);

            return redirect()->back();

        } catch(\Exception $e){
            DB::rollBack();
            return redirect()->back()->with('error', $e->getMessage())->withInput();
        }

    }

    public function login(Request $request){
        $request->validate([
            'username' => 'required',
            'password' => 'required'
        ]);

        $username = $request->input('username');
        $password = $request->input('password');
        $remember = $request->has('remember_me');

        $user = User::where('email', $username)
        ->orWhere('phone', $username)
        ->orWhere('username', $username)
        ->first();

        if ($user && Hash::check($password, $user->password)) {
            $shopping_cart = Shoppingcart::where('session_id', '=', Session::getId())->first();
            $user_shopping_cart = Shoppingcart::where('user_id', '=', $user->id)->first();
            if($shopping_cart){
                if($user_shopping_cart){
                    foreach($shopping_cart->baskets as $basket){
                        $status = 0;
                        foreach($user_shopping_cart->baskets as $userbasket){
                            if($basket->product_id == $userbasket->product_id){
                                $userbasket->count += $basket->count;
                                $basket->delete();
                                $userbasket->save();
                                $status = 1;
                            }
                        }
                        if($status == 0){
                            $basket->shopping_cart_id = $user_shopping_cart->id;
                            $basket->save();
                        }
                    }
                    $shopping_cart->delete();
                }
                else{
                    $user_shopping_cart = new Shoppingcart;
                    $user_shopping_cart->save();
                    foreach($shopping_cart->baskets as $basket){
                        $basket->shopping_cart_id = $user_shopping_cart->id;
                        $basket->save();
                    }
                }
            }
            Auth::login($user, $remember);
            return redirect()->back()
                ->with('success', 'Login successful!');
        }

        return redirect()->back()
        ->with('error', 'Invalid username or password.')
        ->withInput();
    }

    public function logout(){
        Auth::logout();

        return redirect()->route('home');
    }
}
