<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Role;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\ProductContent;
use App\Models\Category;
use App\Models\ProductList;
use App\Models\Liste;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index(){
        return view('dashboard.home');
    }
}
