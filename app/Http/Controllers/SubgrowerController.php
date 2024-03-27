<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\PlantingReturn;
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
        
         $forms = SubGrower::where('administrator_id',$id)->get();
       
         $details = [];
         //foreach of the forms get the planting return details
         foreach($forms as $form)
         {
            if($form->planting_return_id != null){
             $planting_return = PlantingReturn::find($form->planting_return_id);
             $details[] = 
             [
                 'form' => $form,
                 'planting_return' => $planting_return
             ];
            }
         }

         return response()->json($details);
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
            $details = [];
            //foreach of the forms get the planting return details
            foreach($forms as $form)
            {
               if($form->planting_return_id != null){
                $planting_return = PlantingReturn::find($form->planting_return_id);
                $details[] = 
                [
                    'form' => $form,
                    'planting_return' => $planting_return
                ];
               }
            }

            return response()->json($details);
        }
}
