<?php

use App\Models\User;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProfilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('profiles');
        if (!Schema::hasTable('profiles'))
            Schema::create('profiles', function (Blueprint $table) {
                $table->id();
                $table->timestamps();
                $table->foreignIdFor(User::class);
                $table->string('first_name')->nullable();
                $table->string('last_name')->nullable();
                $table->string('company_name')->nullable();
                $table->string('email')->nullable();
                $table->string('phone_number')->nullable();
                $table->string('location')->nullable();
                $table->text('about')->nullable();
                $table->string('services')->nullable();
                $table->string('longitude')->nullable();
                $table->string('latitude')->nullable();
                $table->string('division')->nullable();
                $table->string('opening_hours')->nullable();
                $table->string('profile_photo')->nullable();
                $table->string('cover_photo')->nullable();
                $table->string('facebook')->nullable();
                $table->string('twitter')->nullable();
                $table->string('whatsapp')->nullable();
                $table->string('youtube')->nullable();
                $table->string('linkedin')->nullable();
                $table->string('instagram')->nullable();
                $table->string('last_seen')->nullable();
                $table->text('username')->nullable();
                $table->string('status')->nullable();
            });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('profiles');
    }
}
