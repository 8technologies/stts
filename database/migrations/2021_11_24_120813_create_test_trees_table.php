<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTestTreesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
 

     */
    public function up()
    {
        Schema::create('test_trees', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->integer('parent_id');
            $table->integer('order');
            $table->text('title');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('test_trees');
    }
}
