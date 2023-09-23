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



    // this is a recommended way to declare event handlers
    public static function boot()
    {
        parent::boot();
        static::deleting(function ($model) {
        });
        self::created(function ($model) {

           // Utils::send_notification($model, 'FormSr10', request()->segment(count(request()->segments())));
               
        });
        


        static::updated(function ($model) {
           // Utils::update_notification($model, 'FormSr10', request()->segment(count(request()->segments())-1));
            if (
                Admin::user()->isRole('inspector')
            ) {

                $all = FormSr10::where(['planting_return_id' => $model->planting_return_id])->get();
                $position = 0;
                $_position = 0;

                if(FormSr10::is_final_sr10($model))
                {

                    $sr10_number = rand(1000000,100000000)."";
                    if($model->status == 5)
                    {
                        if(strlen($model->sr10_number)<4)
                        {
                            DB::update(
                                'UPDATE form_sr10s 
                                        SET 
                                        sr10_number = :sr10_number, 
                                        is_final = :is_final 
                                        WHERE 
                                        id = :id
                                    ',
                                [
                                    'sr10_number' => $sr10_number,
                                    'is_final' => 1,
                                    'id' => $model->id, 
                                ]
                            );
                        }
                    }

                }

                if ($model->planting_return != null) 
                {

                    if ($model->planting_return->crop != null) 
                    {
                        $crop_var =  CropVariety::find($model->planting_return->crop);
                        if($crop_var == null)
                        {
                            $crop = Crop::find(1);
                        }else
                        {
                            $crop = $crop_var->crop;
                        }

                        if ($crop != null) {
                            if ($crop->crop_inspection_types != null) 
                            {
                                foreach ($crop->crop_inspection_types as $types) 
                                {
                                    $_position++;

                                    if ($model->stage == $types->inspection_stage) 
                                    {
                                        $position = ($_position - 1);
                                    }
                                }
                                if ($position == ($_position - 1)) 
                                {

                                    $now = new FormSr10();
                                    if (isset($all[$position])) 
                                    {
                                        $now = $all[$position];
                                    }

                                    if (isset($all[$position])) 
                                    {
                                        $now = $all[$position];
                                    }

                                    if ($now != null) {
                                        if ($now->id > 0) 
                                        {
                                            DB::update(
                                                'UPDATE form_sr10s 
                                                    SET 
                                                    is_done = :is_done,
                                                    is_active = :is_active 
                                                    WHERE 
                                                    id = :id
                                                ',
                                                [
                                                    'id' => $now->id,
                                                    'is_done' => true,
                                                    'is_active' => false,
                                                ]
                                            );
                                        }
                                    }
                                } else {
                                    if ($position < (count($crop->crop_inspection_types))) 
                                    {
                                        $prev = new FormSr10();
                                        $now = new FormSr10();
                                        $next = new FormSr10();

                                        if (isset($all[$position - 1])) {
                                            $prev = $all[$position - 1];
                                        }

                                        if (isset($all[$position])) {
                                            $now = $all[$position];
                                        }

                                        if (isset($all[$position + 1])) {
                                            $next = $all[$position + 1];
                                        }

                                        if ($now->id > 0) {

                                            DB::update(
                                                'UPDATE form_sr10s 
                                                        SET 
                                                        is_done = :is_done,
                                                        is_active = :is_active 
                                                        WHERE 
                                                        id = :id
                                                    ',
                                                [
                                                    'id' => $now->id,
                                                    'is_done' => true,
                                                    'is_active' => false,
                                                ]
                                            );
                                            if ($next->id > 0) {
                                                DB::update(
                                                    'UPDATE form_sr10s 
                                                        SET 
                                                        is_done = :is_done,
                                                        is_active = :is_active 
                                                        WHERE 
                                                        id = :id
                                                    ',
                                                    [
                                                        'id' => $next->id,
                                                        'is_done' => false,
                                                        'is_active' => true,
                                                    ]
                                                );
                                            }
                                        } else {

                                            return;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                elseif ($model->qds_declaration_id != null) 
                {

                    if ($model->crop_variety_id != null) 
                    {
                        $crop_var =  CropVariety::find($model->crop_variety_id);
                        if($crop_var == null)
                        {
                            $crop = Crop::find(1);
                        }else
                        {
                            $crop = $crop_var->crop;
                        }

                        if ($crop != null) {
                            if ($crop->crop_inspection_types != null) 
                            {
                                foreach ($crop->crop_inspection_types as $types) 
                                {
                                    $_position++;

                                    if ($model->stage == $types->inspection_stage) 
                                    {
                                        $position = ($_position - 1);
                                    }
                                }
                                if ($position == ($_position - 1)) 
                                {

                                    $now = new FormSr10();
                                    if (isset($all[$position])) 
                                    {
                                        $now = $all[$position];
                                    }

                                    if (isset($all[$position])) 
                                    {
                                        $now = $all[$position];
                                    }

                                    if ($now != null) {
                                        if ($now->id > 0) 
                                        {
                                            DB::update(
                                                'UPDATE form_sr10s 
                                                    SET 
                                                    is_done = :is_done,
                                                    is_active = :is_active 
                                                    WHERE 
                                                    id = :id
                                                ',
                                                [
                                                    'id' => $now->id,
                                                    'is_done' => true,
                                                    'is_active' => false,
                                                ]
                                            );
                                        }
                                    }
                                } else {
                                    if ($position < (count($crop->crop_inspection_types))) 
                                    {
                                        $prev = new FormSr10();
                                        $now = new FormSr10();
                                        $next = new FormSr10();

                                        if (isset($all[$position - 1])) {
                                            $prev = $all[$position - 1];
                                        }

                                        if (isset($all[$position])) {
                                            $now = $all[$position];
                                        }

                                        if (isset($all[$position + 1])) {
                                            $next = $all[$position + 1];
                                        }

                                        if ($now->id > 0) {

                                            DB::update(
                                                'UPDATE form_sr10s 
                                                        SET 
                                                        is_done = :is_done,
                                                        is_active = :is_active 
                                                        WHERE 
                                                        id = :id
                                                    ',
                                                [
                                                    'id' => $now->id,
                                                    'is_done' => true,
                                                    'is_active' => false,
                                                ]
                                            );
                                            if ($next->id > 0) {
                                                DB::update(
                                                    'UPDATE form_sr10s 
                                                        SET 
                                                        is_done = :is_done,
                                                        is_active = :is_active 
                                                        WHERE 
                                                        id = :id
                                                    ',
                                                    [
                                                        'id' => $next->id,
                                                        'is_done' => false,
                                                        'is_active' => true,
                                                    ]
                                                );
                                            }
                                        } else {

                                            return;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

              
            }
        });
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



    public static function is_final_sr10(FormSr10 $model)
    {
        if ($model == null) {
            return false;
        }

        $is_final = false;

        if($model->planting_return_id != null)
        {
            $crop_var = CropVariety::find($model->planting_return->crop);
            if($crop_var == null)
            {
                die("Crop varirty not found");
            }
            if($crop_var->crop == null)
            {
                die("Crop not found");
            }
            $crop = $crop_var->crop;
            $max = 0;
            $max_inspe = new CropInspectionType();
            if ($crop != null) 
            {
                if ($crop->crop_inspection_types != null) 
                {
                    foreach ($crop->crop_inspection_types as $key => $value) 
                    {
                        if ($value->id > $max) 
                        {
                            $max = $value->id;
                            $max_inspe = $value;
                        }
                    }
                }
            }

            if ($model->stage == $max_inspe->inspection_stage) 
            {
                $is_final = true;
            } else 
            {
                $is_final = false;
            }

            return $is_final;
        }

        if($model->qds_declaration_id != null)
        {
            $crop_var = CropVariety::find($model->crop_variety_id);
            if($crop_var == null)
            {
                die("Crop varirty not found");
            }
            if($crop_var->crop == null)
            {
                die("Crop not found");
            }
            $crop = $crop_var->crop;
            $max = 0;
            $max_inspe = new CropInspectionType();
            if ($crop != null) 
            {
                if ($crop->crop_inspection_types != null) 
                {
                    foreach ($crop->crop_inspection_types as $key => $value) 
                    {
                        if ($value->id > $max) 
                        {
                            $max = $value->id;
                            $max_inspe = $value;
                        }
                    }
                }
            }

            if ($model->stage == $max_inspe->inspection_stage) 
            {
                $is_final = true;
            } else 
            {
                $is_final = false;
            }

            return $is_final;
        }



    }
}
