<?php

namespace App\Http\Controllers\Api;

use App\Models\MarketableSeed;
use App\Models\PlantingReturn;
use Encore\Admin\Controllers\AdminController; 
use Encore\Admin\Form; 
use Encore\Admin\Grid; 
use Encore\Admin\Show; 
use Illuminate\Support\Facades\Request; 
use App\Admin\Extensions\Tools\GridView; 


class PlantingReturnsCompanyApiController extends AdminController
{
    public function planting_returns_company_list()
    {
        /*  ---attributes---
        
        */
        return PlantingReturn::all();  
    }   
}
