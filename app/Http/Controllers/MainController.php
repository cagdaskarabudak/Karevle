<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Liste;
use App\Models\Slider;
use App\Models\UserBasket;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class MainController extends Controller
{
    public function home(){
        $lists = Liste::orderBy('sort')->get();
        $sliders = Slider::all();
        if(Auth::check()){
            $userBaskets = UserBasket::where('user_id', '=', Auth::user()->id)->get();
        }
        else{
            $userBaskets = UserBasket::where('session_id', '=', Session::getId())->get();
        }
        return view('home')->with([
            'lists' => $lists,
            'sliders' => $sliders,
            'userBaskets' => $userBaskets
        ]);
    }
}
