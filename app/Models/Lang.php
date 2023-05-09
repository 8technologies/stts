<?php

namespace App\Models;

use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lang extends Model
{
    use HasFactory;
    protected static function boot()
    {
        parent::boot();
        static::creating(function ($m) {
            $k = Lang::where('key', $m->key)->first();
            if ($k != null) {
                throw new Exception("Key already exist.", 1);
            }
            $m->key = strtolower($m->key);
            return $m;
        });
    }
}
