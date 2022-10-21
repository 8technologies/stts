<?php

namespace App\Models;

use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormStockExaminationRequest extends Model
{
    use HasFactory;
    public function user()
    {
        return $this->belongsTo(Administrator::class);
    }


    public function crop_variety()
    {
 
        $import_export_permit_id = ((int)($this->import_export_permit_id));
        $planting_return_id = ((int)($this->planting_return_id));
        $form_qds_id = ((int)($this->form_qds_id));


        if ($planting_return_id > 0) {
            $sr10 = FormSr10::find($planting_return_id);
            if ($sr10 != null) {
                $planting_return = SubGrower::find($sr10->planting_return_id);
                if ($planting_return != null) {
                    $crop_var = CropVariety::find($planting_return->crop);

                    if ($crop_var != null) {
                        return $crop_var;
                    }else{
                        Utils::create_default_tables();
                        $planting_return->crop = 1;
                        $planting_return->save();
                        $varity = CropVariety::find(1);
                        return $varity;
                    }
                }
            }
        }

        if ($import_export_permit_id > 0) {
            $permit = ImportExportPermitsHasCrops::find($import_export_permit_id);
            if ($permit != null) {
                $varity = CropVariety::find($permit->crop_variety_id);
                if ($varity != null) {
                    return $varity;
                }else{
                    Utils::create_default_tables();
                    $permit->crop_variety_id = 1;
                    $permit->save();
                    $varity = CropVariety::find(1);
                    return $varity;
                } 
            }
        }  
    }
    public function variety()
    {
        return $this->belongsTo(CropVariety::class, 'crop_variety_id');
    }


    use HasFactory;
    public static function boot()
    {
        parent::boot();

        self::creating(function ($model) {

        });

        self::created(function ($model) {
        });

        self::updating(function ($model) {
            
            // if (!Admin::user()->isRole('inspector')) {
            //     // change if inspector
            //     // if(strlen($model->lot_number)<2){
            //         $model->lot_number = rand(10000000,1000000000);
            //     // }
            // }
        });

        self::updated(function ($model) {
            if (Admin::user()->isRole('inspector')) {

                if ($model->status == 5) {
                    $stock = new StockRecord(); 
                    $stock->administrator_id = $model->administrator_id;
                    $stock->crop_variety_id = $model->crop_variety_id;
                    $stock->detail = 'From stock exanination ID: ' . $model->id;
                    $stock->is_deposit = 1;
                    $stock->lot_number = $model->lot_number;
                    $stock->quantity = $model->yield;
                    $stock->seed_class = $model->seed_class;
                    $stock->source = 'Stock examination';
                    $stock->save();
                }
            }

        });

        self::deleting(function ($model) {
            // ... code here
        });

        self::deleted(function ($model) {
            // ... code here
        });
    }
}
