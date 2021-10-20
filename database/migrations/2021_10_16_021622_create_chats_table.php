<?php

use App\Models\Product;
use App\Models\User;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChatsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('chats', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->text('body')->nullable();
            $table->foreignIdFor(User::class,"sender");
            $table->foreignIdFor(User::class,"receiver");
            $table->foreignIdFor(Product::class);
            $table->text('thread')->nullable();
            $table->tinyInteger('received')->nullable();
            $table->tinyInteger('seen')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('chat');
    }
}
