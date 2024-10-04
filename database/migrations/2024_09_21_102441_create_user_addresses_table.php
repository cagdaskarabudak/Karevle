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
        Schema::create('user_addresses', function (Blueprint $table) {
            $table->id();
            $table->string('title')->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->enum('type', ['personal', 'personal_company', 'company'])->default('personal');
            $table->string('first_name');
            $table->string('last_name');
            $table->string('ID_number')->nullable();
            $table->string('company_name')->nullable();
            $table->string('tax_office')->nullable();
            $table->string('tax_number')->nullable();
            $table->string('mersis_number')->nullable();
            $table->string('email');
            $table->string('phone');
            $table->string('country');
            $table->string('city');
            $table->string('district');
            $table->text('address');
            $table->string('postal_code');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->integer('is_default');
            $table->integer('is_invoice_default');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_addresses');
    }
};
