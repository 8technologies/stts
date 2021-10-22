<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Encore\Admin\Auth\Database\Administrator;

class CreateFormSr4sTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('form_sr4s', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class);
            $table->string('name_of_applicant')->nullable();
            $table->string('address')->nullable();
            $table->string('company_initials')->nullable();
            $table->text('premises_location')->nullable();
            $table->string('years_of_expirience')->nullable();
            $table->text('expirience_in')->nullable();
            $table->string('dealers_in')->nullable();
            $table->string('processing_of')->nullable();
            $table->string('marketing_of')->nullable();
            $table->tinyInteger('have_adequate_land')->nullable();
            $table->integer('land_size')->nullable();
            $table->text('eqipment')->nullable();
            $table->tinyInteger('have_adequate_equipment')->nullable();
            $table->tinyInteger('have_contractual_agreement')->nullable();
            $table->tinyInteger('have_adequate_field_officers')->nullable();
            $table->tinyInteger('have_conversant_seed_matters')->nullable();
            $table->string('souce_of_seed')->nullable();
            $table->tinyInteger('have_adequate_land_for_production')->nullable();
            $table->tinyInteger('have_internal_quality_program')->nullable();
            $table->text('receipt')->nullable();
            $table->tinyInteger('accept_declaration')->nullable();
            $table->timestamp('valid_from')->nullable();
            $table->timestamp('valid_until')->nullable();
            $table->string('status')->nullable();
            $table->integer('inspector')->nullable();
            $table->text('status_comment')->nullable();
            $table->text('dealers_in_other')->nullable();
            $table->text('processing_of_other')->nullable();
            $table->text('marketing_of_other')->nullable();
            $table->text('souce_of_seed_other')->nullable();
            
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('form_sr4s');
    }
}
