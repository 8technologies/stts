<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormSr10 extends Model
{
    use HasFactory;

    // this is a recommended way to declare event handlers
    public static function boot()
    {
        parent::boot();
        static::deleting(function ($model) {
            dd("time to deleting");
        });
    }

    public function planting_return()
    {
        return $this->belongsTo(PlantingReturn::class);
    }

    public function form_sr10_has_variety_inspections()
    {
        return $this->hasMany(FormSr10HasVarietyInspection::class);
    }

    protected $fillable = [
        'administrator_id',
        'planting_return_id',
        'stage',
        'status',
        'status_comment',
        'submited_date',
        'min_date',
        'max_date',
        'is_active',
        'is_done',
    ];
}
