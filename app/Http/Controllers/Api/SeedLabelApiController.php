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
        $query = SeedLabel::where('administrator_id', $user->id)->get();
        return $this->successResponse($query, $message = "Seed Labels");
    }

    public function seed_label_create(Request $r)
    {
        $user = auth()->user();

        $label = new SeedLabel();

        $seed_lab = SeedLab::find(((int)($r->seed_lab_id)));
        $package = SeedLabelPackage::find(((int)($r->seed_label_package_id)));
        if ($seed_lab == null) {
            return $this->errorResponse("Seedlab not found.", 200);
        }
        if ($package == null) {
            return $this->errorResponse("Selected seed package not found", 200);
        }
        if (((int)($r->quantity)) < 1) {
            return $this->errorResponse("Selected quantity too small.", 200);
        }

        $pics = Utils::upload_images_1($_FILES, false);
        if (!isset($pics[0])) {
            return $this->errorResponse("Payment recept is required.", 200);
        }
        if (!isset($pics[1])) {
            return $this->errorResponse("Seed photo is required.", 200);
        }

        $price =  ((((int)($r->quantity)) / ((int)($package->package_size))) * $package->package_price);
        $price = ((int)($price));

        $label->seed_lab_id = $seed_lab->id;
        $label->administrator_id = $user->id;
        $label->crop_variety_id = $seed_lab->crop_variety_id;
        $label->seed_label_package_id = $r->seed_label_package_id;
        $label->quantity = $r->quantity;
        $label->applicant_remarks = $r->applicant_remarks;
        $label->price = $price;
        $label->status = 1;
        $label->is_processed = 0;
        $label->status_comment = '';
        $label->receipt = $pics[0];
        $label->image = $pics[1];
        $label->images = '[]';

        if ($label->save()) {
            return $this->successResponse($label, 'Seed label created successfully.', 201);
        } else {
            return $this->errorResponse("Failed to create seed label. Please try again.", 200); //try again
        }
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
