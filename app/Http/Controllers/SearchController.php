<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Product;

class SearchController extends Controller
{
    public function mainSearch(Request $request){
        $request->validate([
            'keys' => 'required|string|max:255',
        ]);

        $searchTerm = $request->keys;

        $categories = Category::where('name', 'LIKE', '%' . $searchTerm . '%')
            ->limit(10)
            ->get();
        
        $products = Product::where('name', 'LIKE', '%' . $searchTerm . '%')
            ->limit(10)
            ->get();

        return response()->json([
            'categories' => $categories,
            'products' => $products
        ]);
    }

    public function search(Request $request){

        $products = Product::where('name', 'LIKE', '%'.$request->terimler.'%')->get();

        return view('search')->with([
                'products' => $products,
                'keys' => $request->terimler
            ]);

    }
}

