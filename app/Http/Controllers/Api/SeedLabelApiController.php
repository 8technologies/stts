<?php

namespace App\Http\Controllers\Api;

use App\Models\SeedLab;
use App\Models\SeedLabel;
use App\Models\SeedLabelPackage;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use Illuminate\Http\Request;


class SeedLabelApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function seed_label_list()
    {
        $user = auth()->user();
        $query = DB::table('seed_labels')->where('administrator_id', $user->id)->get();
        return $this->successResponse($query, $message = "Seed Labels");
    }

    public function seed_label_create(Request $r)
    {
        $user = auth()->user();

        $label = new SeedLabel();

        $seed_lab = SeedLab::find(((int)($r->seed_lab_id)));
        if ($seed_lab == null) {
            return $this->errorResponse("Seedlab not found.", 200);
        }   

        return $this->successResponse([], "Good to go with $seed_lab->crop_variety_id", 201);

        /* $label->seed_lab_id = ;  
        
        crop_variety_text
        $label->administrator_id = $user->id;
        $label->crop_variety_id = $r->crop_variety_id;
        $label->seed_label_package_id = $r->seed_label_package_id;
        $label->quantity = $r->quantity;
        $label->applicant_remarks = $r->applicant_remarks;
        $label->price = $r->price;
        $label->status = 1;
        $label->is_processed = 0;
        $label->status_comment = '';
        $label->receipt = $receipt;
        $label->image = $image;
        $label->images = '[]'; 
        return $this->successResponse($form, "Seed Lab submit success!", 201);
        
        
        */
    }


    public function seed_label_packages()
    {
        $query = SeedLabelPackage::all();
        return $this->successResponse($query, $message = "Seed Label packages");
    }



    // delete seed lab
    public function seed_label_delete(Request $request)  //\Illuminate\Http\JsonResponse
    {
        $user_id = auth()->user()->id;
        $id = ((int)($request->input('id')));
        $item = SeedLabel::find($id);

        if ($item == null) {
            return $this->errorResponse("Failed to delete  because the item was not found.", 200);
        }
        if ($item->administrator_id != $user_id) {
            return $this->errorResponse("You cannot delete an item that does not belong to you.", 200);
        }
        if (!Utils::can_be_deleted_by_user($item->status)) {
            return $this->errorResponse("Item at this stage cannot be deleted.", 200);
        }
        SeedLabel::where('id', $id)->delete();
        return $this->successResponse($item, "Item deleted successfully!", 201);
    }
}
