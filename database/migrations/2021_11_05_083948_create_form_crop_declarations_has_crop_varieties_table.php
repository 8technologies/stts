<?php

use App\Models\CropVariety;
use App\Models\FormCropDeclaration;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormCropDeclarationsHasCropVarietiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('form_crop_declarations_has_crop_varieties', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(FormCropDeclaration::class);
            $table->foreignIdFor(CropVariety::class);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('form_crop_declarations_has_crop_varieties');
    }
}
