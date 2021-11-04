<?php

use App\Models\CropVariety;
use App\Models\PlantingReturn;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlantingReturnCropsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('planting_return_crops');
        Schema::create('planting_return_crops', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(PlantingReturn::class)
                ->constrained()
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreignIdFor(CropVariety::class)
                ->constrained()
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->text("lot_number")->nullable();
            $table->text("size_of_land")->nullable();
            $table->text("date_planted")->nullable();
            $table->text("date_harvest")->nullable();
            $table->text("previous_crops")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('planting_return_crops');
    }
}
