<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Attachments extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // 
        Schema::create('attachments', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('form_sr4_id')->nullable();
            $table->unsignedBigInteger('form_sr6_id')->nullable();
            $table->string('file_path');
            $table->timestamps();

            $table->foreign('form_sr4_id')->references('id')->on('form_sr4s')->onDelete('cascade');
            $table->foreign('form_sr6_id')->references('id')->on('form_sr6s')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        
        // 
        Schema::dropIfExists('attachments');
    }
}
