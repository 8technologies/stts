<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdminMenuTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('admin_menu'))
            Schema::create('admin_menu', function (Blueprint $table) {
                $table->id();
                $table->integer('parent_id')->default(0);
                $table->integer('order')->default(0);
                $table->string('title')->nullable();
                $table->string('icon', 50)->default('None');
                $table->string('uri', 255)->nullable();
                $table->string('permission', 255)->nullable();
                $table->timestamps();
            });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admin_menu');
    }
}
