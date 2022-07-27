<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use App\Models\ImportExportPermit;
use App\Models\Utils;
use Illuminate\Http\Request;


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

        $query = DB::table('import_export_permits')
        ->where('administrator_id', $user->id)
        ->where('is_import', '!=', 1)
        ->get();
        // $query = DB::table('import_export_permits')->where('administrator_id', '=', $user->id)->get(); 
        // $query = ImportExportPermit::all();
        
        return $this->successResponse($query, $message="Export permits");  
    } 


    
    // delete import permit form
    public function export_permit_delete(Request $request): \Illuminate\Http\JsonResponse
    {
        $user_id = auth()->user()->id;
        $id = ((int)($request->input('id')));
        $item = ImportExportPermit::where('is_import', '!=', 1)->find($id);
        if ($item == null) {
            return $this->errorResponse("Failed to delete  because the item was not found.", 200);
        }
        if ($item->administrator_id != $user_id) {
            return $this->errorResponse("You cannot delete an item that does not belong to you.", 200);
        }
        if (!Utils::can_be_deleted_by_user($item->status)) {
            return $this->errorResponse("Item at this stage cannot be deleted.", 200);
        }
        ImportExportPermit::where('id', $id)->delete();
        return $this->successResponse($item, "Item deleted successfully!", 201);
    }
}
