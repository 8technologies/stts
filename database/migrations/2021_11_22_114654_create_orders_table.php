<?php

use App\Models\CropVariety;
use App\Models\Product;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->timestamps();

            $table->foreignIdFor(Administrator::class)->default(1);
            $table->foreignIdFor(Administrator::class, 'order_by')->default(1);
            $table->foreignIdFor(CropVariety::class)->default(1);
            $table->bigInteger("quantity")->nullable()->default(0);
            $table->text("detail")->nullable(); 
            $table->text("status")->nullable(); 
            $table->foreignIdFor(Product::class)->default(1);
            $table->text("payment_type")->nullable(); 
            $table->text("receipt")->nullable(); 
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
