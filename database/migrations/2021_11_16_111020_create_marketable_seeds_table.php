<?php

use App\Models\CropVariety;
use App\Models\SeedLabel;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMarketableSeedsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
 
        Schema::create('marketable_seeds', function (Blueprint $table) {
            $table->id();
            $table->timestamps();

            $table->foreignIdFor(Administrator::class)->default(1);
            $table->foreignIdFor(CropVariety::class)->default(1);
            $table->foreignIdFor(SeedLabel::class)->default(1);
            $table->bigInteger("lab_test_number")->nullable()->default(0);
            $table->bigInteger("lot_number")->nullable()->default(0);
            $table->bigInteger("quantity")->nullable()->default(0);
            $table->integer("seed_class")->nullable();
            $table->text("source")->nullable();
            $table->text("detail")->nullable(); 
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
        Schema::dropIfExists('marketable_seeds');
    }
}
