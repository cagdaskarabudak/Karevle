<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    public function view(string $slug){
        $activeCategory = Category::where('slug', '=', $slug)->with('products')->first();
        $categories = Category::all();
        return view('category')->with([
            'activeCategory' => $activeCategory,
            'categories' => $categories
        ]);
    }

    public function example(){
        $category = Category::with('products')->first();

        return $category->getAllProducts();
    }
}
