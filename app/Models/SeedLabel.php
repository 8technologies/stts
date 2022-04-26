<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SeedLabel extends Model
{
    use HasFactory; 
    public function seed_lab()
    {
        return $this->belongsTo(SeedLab::class);
    }

    public function crop_variety()
    {

        $cops =  Crop::all();
        $c = null;
        foreach ($cops as $key => $value) {
            if ($value->id == $this->crop_variety_id) {
                $c = $value;
                break;
            }
        }
        if ($c == null) {
            $c = $cops[0];
            $m = $this;
            $m->crop_variety_id = $c->id;
            $m->save();
        }
        return $c;
    }

    public function seed_label_package()
    {
        return $this->belongsTo(SeedLabelPackage::class);
    }
}
