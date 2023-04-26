<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMyNotificationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('my_notifications', function (Blueprint $table) {
            $table->id();
            $table->timestamps();

            $table->bigInteger('receiver_id')->nullable(); 
            $table->bigInteger('role_id')->nullable(); 
            $table->text('message')->nullable();
            $table->text('form_link')->nullable();
            $table->text('link')->nullable();
            $table->string('status')->nullable(); 
            $table->string('model')->nullable(); 
            $table->string('model_id')->nullable(); 
            $table->string('action_status_to_make_done')->nullable(); 

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('my_notifications');
    }
}
