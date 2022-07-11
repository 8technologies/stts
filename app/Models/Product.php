<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Auth\Authenticatable;
use Illuminate\Notifications\Notifiable;


class Product extends Model
{
    use Authenticatable, DefaultDatetimeFormat, HasFactory, Notifiable;
    
    // protected $fillable = [
    //     'crop_variety_id', 
    //     'seed_label_id', 
    //     'quantity', 
    //     'lab_test_number', 
    //     'lot_number', 
    //     'seed_class', 
    //     'price', 
    //     'wholesale_price', 
    //     'image',
    //     'images',
    //     'source',
    //     'detail',
    //     'name',
    //     'total_price',
    // ];
} 
