<?php

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormSr6sTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('form_sr6s', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class);
            $table->string('name_of_applicant')->nullable();
            $table->string('address')->nullable();
            $table->string('company_initials')->nullable();
            $table->text('premises_location')->nullable();
            $table->string('years_of_experience')->nullable();
            $table->text('dealers_in')->nullable();
            $table->string('previous_grower_number')->nullable();
            $table->text('cropping_histroy')->nullable();
            $table->tinyInteger('have_adequate_isolation')->nullable();
            $table->tinyInteger('have_adequate_labor')->nullable();
            $table->tinyInteger('aware_of_minimum_standards')->nullable();
            $table->text('signature_of_applicant')->nullable();
            $table->string('grower_number')->nullable();
            $table->string('registration_number')->nullable();
            $table->timestamp('valid_from')->nullable();
            $table->timestamp('valid_until')->nullable();
            $table->string('status')->nullable();
            $table->integer('inspector')->nullable();
            $table->text('status_comment')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('form_sr6s');
    }
}
