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


    public function crop()
    {
        $crop = new Crop();

        $import_export_permit_id = ((int)($this->import_export_permit_id));
        $planting_return_id = ((int)($this->planting_return_id));
        $form_qds_id = ((int)($this->form_qds_id));



        if ($planting_return_id > 0) {
            $sr10 = FormSr10::find($planting_return_id);
            if ($sr10 != null) {
                $planting_return = SubGrower::find($sr10->planting_return_id);
                if ($planting_return != null) {
                    $crop = Crop::find($planting_return->crop);
                    if ($crop != null) {
                        return $crop;
                    }
                }
            }
        }

        if ($import_export_permit_id > 0) {
            $permit = ImportExportPermitsHasCrops::find($import_export_permit_id);
            if ($permit != null) {
                $varity = CropVariety::find($permit->crop_variety_id);
                if ($varity->crop != null) {
                    return $varity->crop;
                }
            }
        }

        return $crop;
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
 
            // ... code here
        });

        self::updated(function ($model) {
            if (Admin::user()->isRole('inspector')) {

                if ($model->status == 5) {
                    $stock = new StockRecord(); 
                    $stock->administrator_id = $model->administrator_id;
                    $stock->crop_variety_id = $model->crop_variety_id;
                    $stock->detail = 'From stock exanination ID: ' . $model->id;
                    $stock->is_deposit = 1;
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
