<?php

namespace App\Http\Controllers\Api;

use App\Models\SeedLab;
use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB; 
use App\Traits\ApiResponser;
use Illuminate\Support\Facades\Auth;
use App\Models\SubGrower;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

    
class SeedLabApiController extends AdminController
{
    use ApiResponser;

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
        
        return $this->successResponse($query, $message="Seed Labs"); 
    } 

      
    // create seed lab create via api
    public function seed_lab_create(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = Auth::user();

        $data = $request->only(
            'form_stock_examination_request_id',
            'collection_date', 
            'payment_receipt',
            'applicant_remarks',
        );

        $post_data = Validator::make($data, [
            'form_stock_examination_request_id',
            'collection_date' => 'required', 
            'payment_receipt' => 'required', 
            'applicant_remarks' => 'required',
        ]);

        if ($post_data->fails()) {
            return $this->errorResponse("Seed Lab submit error", 200); 
        }

        $form = SeedLab::create([
            'administrator_id' => $user->id,
            'form_stock_examination_request_id' => $request->input('form_stock_examination_request_id'),
            'collection_date' => $request->input('collection_date'), 
            'payment_receipt' => $request->input('payment_receipt'),
            'applicant_remarks' => $request->input('applicant_remarks'),
        ]);

        // Form created, return success response
        return $this->successResponse($form, "Seed Lab submit success!", 201); 
    }
}
