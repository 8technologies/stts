<?php

use App\Models\category;
use App\Models\City;
use App\Models\Country;
use App\Models\User;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('products'))
        //Schema::dropIfExists('products');
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string('name');
            $table->foreignIdFor(category::class);
            $table->foreignIdFor(User::class);
            $table->foreignIdFor(Country::class);
            $table->foreignIdFor(City::class);
            $table->string('price')->nullable();
            $table->string('slug')->nullable();
            $table->string('status')->nullable();
            $table->text('description')->nullable();
            $table->string('quantity')->nullable();
            $table->text('images')->nullable();
            $table->text('thumbnail')->nullable();
            $table->text('attributes')->nullable(); 
            $table->integer('sub_category_id')->nullable();
            $table->tinyInteger('fixed_price')->nullable();
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
