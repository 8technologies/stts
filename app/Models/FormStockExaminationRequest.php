<?php

namespace App\Models;

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormStockExaminationRequest extends Model
{
    use HasFactory;
    public function user(){
       return $this->belongsTo(Administrator::class);
    }

    public function variety()
    { 
        return $this->belongsTo(CropVariety::class,'crop_variety_id');
    }

}
