<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Liste;
use App\Models\Category;
use App\Http\Controllers\CategoryController;

class ListController extends Controller
{
    public function viewList($slug){
        $liste = Liste::where('slug', '=', $slug)->first();

        return view('liste')->with('liste', $liste);
    }
}
