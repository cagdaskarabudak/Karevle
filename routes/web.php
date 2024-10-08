<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Middleware\AuthMiddleware;
use App\Http\Middleware\ShoppingcartMiddleware;
use App\Http\Middleware\RoleMiddleware;
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
use App\Http\Controllers\CouponController;
use App\Http\Controllers\IyzicoController;
use App\Http\Controllers\OrderController;

Route::get('/', [MainController::class, 'home'])->name('home');

Route::get('/urun/{slug}', [ProductController::class, 'viewProduct'])->name('product.show');

Route::get('/liste/{slug}', [ListController::class, 'viewList'])->name('list.view');

Route::get('/kategoriler/{slug}', [CategoryController::class, 'view'])->name('category.view');

Route::get('/tum-urunler', [ProductController::class, 'viewAll'])->name('allProducts.view');

Route::post('/mainSearch', [SearchController::class, 'mainSearch'])->name('mainSearch');
Route::get('/arama', [SearchController::class, 'search'])->name('search');

Route::post('/add-shoppingcart-delivery-address', [ShoppingCartController::class, 'addShoppingCartDeliveryAddress'])->name('add-shoppingcart-delivery-address');
Route::post('/add-shoppingcart-invoice-address', [ShoppingCartController::class, 'addShoppingCartInvoiceAddress'])->name('add-shoppingcart-invoice-address');
Route::get('/example-payment', [IyzicoController::class, 'createPayment']);

Route::middleware([ShoppingcartMiddleware::class])->group(function () {
    Route::get('/sepetim', [ShoppingCartController::class, 'view'])->name('shopping-cart.view');
    Route::get('/sepetim/onayla', [ShoppingCartController::class, 'confirmView'])->name('shopping-cart.confirm.view');
    Route::get('/sepetim/odeme', [ShoppingCartController::class, 'paymentView'])->name('shopping-cart.payment.view');
    Route::post('/sepetim/odeme', [ShoppingCartController::class, 'paymentTransaction'])->name('shopping-cart.payment.transaction');
    Route::post('/sepetim/odeme/3Donay', [IyzicoController::class, 'complete3DSecurePayment']);
    Route::get('/shopping-cart/destroy', [ShoppingCartController::class, 'destroy'])->name('shopping-cart.destroy');
    Route::get('/order/create', [OrderController::class, 'create'])->name('order.create');
    Route::post('/order/status_update', [OrderController::class, 'status_update'])->name('order.status_update');
});

Route::post('/addShoppingCart', [ShoppingCartController::class, 'add'])->name('shopping-cart.add');
Route::post('/removeShoppingCart', [ShoppingCartController::class, 'remove'])->name('shopping-cart.remove');
Route::post('/cleanShoppingCart', [ShoppingCartController::class, 'clean'])->name('shopping-cart.clean');
Route::post('/countShoppingCart', [ShoppingCartController::class, 'getCount'])->name('shopping-cart.count');
Route::post('/checkCoupon', [ShoppingCartController::class, 'checkCoupon'])->name('shopping-cart.checkCoupon');
Route::post('/details-shopping-cart', [ShoppingCartController::class, 'getDetails'])->name('shopping-cart.details');
Route::post('/coupon-cancel', [ShoppingCartController::class, 'cancelCoupon'])->name('shopping-cart.cancelCoupon');

Route::get('/example', [MainController::class, 'example']);

Route::post('/coupon-query', [CouponController::class, 'control'])->name('coupon.control');

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
    Route::get('/profilim/adreslerim/adres-olustur', [UserController::class, 'createAddressView'])->name('user.addresses.create');
    Route::post('/profilim/adreslerim/adres-olustur', [UserController::class, 'createAddress'])->name('user.address.create');
    Route::post('/deleteAddress', [UserController::class, 'deleteAddress'])->name('user.address.delete');
    Route::get('/profilim/adreslerim/{id}', [UserController::class, 'editAddressView'])->name('user.addresses.edit');
    Route::post('/profilim/adreslerim/duzenle', [UserController::class, 'editAddress'])->name('user.addresses.edit.post');
    Route::post('/defaultAddress', [UserController::class, 'defaultAddress'])->name('user.address.default');
    Route::post('/defaultInvoiceAddress', [UserController::class, 'defaultInvoiceAddress'])->name('user.address.invoiceDefault');
    Route::get('/profilim/kuponlarim', [UserController::class, 'myCouponsView'])->name('user.coupons');

    Route::get('/favorilerim', [FavoriteController::class, 'viewFavorites'])->name('favorites');
    Route::post('/addFavorites', [FavoriteController::class, 'addFavorites'])->name('addFavorites');
    Route::post('/removeFavorites', [FavoriteController::class, 'removeFavorites'])->name('removeFavorites');

    Route::get('/logout', [AuthController::class, 'logout'])->name('logout');

});

Route::middleware([RoleMiddleware::class])->group(function(){
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard.home');
});


