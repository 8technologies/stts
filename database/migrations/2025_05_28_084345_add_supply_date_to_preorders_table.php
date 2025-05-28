<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddSupplyDateToPreordersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('pre_orders', function (Blueprint $table) {
            $table->date("supply_date")->nullable();
            $table->text("decline_reason")->nullable();
            $table->string("price")->nullable(); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('pre_orders', function (Blueprint $table) {
            $table->dropColumn('supply_date');
            $table->dropColumn('price');
            $table->dropColumn('decline_reason');
        });
    }
}
