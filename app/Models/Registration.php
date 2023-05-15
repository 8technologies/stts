<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Registration extends Model
{
    use HasFactory;

    protected $table = 'admin_users';

   protected $fillable = [
        'username',
        'password',
        'name',
        'email',
    ];
}
