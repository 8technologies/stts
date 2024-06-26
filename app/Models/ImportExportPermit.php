<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Auth;
use Encore\Admin\Auth\Database\Administrator;
use App\Mail\Notification;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\File;

class ImportExportPermit extends Model
{
    use HasFactory;

    protected $fillable = [
        'administrator_id',
        'type',
        'name', 
        'address',
        'telephone',
        'store_location',
        'quantiry_of_seed',
        'name_address_of_origin',
        'supplier_name',
        'supplier_address',
        'ista_certificate', 
        'inspector_id',
        'national_seed_board_reg_num',
        'is_import',
        'permit_number',
        'status',
        'status_comment',
        'valid_from',
        'valid_until',
        'additional_conditions',
    ];
     
    public function import_export_permits_has_crops()
    {
        return $this->hasMany(ImportExportPermitsHasCrops::class);
    }

    public static function boot()
    {
        parent::boot(); 
        self::creating(function($model)
        {
            $lastPermitNumber = Config::get('permit.last_permit_number') + 1;
            Config::set('permit.last_permit_number', $lastPermitNumber);
            File::put(config_path('permit.php'), '<?php return ["last_permit_number" => ' . $lastPermitNumber . '];');
        });
 
        self::updating(function($model)
        {
           
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
          
            

        }); 

        self::created(function ($model) {
            //accessing the last parameter of the url
            MyNotification::send_notification($model, 'ImportExportPermit', request()->segment(count(request()->segments())));
           
  
        });

        self::updated(function ($m) {
            MyNotification::update_notification($m, 'ImportExportPermit', request()->segment(count(request()->segments())-1));

        });

        self::deleting(function ($model) 
        {
            // ... code here
        });

        self::deleted(function ($model) 
        {
            // ... code here
        });
    } 
  

}
