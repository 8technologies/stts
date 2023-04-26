<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CropVariety extends Model
{
    use HasFactory;

    public function crop()
    {
        if (Crop::find((int)($this->crop_id)) == null) {
            if (Crop::find(1) == null) {
                $c = new Crop();
                $c->name = "Default crop";
                $c->id = 1;
                $c->save();
            }
            $this->crop_id = 1;
            $this->save();
        }
        return $this->belongsTo(Crop::class, 'crop_id', 'id');
    }

    public function form_crop_declaration()
    {
        return $this->belongsToMany(FormCropDeclaration::class, 'form_crop_declarations_has_crop_varieties');
    }

    public function getNameAttribute($name)
    {
        return $this->crop->name . ", " . $name . ".";
    }

    public function seed_label_packages()
    {

        return $this->hasMany(SeedLabelPackage::class);
    }

    protected $fillable = [
        'name',
    ];
}
