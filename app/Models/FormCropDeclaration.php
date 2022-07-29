<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormCropDeclaration extends Model
{
    use HasFactory;

    protected $fillable = [
        'administrator_id',
        'field_size',
        'source_of_seed',
        'seed_rate',
        'amount',
        'status',
        'payment_receipt',
        'form_qd_id',
    ];

    public static function boot()
    {
        parent::boot(); 

        self::creating(function($model){
            
        });
 
        self::updating(function($model){
        });
 
    }

    
    public function form_crop_declarations_has_crop_varieties()
    {
        return $this->hasMany(FormCropDeclarationsHasCropVariety::class);
    }
}
