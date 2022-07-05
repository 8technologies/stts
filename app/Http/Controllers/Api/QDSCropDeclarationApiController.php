<?php

namespace App\Http\Controllers\Api;

use App\Models\FormCropDeclaration;
use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB; 

    
class QDSCropDeclarationApiController extends AdminController
{   
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function qds_crop_declarations_list()
    {
        /*  ---attributes---
        */
        $user = auth()->user();
        $query = DB::table('form_crop_declarations')->where('administrator_id', '=', $user->id)->get();
        // $query = FormQds::all();
        
        return response()->json([
            'success' => true,
            'Logged in user' => $user->name,
            'data' => $query,
        ], Response::HTTP_OK); 
    } 
}
