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

Route::get('/', [MainController::class, 'home'])->name('home');

Route::get('/hakkimizda', function () {
    return view('about-me');
})->name('about-me');

Route::get('/iletisim', function () {
    return view('contact');
})->name('contact');

Route::get('/urun/{slug}', [ProductController::class, 'viewProduct'])->name('product.show');

Route::get('/liste/{slug}', [ListController::class, 'viewList'])->name('list.show');

Route::middleware(['guest'])->group(function () {
    Route::post('/register', [AuthController::class, 'register'])->name('register.post');
    Route::post('/login', [AuthController::class, 'login'])->name('login.post');
});

Route::post('/getProductInfo', [ProductController::class, 'getProductInfo'])->name('getProductInfo');

Route::post('/getBaskets', [ShoppingCartController::class, 'getBaskets'])->name('getBaskets');

Route::post('/basket-product', [ProductController::class, 'basketProduct'])->name('product.basket');

Route::post('/clear-basket', [ShoppingCartController::class, 'clearBasket'])->name('basket.clear');

Route::post('/unbasket-product', [ProductController::class, 'unBasketProduct'])->name('product.unBasket');

Route::get('/kategoriler/{slug}', [CategoryController::class, 'view'])->name('category.view');

Route::get('/sepetim', [ShoppingCartController::class, 'view'])->name('shopping-card.view');

Route::post('/check/slug', [DashboardController::class, 'checkSlug'])->name('check.slug');

Route::middleware([AuthMiddleware::class])->group(function () {
    Route::get('/profil', function(){
        return view('auth.profile');
    })->name('user.profile');

    Route::get('/favoriler', [FavoriteController::class, 'viewFavorites'])->name('favorites');

    Route::post('/update', [AuthController::class, 'update'])->name('update.post');

    Route::get('/logout', [AuthController::class, 'logout'])->name('logout');

    Route::post('/favoritedProduct', [FavoriteController::class, 'favoritedProduct'])->name('favoritedProduct');

    Route::post('/unFavoritedProduct', [FavoriteController::class, 'unFavoritedProduct'])->name('unFavoritedProduct');

    Route::post('/getFavoritedProducts', [FavoriteController::class, 'getFavoritedProducts'])->name('getFavoritedProducts');

    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard.home');

    Route::get('/dashboard/products', [DashboardController::class, 'listproducts'])->name('dashboard.products');

    Route::get('/dashboard/products/create', [DashboardController::class, 'create_product_view'])->name('dashboard.products.create.view');

    Route::post('/dashboard/products/create', [DashboardController::class, 'create_product_create'])->name('dashboard.products.create.create');

    Route::post('/dashboard/products/destroy', [DashboardController::class, 'destroyProduct'])->name('dashboard.products.destroy');

    Route::get('/dashboard/products/update/{id}', [DashboardController::class, 'update_product_view'])->name('dashboard.products.update.view');

    Route::get('/dashboard/categories', [DashboardController::class, 'listcategories'])->name('dashboard.categories');

});


