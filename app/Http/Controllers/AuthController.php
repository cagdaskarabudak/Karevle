<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

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

        return redirect()->back();
    }
}
