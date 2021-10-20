<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('categories'))
            Schema::create('categories', function (Blueprint $table) {
                $table->id();
                $table->timestamps();
                $table->integer('parent')->nullable();
                $table->string('name');
                $table->string('description')->nullable();
                $table->string('slug')->nullable();
                $table->string('image')->nullable();
            });
    }




    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('categories');
    }
}
