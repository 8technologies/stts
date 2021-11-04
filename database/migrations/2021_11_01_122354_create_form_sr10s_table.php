<?php

use App\Models\Crop;
use App\Models\PlantingReturn;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormSr10sTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('form_sr10s');
        Schema::create('form_sr10s', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(PlantingReturn::class)
            ->constrained()
            ->onUpdate('cascade')
            ->onDelete('cascade');

            $table->text("stage")->nullable();
            $table->text("status")->nullable();
            $table->text("status_comment")->nullable();
            $table->text("submited_date")->nullable();
            $table->text("min_date")->nullable();
            $table->text("max_date")->nullable();
            
        });
    }

    /**
     * Reverse the migrations. 
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('form_sr10s');
    }
}
