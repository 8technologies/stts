<?php

use App\Models\FormQds;
use App\Models\ImportExportPermit;
use App\Models\PlantingReturn;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormStockExaminationRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('form_stock_examination_requests', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(ImportExportPermit::class);
            $table->foreignIdFor(PlantingReturn::class);
            $table->foreignIdFor(FormQds::class);
            $table->text("field_size")->nullable();
            $table->text("yield")->nullable();
            $table->text("date")->nullable();
            $table->text("purity")->nullable();
            $table->text("germination")->nullable();
            $table->text("moisture_content")->nullable();
            $table->text("insect_damage")->nullable();
            $table->text("moldiness")->nullable();
            $table->text("noxious_weeds")->nullable();
            $table->text("recommendation")->nullable();
            $table->integer("state")->nullable();
            $table->bigInteger("inspector")->nullable();
            $table->text("status_comment")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('form_stock_examination_requests');
    }
}
