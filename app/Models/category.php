<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class category extends Model
{

    public function attributes()
    {
        return $this->hasMany(Attribute::class);
    }   

    public function sub_categories()
    {
        return $this->hasMany(category::class,"parent");
    }   

    public function products()
    {
        return $this->hasMany(Product::class,"category_id");
    }   

    use HasFactory; 

    public static function boot()
    {
        parent::boot(); 
        self::creating(function($model){
            $model->slug =  Str::slug($model->name, '-');
        });
 
        self::updating(function($model){
            $model->slug =  Str::slug($model->name, '-');
        });
 
    }
  
}
