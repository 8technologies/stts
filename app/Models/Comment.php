<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;
    protected $fillable = [
        'comment',
        'status'
    ];

    public function commentable()
    {
        return $this->morphTo();
    }
    //boot
    protected static function boot()
    {
        parent::boot();
        static::creating(function ($comment) {
            
        });
    }

}
