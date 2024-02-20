<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SubGrower;
use App\Models\Utils;

class SubgrowerController extends Controller
{
   
    public function index()
    {
              // Retrieve all SubGrower instances
              $forms = SubGrower::all();
              // Return a collection of SubGrower resources
              return response()->json($forms);
    }

   
    public function store(Request $request)
    {
  
           // Validate incoming request
           $data = $request->all();
           $form = SubGrower::create($data);

            return response()->json($form);
        }

   
    public function show($id)
    {
        
         $form = SubGrower::where('administrator_id',$id)->get();
       
         return response()->json($form);
    }

    
    public function update(Request $request, $id)
    {
         
         $data = $request->all();
        
        // Find the SubGrower instance
        $form = SubGrower::find($id);

        $form->update($data);

        return response()->json($form);
    }

   
    public function destroy($id)
    {

        $form =  SubGrower::find($id);
        $form->delete();

    
        return response()->json(['message' => 'Form deleted successfully']);
    }

        //get the inspections assigned to an inspector
        public function getAssignedForms($id)
        {
            $forms = SubGrower::where('inspector_id', $id)->get();

            return response()->json($forms);
        }
}
