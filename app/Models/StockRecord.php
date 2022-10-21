<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Facades\Admin;


class StockRecord extends Model
{
    use HasFactory;

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


    public static function boot()
    {
        parent::boot();

        self::creating(function ($model) {

        });

        self::created(function ($model) {
        });

        self::updating(function ($model) {
        });


        self::updated(function ($model) {
            // if (Admin::user()->isRole('lab-technician')) {

            //     if ($model->type == 0) {
            //         $stock_out = new MarketableSeed();
            //         $stock_out->administrator_id = $model->administrator_id;
            //         $stock_out->crop_variety_id = $model->crop_variety_id;
            //         $stock_out->seed_label_id = $model->seed_label_id;
            //         $stock_out->lot_number = $model->lot_number;
            //         $stock_out->quantity = (-1) * ($model->quantity);
            //         $stock_out->seed_class = $model->seed_class;
            //         $stock_out->source = $model->source;
            //         $stock_out->detail = $model->detail;
            //         $stock_out->is_deposit = 0;
            //         $stock_out->seed_label_package_id = $model->seed_label_package_id;
            //         $stock_out->lab_test_number = $model->lab_test_number;
            //         $stock_out->save();
            //     }
            // }
        });


        
        self::creating(function ($model) {
            // ... code here
        });


        
        self::deleting(function ($model) {
            // ... code here
        });

        self::deleted(function ($model) {
            // ... code here
        });

    }
}
