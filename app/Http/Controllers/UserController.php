<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\Address;

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

    public function createAddressView(){
        return view('user.create_address');
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

    public function createAddress(Request $request){
        try{

            DB::beginTransaction();

            $request->validate([
                'first_name' => 'string|required',
                'last_name' => 'string|required',
                'phone' => 'required|string|max:10|min:10',
                'country' => 'required|string',
                'city' => 'required|string',
                'district' => 'required|string',
                'address' => 'required|string',
                'postal_code' => 'required|string|min:5|max:5'
            ]);
            $user = Auth::user();

            $address = new Address;
            $address->title = $request->title;
            $address->user_id = $user->id;
            $address->first_name = $request->first_name;
            $address->last_name = $request->last_name;
            $address->phone = $request->phone;
            $address->country = $request->country;
            $address->city = $request->city;
            $address->district = $request->district;
            $address->address = $request->address;
            $address->postal_code = $request->postal_code;
            if($request->has('is_default')){
                foreach($user->addresses as $useraddress){
                    $useraddress->update([
                        'is_default' => 0
                    ]);
                }
                $address->is_default = 1;
            }
            else{
                $address->is_default = 0;
            }

            $address->save();

            DB::commit();

            return redirect()->route('user.addresses');
        }catch(\Exception $e){
            DB::rollback();
            return redirect()->back()->withErrors($e->getMessage())->withInput();
        }


    }

    public function deleteAddress(Request $request){
        try{
            DB::beginTransaction();

            $address = Address::where('id', '=', $request->addressid)->first();

            if($address){
                $address->delete();
            }

            DB::commit();
            return response()->json(true);
        }catch(\Exception $e){
            DB::rollback();
            return redirect()->response()->json(false); 
        }
    }

    public function editAddressView($id){
        $address = Address::where('id', '=', $id)->first();

        return view('user.edit-address')->with('address', $address);
    }

    public function editAddress(Request $request){
        try{

            DB::beginTransaction();

            $request->validate([
                'first_name' => 'string|required',
                'last_name' => 'string|required',
                'phone' => 'required|string|max:10|min:10',
                'country' => 'required|string',
                'city' => 'required|string',
                'district' => 'required|string',
                'address' => 'required|string',
                'postal_code' => 'required|string|min:5|max:5'
            ]);

            $user = Auth::user();

            $address = Address::where('id', '=', $request->id)->first();
            $address->title = $request->title;
            $address->first_name = $request->first_name;
            $address->last_name = $request->last_name;
            $address->phone = $request->phone;
            $address->country = $request->country;
            $address->city = $request->city;
            $address->district = $request->district;
            $address->address = $request->address;
            $address->postal_code = $request->postal_code;
            if($request->has('is_default')){
                foreach($user->addresses as $useraddress){
                    $useraddress->update([
                        'is_default' => 0
                    ]);
                }
                $address->is_default = 1;
            }
            else{
                $address->is_default = 0;
            }

            $address->save();

            DB::commit();

            return redirect()->route('user.addresses');
        }catch(\Exception $e){
            DB::rollback();
            return redirect()->back()->withErrors($e->getMessage())->withInput();
        }
    }

    public function defaultAddress(Request $request){
        try{
            DB::beginTransaction();
            $user = Auth::user();
            $address = Address::where('id', '=', $request->addressid)->first();

            foreach($user->addresses as $userAddress){
                $userAddress->is_default = 0;
                $userAddress->save();
            }

            $address->is_default = 1;
            $address->save();

            DB::commit();

            return response()->json(true);
        }catch(\Exception $e){
            DB::rollback();
            return redirect()->back()->withErrors($e->getMessage());
        }
    }
}
