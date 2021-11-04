<?php

use App\Models\Crop;
use App\Models\PlantingReturn;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormCropDeclarationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('form_crop_declarations', function (Blueprint $table) {
            $table->id();
            $table->timestamps();

            $table->foreignIdFor(Administrator::class);

            $table->foreignIdFor(PlantingReturn::class);

            $table->foreignIdFor(Crop::class);

            $table->text("source_of_seed")->nullable();
            $table->text("field_size")->nullable();
            $table->text("seed_rate")->nullable();
            $table->text("amount")->nullable();
            $table->text("payment_receipt")->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('form_crop_declarations');
    }
}
