<?php

namespace App\Http\Controllers\Api;

use App\Models\SeedLab;
use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB; 

    
class SeedLabApiController extends AdminController
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function seed_lab_list()
    {
        /*  ---attributes---
        */
        $user = auth()->user();
        $query = DB::table('seed_labs')->where('administrator_id', '=', $user->id)->get();
        // $query = SeedLab::all();
        
        return response()->json([
            'success' => true,
            'Logged in user' => $user->name,
            'data' => $query,
        ], Response::HTTP_OK); 
    } 
}
