<?php

use App\Models\CropVariety;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePreOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pre_orders', function (Blueprint $table) {
            $table->id();
            $table->timestamps();

            $table->foreignIdFor(Administrator::class)->default(1);
            $table->foreignIdFor(CropVariety::class)->default(1);
            $table->bigInteger("quantity")->nullable();
            $table->text("seed_class")->nullable();
            $table->text("invetory_status")->nullable(); 
            $table->text("collection_date")->nullable(); 
            $table->text("pickup_location")->nullable();  
            $table->text("detail")->nullable(); 
            $table->text("status")->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pre_orders');
    }
}
