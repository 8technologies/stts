<?php

use App\Models\Crop;
use App\Models\ImportExportPermit;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateImportExportPermitsHasCropsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('import_export_permits_has_crops', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(ImportExportPermit::class);
            $table->foreignIdFor(Crop::class);
            $table->text('measure');
            $table->integer('weight');
            $table->text('category');
            $table->text('varieties');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('import_export_permits_has_crops');
    }
}
