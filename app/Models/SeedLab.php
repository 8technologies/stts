<?php

namespace App\Models;

use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Traits\AdminBuilder;
use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use phpDocumentor\Reflection\Types\This;

class SeedLab extends Model
{

    use ModelTree, AdminBuilder;

    protected $table = 'seed_labs';
    
    protected $appends = [
        'crop_variety_text'
    ];

    protected $fillable = [
        'administrator_id',
        'form_stock_examination_request_id',
        'collection_date',
        'payment_receipt',
        'applicant_remarks' 
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        //        $this->setParentColumn('mother_lot');
        //        $this->setOrderColumn('id');
        $this->setTitleColumn('mother_lot');
    }




    public function getCropVarietyTextAttribute()
    {
        return $this->crop_variety->name;
    }

    public function user()
    {
        return $this->belongsTo(Administrator::class, 'administrator_id');
    }


    public static function boot()
    {
        parent::boot();
        
        static::creating(function ($m) {
            $crop_variety_id = 1;
            $form = FormStockExaminationRequest::find($m->form_stock_examination_request_id);
            if ($form != null) {
                $crop_variety_id = $form->crop_variety_id;
            }
            $m->crop_variety_id = $crop_variety_id;
            return $m;
        });
    }

    public function crop_variety()
    {
        $c = CropVariety::find($this->crop_variety_id);
        if ($c == null) {
            $this->crop_variety_id = 1;
            $this->save();
        }
        return $this->belongsTo(CropVariety::class);
    }

    

    use HasFactory;
}
