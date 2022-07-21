<?php

namespace App\Http\Controllers\Api;

use App\Models\SeedLabel;
use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB; 
use App\Traits\ApiResponser;

    
class SeedLabelApiController extends AdminController
{
    use ApiResponser;
    
        public function __construct()
        {
            $this->middleware('auth');
        }
    
        public function seed_label_list()
        {
            /*  ---attributes---
            */
            $user = auth()->user();
            $query = DB::table('seed_labels')->where('administrator_id', $user->id)->get();
            // $query = SeedLab::all();
            
            return $this->successResponse($query, $message="Seed Labels");  
        } 
}    
    