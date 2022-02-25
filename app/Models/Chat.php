<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Chat extends Model
{
    use HasFactory;
    protected $fillable = [
        'thread',
        'sender',
        'receiver',
        'product_id',
        'seen',
        'received',
        'body'
    ];

    public function _sender()
    {
        return $this->belongsTo(User::class,"sender");
    }   

    public function product()
    {
        return $this->belongsTo(Product::class);
    }   
}
