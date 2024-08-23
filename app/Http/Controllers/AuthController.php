<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{
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

    public function update(Request $request){
        $request->validate([
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'username' => 'required|max:32|min:6|string',
            'email' => 'required|email|string',
            'phone' => 'required|string|min:10|max:10',
            'old_password' => 'nullable|string',
            'password' => 'nullable|string|min:8|max:32|confirmed',
            'user_avatar' => 'required|file|mimes:jpg,png,heic,jpeg|max:2048'
        ]);

        $errors = [];
        $successes = [];

        try{
            DB::beginTransaction();
            $user = User::where('id', '=', Auth::user()->id)->first();

            if ($request->file('user_avatar')->isValid()) {
                $filePath = $request->file('user_avatar')->store('avatars', 'public');
    
                $user->avatar = $filePath;

                $successes[] = 'Avatar başarıyla yüklendi! Yolu: ' . $filePath;
            }

            if($request->first_name != $user->first_name){
                $user->first_name = $request->first_name;
                $successes[] = 'İsim Değişti.';
            }

            if($request->last_name != $user->last_name){
                $user->last_name = $request->last_name;
                $successes[] = 'Soyisim Değişti.';
            }

            if($request->username != $user->username){
                $user->username = $request->username;
                $successes[] = 'Kullanıcı Adı Değişti.';
            }

            if($request->email != $user->email){
                $user->email = $request->email;
                $successes[] = 'E-Posta Değişti.';
            }

            if($request->phone != $user->phone){
                $user->phone = $request->phone;
                $successes[] = 'Telefon Değişti.';
            }

            if($request->old_password != '' && $request->old_password != null){
                if($request->password != '' && $request->password != null){
                    if(Hash::check($request->old_password, $user->password)){
                        $user->password = Hash::make($request->password);
                        $successes[] = 'Şifre Değişti.';
                    }
                    else{
                        $errors[] = 'Eski şifre uyuşmadı! Şifre değiştirilemedi.';
                    }
                }
                else{
                    $errors[] = 'Yeni şifre yazmadınız! Şifre değiştirilemedi.';
                }
            }

            $user->save();

            DB::commit();

            return redirect()->back()->with([
                'successes' => $successes
            ])->withErrors($errors);


        } catch(\Exception $e){

            DB::rollBack();
            return redirect()->back()->with('errors', $e->getMessage());
        }
    }

    public function logout(){
        Auth::logout();

        return redirect()->back();
    }
}
