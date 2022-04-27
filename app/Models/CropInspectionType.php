<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CropInspectionType extends Model
{
    use HasFactory; 
    public function crop()
    {
        if(Crop::find((int)($this->crop_id)) == null){
            if(Crop::find(1) == null){
                $c = new Crop();
                $c->name = "Default crop";
                $c->id = 1;
                $c->save();
            }
            $this->crop_id = 1;
            $this->save();
        } 
        return $this->belongsTo(Crop::class, 'crop_id');
    }    

    protected $fillable = [
        'inspection_stage',
        'period_after_planting',
        'crop_id', 
    ];
}
