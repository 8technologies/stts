<?php

use App\Models\CropVariety;
use App\Models\FormStockExaminationRequest;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSeedLabsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('seed_labs', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class)->nullable();
            $table->foreignIdFor(CropVariety::class)->nullable();
            $table->foreignIdFor(FormStockExaminationRequest::class)->nullable();
            $table->date("collection_date")->nullable();
            $table->text("payment_receipt")->nullable();
            $table->text("applicant_remarks")->nullable();
            $table->text("sampling_date")->nullable();
            $table->text("sample_weight")->nullable();
            $table->text("packaging")->nullable();
            $table->text("number_of_units")->nullable();
            $table->text("mother_lot")->nullable();
            $table->text("sample_condition")->nullable();
            $table->text("inspector_remarks")->nullable();
            $table->text("tests_required")->nullable();
            $table->bigInteger("lab_technician_id")->nullable();
            $table->bigInteger("quantity")->nullable()->default(0);

            $table->text("purity")->nullable();
            $table->text("germination_capacity")->nullable();
            $table->text("abnormal_sprouts")->nullable();
            $table->text("broken_germs")->nullable();
            $table->text("report_recommendation")->nullable();

            $table->bigInteger("inspector")->nullable();
            $table->tinyInteger("inspector_is_done")->nullable()->default(0);
            $table->integer("status")->nullable()->default(1);
            $table->text("status_comment")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('seed_labs');
    }
}
