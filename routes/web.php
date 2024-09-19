<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Middleware\AuthMiddleware;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ListController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\MainController;
use App\Http\Controllers\ShoppingCartController;
use App\Http\Controllers\FavoriteController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\UserController;

Route::get('/', [MainController::class, 'home'])->name('home');

Route::get('/urun/{slug}', [ProductController::class, 'viewProduct'])->name('product.show');

Route::get('/liste/{slug}', [ListController::class, 'viewList'])->name('list.view');

Route::get('/kategoriler/{slug}', [CategoryController::class, 'view'])->name('category.view');

Route::get('/tum-urunler', [ProductController::class, 'viewAll'])->name('allProducts.view');

Route::post('/mainSearch', [SearchController::class, 'mainSearch'])->name('mainSearch');
Route::get('/arama', [SearchController::class, 'search'])->name('search');

Route::middleware(['guest'])->group(function (){
    Route::get('giris-yap', [AuthController::class, 'loginView'])->name('login.view');
    Route::get('kayit-ol', [AuthController::class, 'registerView'])->name('register.view');
    Route::post('/register', [AuthController::class, 'register'])->name('register.post');
    Route::post('/login', [AuthController::class, 'login'])->name('login.post');
});

Route::middleware([AuthMiddleware::class])->group(function () {
    Route::get('/profilim', [UserController::class, 'myProfileView'])->name('user.profile');
    Route::post('/profilim/update', [UserController::class, 'update'])->name('user.profile.post');

    Route::get('/profilim/siparislerim', [UserController::class, 'myOrdersView'])->name('user.orders');
    Route::get('/profilim/adreslerim', [UserController::class, 'myAdressesView'])->name('user.addresses');
    Route::get('/profilim/kuponlarım', [UserController::class, 'myCouponsView'])->name('user.coupons');

    Route::get('/favorilerim', [FavoriteController::class, 'viewFavorites'])->name('favorites');
    Route::post('/addFavorites', [FavoriteController::class, 'addFavorites'])->name('addFavorites');
    Route::post('/removeFavorites', [FavoriteController::class, 'removeFavorites'])->name('removeFavorites');

    Route::get('/logout', [AuthController::class, 'logout'])->name('logout');

    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard.home');

});


