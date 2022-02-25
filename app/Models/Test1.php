<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Test1 extends Model
{
    use HasFactory;
    public function test2s()
    {
        return $this->hasMany(Test2::class, 'test1_id');
    }
}
