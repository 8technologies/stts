<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;


class ExportPermitApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function export_permits_list()
    {
        /*  ---attributes---
        */
        $user = auth()->user();
        $query = DB::table('import_export_permits')->where('administrator_id', '=', $user->id)->get();
        // $query = ImportExportPermit::all();
        
        return $this->successResponse($query, $message="Export permits");  
    } 
}
