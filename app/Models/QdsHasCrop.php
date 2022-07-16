<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QdsHasCrop extends Model
{ 
    use HasFactory;

    protected $fillable = [ 
        'form_qds_id',
        'crop_id',
    ];

}
