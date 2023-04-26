<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormSr6HasCrop extends Model
{
    use HasFactory; 

    public function form_sr6()
    {
        return $this->belongsTo(FormSr6::class, 'form_sr6_id', 'id');
    }

    public function crops()
    { 
        return $this->belongsTo(Crop::class,'crop_id', 'id');
    }
    
    protected $fillable = [ 
        'form_sr6_id',
        'crop_id',
    ];

  
}
