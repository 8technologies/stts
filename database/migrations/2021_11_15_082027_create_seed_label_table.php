<?php

use App\Models\CropVariety;
use App\Models\SeedLab;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSeedLabelTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('seed_label', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class)->default(1);
            $table->foreignIdFor(SeedLab::class)->default(1);
            $table->foreignIdFor(CropVariety::class)->default(1);
            $table->text("quantity")->nullable();
            $table->text("package_quantity")->nullable();
            $table->text("applicant_remarks")->nullable();            
 
            $table->integer("status")->nullable()->default(1);
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
        Schema::dropIfExists('seed_label');
    }
}
