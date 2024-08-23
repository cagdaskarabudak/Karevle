<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'categories';
    protected $fillable = [
        'name',
        'slug',
        'parent_category_id',
        'sort'
    ];

    public function parent_category(){
        return $this->belongsTo(Category::class, 'parent_category_id', 'id');
    }

    public function products(){
        return $this->hasMany(Product::class, 'category_id', 'id')->with('images');
    }

    public function getAllProducts(){
        $products = [];
        foreach($this->products as $product){
            $products[] = $product;
        }

        foreach($this->getAllSubCategories() as $subCategory){
            foreach($subCategory->products as $product){
                $products[] = $product;
            }
        }

        return $products;
    }

    public function getTopMostCategory(){
        $category = $this;
        $categories = [];
        $categories[] = $this;
        while ($category->parent_category) {
            $categories[] = $category->parent_category;
            $category = $category->parent_category;
        }
        return array_reverse($categories);
    }

    public function isTopCategory(){
        $categories = Category::all();
        $status = false;
        foreach($categories as $category){
            if($category->parent_category_id == $this->id){
                $status = true;
                break;
            }
        }

        return $status;
    }

    public function child_categories(){
        return $this->hasMany(Category::class, 'parent_category_id', 'id');
    }

    public function getAllSubCategories() {
        $categories = [];
        $this->collectSubCategories($this, $categories);
    
        return $categories;
    }
    
    private function collectSubCategories($category, &$categories) {
        if($category != $this){
            $categories[] = $category;
        }
    
        foreach ($category->child_categories as $subCategory) {
            $this->collectSubCategories($subCategory, $categories);
        }
    }
}
