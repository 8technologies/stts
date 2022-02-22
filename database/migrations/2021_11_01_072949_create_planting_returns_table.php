<?php

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlantingReturnsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Schema::dropIfExists('planting_returns');
        Schema::create('planting_returns', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class);
            $table->text("name")->nullable();
            $table->text("address")->nullable();
            $table->text("telephone")->nullable();
            $table->text("seed_rate")->nullable();
            $table->text("registerd_dealer")->nullable();
            $table->text("longitude")->nullable();
            $table->text("latitude")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('planting_returns');
    }
}
