<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Coupon;
use App\Models\CouponUser;
use Illuminate\Support\Facades\Auth;

class CouponController extends Controller
{
    public function control(Request $request){
        $code = $request->code;

        $coupon = Coupon::where('code', '=', $code)->first();

        if($coupon){
            if($coupon->definedUser(Auth::user()->id) == false){
                return response()->json(['status' => false, 'message' => 'Bu kupon size tanımlanmamış.']);
            }
            else{
                return response()->json(['status' => true, 'coupon_user' => $coupon->definedUser(Auth::user()->id)]);
            }
        }
        else{
            return response()->json(['status' => false, 'message' => 'Kupon bulunamadı.']);
        }
    }
}
