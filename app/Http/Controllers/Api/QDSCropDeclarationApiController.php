<?php

namespace App\Http\Controllers\Api;

use App\Models\FormCropDeclaration;
use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB; 
use App\Traits\ApiResponser;
use Illuminate\Support\Facades\Auth;
use App\Models\SubGrower;
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
        
        
        return $this->successResponse($query, $message="QDS Crop Declarations"); 
    } 


    
    
    // create new planting returns company form via api
    public function qds_crop_declarations_create(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = Auth::user();

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
            return $this->errorResponse("Planting grower company submit error", 200); 
        }


        $form = FormCropDeclaration::create([
            'administrator_id' => $user->id,
            'name' => $user->name,            
            'size' => $request->input('size'), 
            
        ]);

        // Form created, return success response
        return $this->successResponse($form, "Planting returns grower submit success! ".$form->id, 201); 
    }
}





