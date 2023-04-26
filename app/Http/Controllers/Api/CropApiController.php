<?php

namespace App\Http\Controllers\Api;

use App\Models\Crop;
use Encore\Admin\Controllers\AdminController; 
use App\Traits\ApiResponser;
use Illuminate\Http\Request; 
use Illuminate\Support\Facades\Validator;


class CropApiController extends AdminController 
{
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function crops_list()
    {
        $user = auth()->user();
        $query = Crop::all();

        return $this->successResponse($query, $message="Crops list"); 
    } 

    
    // create a new Crop form
    public function crops_create(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = auth()->user();

        $data = $request->only(
            'name',
            'number_of_inspection',
            'number_of_days_before_submision',
            'created_at',
            'updated_at',
        );

        $post_data = Validator::make($data, [
            'name' => 'integer',
            'number_of_inspection' => 'integer|nullable',
            'number_of_days_before_submision' => 'integer|nullable',
            'created_at' => 'date_format:mm-dd-yyyy|after:updated_at|nullable',
            'updated_at' => 'string|nullable',
        ]);

        $form = Crop::create([
            'name' => $request->input('name'),
            'number_of_inspection' => $request->input('number_of_inspection'),
            'number_of_days_before_submision' => $request->input('number_of_days_before_submision'),
            'created_at' => date('m-d-y'),
            'updated_at' => date('m-d-y'), 
        ]);

        // Form created, return success response
        return $this->successResponse($form, $message="Crop create success!", 200);
    }
}
