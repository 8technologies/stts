<?php

namespace App\Http\Controllers\Api;

use App\Models\CropVariety;
use App\Models\FormCropDeclaration;
use App\Models\FormCropDeclarationsHasCropVariety;
use App\Models\FormQds;
use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use Illuminate\Support\Facades\Auth;
use App\Models\SubGrower;
use App\Models\Utils;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;


class QDSCropDeclarationApiController extends AdminController
{
    use ApiResponser;

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


        return $this->successResponse($query, $message = "QDS Crop Declarations");
    }




    // create new planting returns company form via api
    public function qds_crop_declarations_create(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = Auth::user();

        $qds = FormQds::where(['administrator_id' => $user->id])->first();
        if ($qds == null) {
            return $this->errorResponse("Failed. You don't have a valid QDS certificate.", 200);
        }

        


        $data = $request->only(
            'source_of_seed',
            'field_size',
            'seed_rate',
            // 'form_crop_declarations_has_crop_varieties',
            'amount',
            'payment_receipt',
        );

        $post_data = Validator::make($data, [
            'field_size' => 'required',

        ]);

        if ($post_data->fails()) {
            return $this->errorResponse("Crop declaration submit error", 200);
        }


        $form = FormCropDeclaration::create([
            'administrator_id' => $user->id,
            'status' => 1,
            'form_qd_id' => $qds->id,
            'field_size' => $request->input('field_size'),
            'source_of_seed' => $request->input('source_of_seed'),
            'seed_rate' => $request->input('seed_rate'),
            'amount' => $request->input('amount'),
        ]);

        $crop_varieties = json_decode($request->input('crop_varieties'));
        if($crop_varieties!=null){
            if(is_array($crop_varieties)){ 
                foreach ($crop_varieties as $key => $value) {
                    $crop_id = ((int)($value));
                    $crop = CropVariety::find($crop_id);
                    if($crop == null){
                        continue;
                    } 
                    $formVar = new FormCropDeclarationsHasCropVariety();
                    $formVar->form_crop_declaration_id = $form->id;
                    $formVar->crop_variety_id = $crop_id;
                    $formVar->save(); 
	
                }
            }
        } 

        // Form created, return success response
        return $this->successResponse($form, "Crop declaration submitted successfully! " . $form->id, 201);
    }


    
    // delete qds crop declarations
    public function qds_crop_declarations_delete(Request $request): \Illuminate\Http\JsonResponse
    {
        $user_id = auth()->user()->id;
        $id = ((int)($request->input('id')));
        $item = FormCropDeclaration::find($id);
        if ($item == null) {
            return $this->errorResponse("Failed to delete  because the item was not found.", 200);
        }
        if ($item->administrator_id != $user_id) {
            return $this->errorResponse("You cannot delete an item that does not belong to you.", 200);
        }
        if (!Utils::can_be_deleted_by_user($item->status)) {
            return $this->errorResponse("Item at this stage cannot be deleted.", 200);
        }
        FormCropDeclaration::where('id', $id)->delete();
        return $this->successResponse($item, "Item deleted successfully!", 201);
    }
}
