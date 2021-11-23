<?php

namespace App\Models;

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    public function owner (){
        return $this->belongsTo(Administrator::class,'administrator_id');
    }
    use HasFactory;
}
