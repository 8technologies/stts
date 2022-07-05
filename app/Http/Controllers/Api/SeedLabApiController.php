<?php

namespace App\Http\Controllers\Api;

use App\Models\SeedLab;
use Encore\Admin\Controllers\AdminController; 

    
class SeedLabApiController extends AdminController
{
    public function seed_lab_list()
    {
        /*  ---attributes---
        
        */
        return SeedLab::all();  
    }   
}
