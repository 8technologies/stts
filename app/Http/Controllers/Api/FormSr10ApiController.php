<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController; 
use App\Models\FormSr10;


class FormSr10ApiController extends AdminController
{
    public function form_sr10_list()
    {
        /*  ---attributes---
        
        */
        return FormSr10::all();  
    }   
}