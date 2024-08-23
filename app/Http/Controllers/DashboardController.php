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

    public function listproducts(){
        $products = Product::with('images')->get();
        $lists = Liste::all();

        return view('dashboard.product.view')->with([
            'products' => $products,
            'lists' => $lists
        ]);
    }

    public function create_product_view(){
        $categories = Category::all();

        return view('dashboard.product.create')->with('categories', $categories);
    }

    public function update_product_view($id){
        $product = Product::where('id', '=', $id)->first();

        $categories = Category::all();

        $lists = Liste::all();



        return view('dashboard.product.update')->with([
            'categories' => $categories,
            'product' => $product,
            'lists' => $lists
        ]);
    }

    public function create_product_create(Request $request){
        try {

            DB::beginTransaction();
            // PHP ayarlarını geçici olarak artır
            ini_set('upload_max_filesize', '128M'); // Maksimum dosya boyutu (örneğin 50MB)
            ini_set('post_max_size', '128M'); // Maksimum POST verisi boyutu (örneğin 55MB)
            ini_set('max_execution_time', '300'); // Maksimum çalışma süresi (örneğin 300 saniye)
            ini_set('max_input_time', '300'); // Maksimum input süresi (örneğin 300 saniye)

            $request->validate([
                'name' => 'string|required',
                'slug' => 'string|required|unique:products',
                'price' => 'required|regex:/^\d+(\.\d{1,2})?$/',
                'old_price' => 'required|regex:/^\d+(\.\d{1,2})?$/',
                'category' => 'integer|required',
                'images' => 'required|array',
                'images.*' => 'file|mimes:jpg,png,heic,jpeg|max:10000',
                'content' => 'string|required|'
            ]);
    
            // Yeni ürün oluştur
            $product = new Product();
            $product->name = $request->name;
            $product->slug = $request->slug;
            $product->price = $request->price;
            $product->old_price = $request->old_price;
            $product->category_id = $request->category;
            $product->save();
    
            $content = new ProductContent();
            $content->product_id = $product->id;
            $content->content = $request->content;
            $content->save();

            // Resimleri işleyin
            if ($request->hasFile('images')) {
                foreach($request->file('images') as $index => $image) {
                    // Dosya yolunu al
                    $filePath = $image->store('product_images', 'public');
                    $fileName = basename($filePath);
                    // Yeni ürün resmi oluştur
                    $productImage = new ProductImage();
                    $productImage->product_id = $product->id;
                    $productImage->name = $fileName; // Doğru isim almak için
                    $productImage->sort = $index; // Sıralama için index kullan
                    $productImage->save();
                }
            }

            $productlist = new ProductList();
            $productlist->product_id = $product->id;
            $productlist->list_id = 3;
            $productlist->save();
    
            DB::commit();
            return response()->json(['success' => 'Product created successfully']);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function destroyProduct(Request $request){
        try{

            DB::beginTransaction();
            $product = Product::where('id', '=', $request->productid)->first();

            foreach($product->images as $image){
                $image->delete();
            }
            foreach($product->comments as $comment){
                $comment->delete();
            }
            $product->content->delete();
            $product->delete();

            DB::commit();

            return response()->json('success');
        } catch(\Exception $e){
            DB::rollBack();
            return response()->json('errors', $e->getMessage());
        }


    }

    public function checkSlug(Request $request){
        $slug = $request->slug;

        $exists = Product::where('slug', $slug)->exists();

        return response()->json(!$exists);
    }

    public function listcategories(){
        $categories = Category::all();

        return view('dashboard.category.view')->with('categories', $categories);
    }
}
