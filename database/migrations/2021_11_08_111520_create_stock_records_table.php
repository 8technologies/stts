<?php

use App\Models\CropVariety;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStockRecordsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stock_records', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class)->default(1);
            $table->foreignIdFor(CropVariety::class)->default(1);
            $table->integer("seed_class")->nullable();
            $table->text("source")->nullable();
            $table->text("detail")->nullable();
            $table->bigInteger("quantity")->nullable();
            $table->tinyInteger("is_deposit")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('stock_records');
    }
}
