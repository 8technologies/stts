<?php

namespace App\Models;

use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Traits\AdminBuilder;
use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SeedLab extends Model
{
    public function user()
    {
        return $this->belongsTo(Administrator::class, 'administrator_id');
    }


    use ModelTree, AdminBuilder;

    protected $table = 'seed_labs';

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

//        $this->setParentColumn('mother_lot');
//        $this->setOrderColumn('id');
        $this->setTitleColumn('mother_lot');
    }

 

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
        }
        return $c;
    }
    
    use HasFactory;
}
