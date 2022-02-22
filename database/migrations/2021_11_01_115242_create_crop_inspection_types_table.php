<?php

use App\Models\Crop;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCropInspectionTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('crop_inspection_types');
        Schema::create('crop_inspection_types', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Crop::class)
                ->constrained()
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->text("inspection_stage")->nullable();
            $table->text("period_after_planting")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('crop_inspection_types');
    }
}
