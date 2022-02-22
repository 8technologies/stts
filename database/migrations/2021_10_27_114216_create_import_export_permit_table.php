<?php

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateImportExportPermitTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('import_export_permit', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class);
            $table->text("name")->nullable();
            $table->text("address")->nullable();
            $table->text("telephone")->nullable();
            $table->text("national_seed_board_reg_num")->nullable();
            $table->text("store_location")->nullable();
            $table->text("quantiry_of_seed")->nullable();
            $table->text("name_address_of_origin")->nullable();
            $table->text("details")->nullable();
            $table->text("ista_certificate")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('import_export_permit');
    }
}
