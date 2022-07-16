<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FormSr6HasCrop extends Model
{
    protected $table = 'form_sr6_has_crops'; 
    
    protected $fillable = [ 
        'form_sr6_id',
        'crop_id',
    ];
}
