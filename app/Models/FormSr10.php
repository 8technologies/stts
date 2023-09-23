<?php

namespace App\Models;

use COM;
use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class FormSr10 extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();
        static::deleting(function ($model) {
        });
        self::created(function ($model) {
               
        });
        

        static::updated(function ($model){
            if (($model->status == '5' || $model->status == '17') && $model->is_done == 0) {
                $next = $model->getNext();
                if ($next != null) {
                    $model->is_done = 1;
                    $model->is_active = 0;
                    $model->save();
                    $next->is_active = 1;
                    $next->save();
                } else {
                    $sub_grower = SubGrower::find($model->planting_return_id);
                    if ($sub_grower != null) {
                        $sub_grower->status = '5';
                        $model->is_done = 1;
                        $model->is_active = 0;
                        $sub_grower->save();
                        $model->save();
                    }
                }
            }
            if ($model->status == '4' && $model->is_done == 0) {
                $sub_grower = SubGrower::find($model->planting_return_id);
                if ($sub_grower != null) {
                    $sub_grower->status = '4';
                    $model->is_done = 1;
                    $model->is_active = 0;
                    $sub_grower->save();
                    $model->save();
                }
            }

        });
    }

    public function getNext()
    {
        $otherInspections = FormSr10::where('planting_return_id', $this->planting_return_id)
            ->orderBy('order_number', 'asc')
            ->get();

        $nextInspection = null;
        foreach ($otherInspections as $key => $inspection) {
            if ($inspection->order_number > $this->order_number) {
                $nextInspection = $inspection;
                break;
            }
        }
        return $nextInspection;
    }

    public function planting_return()
    {
        return $this->belongsTo(SubGrower::class);
    }

    public function form_sr10_has_variety_inspections()
    {
        return $this->hasMany(FormSr10HasVarietyInspection::class);
    }

    protected $fillable = [
        'administrator_id',
        'planting_return_id',
        'qds_declaration_id',
        'stage',
        'status',
        'status_comment',
        'submited_date',
        'min_date',
        'max_date',
        'is_active',
        'is_done',
        'is_initialized',
        'inspector',
        'crop_variety_id',
    ];

}