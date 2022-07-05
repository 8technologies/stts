<?php

namespace App\Http\Controllers\Api;

use App\Models\MarketableSeed;
use App\Models\ImportExportPermit;
use Encore\Admin\Controllers\AdminController; 
use Encore\Admin\Form; 
use Encore\Admin\Grid; 
use Encore\Admin\Show; 
use Illuminate\Support\Facades\Request; 
use App\Admin\Extensions\Tools\GridView; 


class ImportPermitApiController extends AdminController
{
    public function import_permits_list()
    {
        /*  ---attributes---
        
        */
        return ImportExportPermit::all();  
    }   
}
