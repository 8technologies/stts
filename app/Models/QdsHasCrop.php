<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QdsHasCrop extends Model
{ 
    use HasFactory; 

    public function form_qds()
    {
        return $this->belongsTo(FormQds::class, 'form_qds_id', 'id');
    }

    public function crops()
    { 
        return $this->belongsTo(Crop::class,'crop_id', 'id');
    }

    protected $fillable = [ 
        'form_qds_id',
        'crop_id',
    ];

}
