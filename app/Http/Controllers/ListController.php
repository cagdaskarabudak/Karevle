<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Liste;
use App\Models\Category;
use App\Http\Controllers\CategoryController;

class ListController extends Controller
{
    public function viewList(string $slug){
        $list = Liste::where('slug', '=', $slug)->first();
        $categories = Category::where('parent_category_id', '=', null)->get();
        
        return view('list')->with([
            'list' => $list,
            'categories' => $categories
        ]);
    }
}
