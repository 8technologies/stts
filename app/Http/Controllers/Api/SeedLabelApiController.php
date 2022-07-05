<?php

namespace App\Http\Controllers\Api;

use App\Models\SeedLabel;
use Encore\Admin\Controllers\AdminController; 

    
class SeedLabelApiController extends AdminController
{
    public function seed_label_list()
    {
        /*  ---attributes---
        
        */
        return SeedLabel::all();  
    }   
}
