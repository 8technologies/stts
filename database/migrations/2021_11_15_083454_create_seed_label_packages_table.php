<?php

use App\Models\CropVariety;
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
