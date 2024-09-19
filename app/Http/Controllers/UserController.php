<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\User;

class UserController extends Controller
{
    public function myProfileView(){
        return view('user.profile');
    }

    public function myOrdersView(){
        return view('user.orders');
    }

    public function myAdressesView(){
        return view('user.addresses');
    }

    public function myCouponsView(){
        return view('user.coupons');
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
            'user_avatar' => 'nullable|file|mimes:jpg,png,heic,jpeg|max:2048'
        ]);

        $errors = [];
        $successes = [];

        try{
            DB::beginTransaction();
            $user = User::where('id', '=', Auth::user()->id)->first();

            if ($request->file('user_avatar')) {
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
}
