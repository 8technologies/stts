<?php

use App\Models\CropVariety;
use App\Models\SeedLabel;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSeedLabelPackagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('seed_label_packages', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(CropVariety::class)->default(1);
            $table->integer("package_size")->nullable()->default(0);
            $table->integer("package_price")->nullable()->default(0);
            $table->foreignIdFor(Administrator::class)->default(1);
            $table->foreignIdFor('mother_lot_number')->default(1);
            $table->foreignIdFor('lot_number')->default(1);
            $table->foreignIdFor('lab_test_number')->default(1);
            $table->bigInteger("quantity")->nullable();
            $table->bigInteger("unit_price")->nullable();
            $table->integer("seed_class")->nullable();
            $table->text("source")->nullable();
            $table->text("detail")->nullable();
            $table->tinyInteger("is_deposit")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('seed_label_packages');
    }
}
