<?php

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubGrowersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sub_growers', function (Blueprint $table) {
            $table->id();
            $table->timestamps(); 

            $table->foreignIdFor(Administrator::class)->default(1);
            $table->text('name')->nullable();
            $table->integer('size')->nullable();
            $table->text('crop')->nullable();
            $table->text('variety')->nullable();
            $table->text('district')->nullable();
            $table->text('subcourty')->nullable();
            $table->text('planting_date')->nullable();
            $table->text('quantity_planted')->nullable();
            $table->text('expected_yield')->nullable(); 
            $table->text('phone_number')->nullable();
            $table->text('gps_latitude')->nullable();
            $table->text('gps_longitude')->nullable();
            $table->text("detail")->nullable(); 
            $table->text("status")->nullable();
            $table->integer('inspector')->nullable();
            $table->text('status_comment')->nullable();
        });
    } 

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sub_growers');
    }
}
