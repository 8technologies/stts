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
            if (($model->status == '5' || $model->status == '17') && $model->is_done == 0) 
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

           
            //call the update status function
            //$model->updateStatuses($model->planting_return_id);
            

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

    public function updateStatuses($subgrowerId) {
        $subgrower = Subgrower::find($subgrowerId);
    
        if (!$subgrower) {
            // Handle the case where the subgrower is not found
            return response()->json(['message' => 'Subgrower not found'], 404);
        }
    
        // Check if all SR10s belonging to the subgrower are active
        if ($subgrower->sr10s()->where('is_active', 0)->count() === 0) {
            // Update subgrower status to "done"
            $subgrower->status = 5;
            $subgrower->save();
    
            // Check if all subgrowers belonging to the same planting return are done
            $plantingReturn = $subgrower->plantingReturrn;
    
            if ($plantingReturn && $plantingReturn->subgrowers()->where('status', 5)->count() === 0) {
                // Update planting return status to "inspected"
                $plantingReturn->status = 5;
                $plantingReturn->save();
            }
        }
    
        // Handle the response accordingly
        return response()->json(['message' => 'Status updated successfully']);
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