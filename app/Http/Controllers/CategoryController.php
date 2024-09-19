<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    public function view(string $slug){
        $category = Category::where('slug', '=', $slug)->first();

        return view('category')->with('category', $category);
    }
}
