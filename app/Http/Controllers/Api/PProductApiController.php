<?php

namespace App\Http\Controllers\Api;

use App\Models\MarketableSeed;
use App\Models\Product;
use Encore\Admin\Controllers\AdminController; 
use Encore\Admin\Form; 
use Encore\Admin\Grid; 
use Encore\Admin\Show; 
use Illuminate\Support\Facades\Request; 
use App\Admin\Extensions\Tools\GridView; 


class PProductApiController extends AdminController
{
    public function products_list()
    {
        /*  ---attributes---
        id, created_at , updated_at, administrator_id, crop_variety_id, seed_label_id, quantity,
        lab_test_number, lot_number, seed_class, price, wholesale_price, image, source, detail
        */
        return Product::all();  
    }   
}
