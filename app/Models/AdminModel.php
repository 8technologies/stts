<?php

namespace App\Models;

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class AdminModel extends Administrator
{
    public function notifications(){
        return $this->hasMany(MyNotification::class);
    }

}
