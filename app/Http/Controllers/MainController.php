<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Liste;
use App\Models\Slider;
use App\Models\Store;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class MainController extends Controller
{
    public function home(){
        $lists = Liste::all();
        return view('home')->with([
            'lists' => $lists
        ]);
    }

    public function example(){
        $stores = Store::all();
        $products = Product::all();
        return view('example')->with(['stores' => $stores, 'products' => $products]);
    }
}
