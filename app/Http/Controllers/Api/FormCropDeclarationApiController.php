<?php

namespace App\Http\Controllers\Api;

use App\Models\FormCropDeclaration;
use Encore\Admin\Controllers\AdminController; 

    
class FormCropDeclarationApiController extends AdminController
{
    public function form_crop_declarations_list()
    {
        /*  ---attributes---
        
        */
        return FormCropDeclaration::all();  
    }   
}
