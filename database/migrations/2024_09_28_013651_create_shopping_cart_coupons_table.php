<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('shopping_cart_coupons', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('shopping_cart_id');
            $table->unsignedBigInteger('coupon_id');
            $table->foreign('shopping_cart_id')->references('id')->on('shopping_carts')->onDelete('cascade');
            $table->foreign('coupon_id')->references('id')->on('coupons')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('shopping_cart_coupons');
    }
};
