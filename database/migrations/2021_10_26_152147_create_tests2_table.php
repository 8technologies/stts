<?php

use App\Models\Test1;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTests2Table extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('test2s', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Test1::class);
            $table->string("name")->nullable();
            $table->string("details")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('test2s');
    }
}
