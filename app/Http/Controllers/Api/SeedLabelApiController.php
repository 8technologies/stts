<?php

namespace App\Http\Controllers\Api;

use App\Models\SeedLabel;
use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB; 

    
class SeedLabelApiController extends AdminController
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function seed_label_list()
    {
        /*  ---attributes---
        */
        $user = auth()->user();
        $query = DB::table('seed_labels')->where('administrator_id', '=', $user->id)->get();
        // $query = SeedLab::all();
        
        return response()->json([
            'success' => true,
            'Logged in user' => $user->name,
            'data' => $query,
        ], Response::HTTP_OK); 
    } 
}
