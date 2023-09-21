<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attachment extends Model
{
    use HasFactory;

    protected $fillable = [
        'form_sr4_id',
        'form_sr6_id',
        'file_path',
        
    ];

    public function form_sr6()
    {
        return $this->belongsTo(FormSr6::class);
    }


}
