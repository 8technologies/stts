<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Auth;

class ImportExportPermit extends Model
{
    use HasFactory;

    protected $fillable = [
        'administrator_id',
        'name', 
        'address',
        'telephone',
        'type',
        'store_location',
        'quantiry_of_seed',
        'name_address_of_origin',
        'ista_certificate', 
        'phytosanitary_certificate',
        'import_form_certificate_type',
        'crop_category',
        'national_seed_board_reg_num',
        'is_import',
    ];

    public function import_export_permits_has_crops()
    {
        return $this->hasMany(ImportExportPermitsHasCrops::class);
    }

    public static function boot()
    {
        parent::boot(); 
        self::creating(function($model){
            // ... code here
        });
 
        self::updating(function($model){
            if(
                Admin::user()->isRole('basic-user')
            ){
                $model->status = 1;
                return $model;
            }
            if(Admin::user()->isRole('inspector')){
                if($model->status == 5){    
                    if(
                        $model->valid_from == null ||
                        strlen($model->valid_from) < 4 ||
                        strlen($model->valid_until) < 4 
                    ){
                        $model->valid_from =  Carbon::now();
                        $model->valid_until =  Carbon::now()->addYear();   
                        return $model;   
                    }
                }
            }

        }); 

        self::created(function ($model) {
            // ... code here
        });

        self::updated(function ($model) {
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
