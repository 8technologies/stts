<?php

use App\Models\CropVariety;
use App\Models\PreOrder;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateQuotationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('quotations', function (Blueprint $table) {
            $table->id();
            $table->timestamps();

            $table->foreignIdFor(Administrator::class)->default(1);
            $table->foreignIdFor(CropVariety::class)->default(1);
            $table->foreignIdFor(PreOrder::class)->default(1);
            $table->bigInteger("quantity")->nullable();
            $table->date("supply_date")->nullable();
            $table->text("seed_class")->nullable();
            $table->text("invetory_status")->nullable();
            $table->text("detail")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('quotations');
    }
}
