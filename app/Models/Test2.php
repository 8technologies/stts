<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Test2 extends Model
{
    use HasFactory;
    public function test1()
    {
        return $this->belongsTo(Test1::class, 'test1_id');
    }
    protected $fillable = [
        'name',
        'details',
        'test1_id'
    ];
}