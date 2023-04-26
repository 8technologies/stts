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


    // public function crop_variety()
    // {
 
    //     $import_export_permit_id = ((int)($this->import_export_permit_id));
    //     $planting_return_id = ((int)($this->planting_return_id));
    //     $form_qds_id = ((int)($this->form_qds_id));


    //     if ($planting_return_id > 0) 
    //     {
    //         $sr10 = FormSr10::find($planting_return_id);
    //         if ($sr10 != null) {
    //             $planting_return = SubGrower::find($sr10->planting_return_id);
    //             if ($planting_return != null) {
    //                 $crop_var = CropVariety::find($planting_return->crop);

    //                 if ($crop_var != null) {
    //                     return $crop_var;
    //                 }else{
    //                     Utils::create_default_tables();
    //                     $planting_return->crop = 1;
    //                     $planting_return->save();
    //                     $varity = CropVariety::find(1);
    //                     return $varity;
    //             }
    //             }
    //         }
    //     }
  
    // }
    public function variety()
    {
        return $this->belongsTo(CropVariety::class, 'crop_variety_id');
    }

    public static function boot()
    {
        parent::boot();

        self::creating(function ($model) {

        });

        self::created(function ($model) {
           Utils::send_notification($model, 'FormStockExaminationRequest', request()->segment(count(request()->segments())));
        });

        self::updating(function ($model) {
          
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
            Utils::update_notification($model, 'FormStockExaminationRequest', request()->segment(count(request()->segments())-1));
  

        });

        self::deleting(function ($model) {
            // ... code here
        });

        self::deleted(function ($model) {
            // ... code here
        });
    }
}
