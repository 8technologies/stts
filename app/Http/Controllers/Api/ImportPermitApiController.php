<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;


class ImportPermitApiController extends AdminController
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function import_permits_list()
    {
        /*  ---attributes---
        */
        $user = auth()->user();
        $query = DB::table('import_export_permits')->where('administrator_id', $user->id)->get();
        // $query = ImportExportPermit::all();
        
        return response()->json([
            'success' => true,
            'Logged in user' => $user->name,
            'data' => $query,
        ], Response::HTTP_OK); 
    } 
}
