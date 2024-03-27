<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\PlantingReturn;
use Illuminate\Http\Request;
use App\Models\User;
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
         // Loop through each form
         foreach ($forms as $form) {
            // Check if the form has a planting return associated with it
            if ($form->planting_return_id != null) {
                // Retrieve the planting return details
                $planting_return = PlantingReturn::find($form->planting_return_id);
                $subgrower_name = User::find($form->administrator_id)->name;
                
                // Push form and its associated planting return details to the details array
                $details[] = [
                    'subgrower form' => $form,
                    'planting_return' => $planting_return,
                    'subgrower_name' => $subgrower_name
                ];
            }
            else{
                $subgrower_name = User::find($form->administrator_id)->name;
                $details[] = [
                    'subgrower form' => $form,
                    'subgrower_name' => $subgrower_name,
                    'planting_return' => null
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
            // Retrieve forms assigned to the given inspector
            $forms = SubGrower::where('inspector_id', $id)->get();
            
            $details = [];
        
            // Loop through each form
            foreach ($forms as $form) {
                // Check if the form has a planting return associated with it
                if ($form->planting_return_id != null) {
                    // Retrieve the planting return details
                    $planting_return = PlantingReturn::find($form->planting_return_id);
                    $subgrower_name = User::find($form->administrator_id)->name;
                    
                    // Push form and its associated planting return details to the details array
                    $details[] = [
                        'subgrower form' => $form,
                        'planting_return' => $planting_return,
                        'subgrower_name' => $subgrower_name
                    ];
                }
                else{
                    $subgrower_name = User::find($form->administrator_id)->name;
                    $details[] = [
                        'subgrower form' => $form,
                        'subgrower_name' => $subgrower_name,
                        'planting_return' => null
                    ];
                }
            }
        
            // Return details as JSON response
            return response()->json($details);
        }
        
}
