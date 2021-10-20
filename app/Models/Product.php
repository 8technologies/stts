<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\URL;
use Psy\CodeCleaner\ValidConstructorPass;

class Product extends Model
{
    use HasFactory; 

    public function user()
    {
        return $this->belongsTo(User::class);
    }


    public function category()
    {
        return $this->belongsTo(category::class, "category_id");
    }

    public function country()
    {
        return $this->belongsTo(Country::class);
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function reviews()
    {
        return $this->hasMany(ProductReview::class);
    }


    public function sub_category()
    {
        return $this->belongsTo(category::class, "sub_category_id");
    }

    public function get_name_short($min_length = 50){
        if(strlen($this->name)>$min_length){
            return substr($this->name,0,$min_length)."...";
        }
        return $this->name;
    }
    public function get_thumbnail()
    {
        $thumbnail = "";
        if ($this->thumbnail != null) {
            if (strlen($this->thumbnail) > 3) {
                $thumb = json_decode($this->thumbnail);
                if (isset($thumb->thumbnail)) {

                    $thumb->thumbnail = str_replace("public/", "", $thumb->thumbnail);
                    $thumb->thumbnail = str_replace("storage/", "", $thumb->thumbnail);
                    $thumb->thumbnail = str_replace("/storage", "", $thumb->thumbnail);
                    $thumb->thumbnail = str_replace("/", "", $thumb->thumbnail);
                    $thumbnail = URL::asset('storage/'.$thumb->thumbnail);                    
                }
            }
        } 
        return $thumbnail;
    }

    public function get_images()
    {
        $images = [];
        if ($this->images != null) {
            if (strlen($this->images) > 3) {
                $images_json = json_decode($this->images);
                foreach ($images_json as $key => $img) {
                    $img->src = URL::asset('storage/'.str_replace("public/", "", $img->src));
                    $img->thumbnail = URL::asset('storage/'.str_replace("public/", "", $img->thumbnail));
                    $images[] = $img;
                }
            }
        }  
        return $images;
    }

    protected $fillable = [
        'name',
        'user_id',
        'category_id',
        'sub_category_id',
        'price',
        'description',
        'city_id',
        'country_id',
        'slug',
        'thumbnail',
        'status',
        'attributes',
        'images',
    ];
}
