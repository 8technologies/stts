<?php

use App\Models\FormSr10;
use App\Models\PlantingReturnCrop;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormSr10HasVarietyInspectionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('form_sr10_has_variety_inspections');
        Schema::create('form_sr10_has_variety_inspections', function (Blueprint $table) {
            $table->id();
            $table->timestamps();

            $table->foreignIdFor(FormSr10::class);

            $table->foreignIdFor(PlantingReturnCrop::class);

            $table->text("seed_class")->nullable();
            $table->text("size_of_field")->nullable();
            $table->text("off_types")->nullable();
            $table->text("diseases")->nullable();
            $table->text("noxious_weeds")->nullable();
            $table->text("other_features")->nullable();
            $table->text("other_weeds")->nullable();
            $table->text("isolation_distance")->nullable();
            $table->text("proposed_distance")->nullable();
            $table->text("general_conditions_of_crop")->nullable();
            $table->text("estimated_yield")->nullable();
            $table->text("futher_remarks")->nullable();
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
        Schema::dropIfExists('form_sr10_has_variety_inspections');
    }
}
