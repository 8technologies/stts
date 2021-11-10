<?php

namespace App\Models;

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SeedLab extends Model
{
    public function user()
    {
        return $this->belongsTo(Administrator::class, 'administrator_id');
    }

    public function crop_variety()
    {
        return $this->belongsTo(CropVariety::class);
    }
    use HasFactory;
}
