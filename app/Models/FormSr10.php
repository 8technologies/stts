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
            if($model->planting_return_id != null)
            {
                
                if ($model->status == '5' && $model->is_done == 0) 
                {
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
                if (($model->status == '17' || $model->status == '7') && $model->is_done == 0) 
                {
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
                            $sub_grower->status = '17';
                            $model->is_done = 1;
                            $model->is_active = 0;
                            $sub_grower->save();
                            $model->save();
                        }
                    }
                }

                if ($model->status == '4' && $model->is_done == 0) 
                {
                    $sub_grower = SubGrower::find($model->planting_return_id);
                    if ($sub_grower != null) {
                        $sub_grower->status = '4';
                        $model->is_done = 1;
                        $model->is_active = 0;
                        $sub_grower->save();
                        $model->save();
                    }
                }
            }
            else
            {
                if ($model->status == '5' && $model->is_done == 0) 
                {
                    $next = $model->getNextQds();
                    if ($next != null) {
                        $model->is_done = 1;
                        $model->is_active = 0;
                        $model->save();
                        $next->is_active = 1;
                        $next->save();
                    } else {
                        $qds_declaration = FormCropDeclaration::find($model->qds_declaration_id);
                        if ($qds_declaration != null) {
                            $qds_declaration->status = '5';
                            $model->is_done = 1;
                            $model->is_active = 0;
                            $model->is_final = 1;
                            //generate random number
                            $random = rand(100000, 999999);
                            $model->sr10_number = $random;
                            $qds_declaration->save();
                            $model->save();
                        }
                    }
                }
                if (($model->status == '17' || $model->status == '7') && $model->is_done == 0) 
                {
                    $next = $model->getNextQds();
                    if ($next != null) {
                        $model->is_done = 1;
                        $model->is_active = 0;
                        $model->save();
                        $next->is_active = 1;
                        $next->save();
                    } else {
                        $qds_declaration = FormCropDeclaration::find($model->qds_declaration_id);
                        if ($qds_declaration!= null) {
                            $qds_declaration->status = '17';
                            $model->is_done = 1;
                            $model->is_active = 0;
                            $qds_declaration->save();
                            $model->save();
                        }
                    }
                }

                if ($model->status == '4' && $model->is_done == 0) 
                {
                    $qds_declaration = FormCropDeclaration::find($model->qds_declaration_id);
                    if ($qds_declaration != null) {
                        $qds_declaration->status = '4';
                        $model->is_done = 1;
                        $model->is_active = 0;
                        $qds_declaration->save();
                        $model->save();
                    }
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

    public function getNextQds()
    {
        $otherInspections = FormSr10::where([
            ['qds_declaration_id', $this->qds_declaration_id],
            ['crop_variety_id', $this->crop_variety_id]
        ])
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

    // public function updateStatuses($subgrowerId) 
    // {
    //     $subgrower = Subgrower::find($subgrowerId);
    
    //     if (!$subgrower) {
    //         // Handle the case where the subgrower is not found
    //         return response()->json(['message' => 'Subgrower not found'], 404);
    //     }
    
    //     // Check if all SR10s belonging to the subgrower are active
    //     if ($subgrower->sr10s()->where('is_active', 0)->count() === 0) {
    //         // Update subgrower status to "done"
    //         $subgrower->status = 5;
    //         $subgrower->save();
    
    //         // Check if all subgrowers belonging to the same planting return are done
    //         $plantingReturn = $subgrower->plantingReturrn;
    
    //         if ($plantingReturn && $plantingReturn->subgrowers()->where('status', 5)->count() === 0) {
    //             // Update planting return status to "inspected"
    //             $plantingReturn->status = 5;
    //             $plantingReturn->save();
    //         }
    //     }
    
    //     // Handle the response accordingly
    //     return response()->json(['message' => 'Status updated successfully']);
    // }

    protected $fillable = [
        'administrator_id',
        'planting_return_id',
        'qds_declaration_id',
        'stage',
        'status',
        'status_comment',
        'order_number',
        'submited_date',
        'min_date',
        'max_date',
        'is_active',
        'is_done',
        'is_initialized',
        'inspector',
        'crop_variety_id',
        'sr10_number',
        'is_final',
        'planting_return_crop_name',
        'seed_class',
        'size_of_field',
        'off_types',
        'diseases',
        'noxiuos_weeds',
        'other_features',
        'other_weeds',
        'female_shedding',
        'female_receptive',
        'female_off_types',
        'male_off_types',
        'isolation_distance',
        'variety',
        'proposed_distance',
        'general_conditions_of_crop',
        'estimated_yield',
        'further_remarks',


    ];

    public function crop_variety()
    {
        return $this->belongsTo(CropVariety::class);
    }

}