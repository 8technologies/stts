<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class UserAPIController extends Controller
{
    /** Display a listing of the resource. */
    public function index()
    {
        return User::all();  // List all the User entries in the database with their respective fields
    }

    /** Store a newly created resource in storage. */
    public function store(Request $request)
    {
        // Below, we will be validating the fillable values passed via the post request
        $request->validate([
            'first_name'=> "required",
            'last_name'=> "required",
            'wallet_id'=> "required",
            'phone_number'=> "required",
        ]);

        return User::create($request->all());     // Create all fields that will be passed via POST request
    }

    /** Display the specified resource. */
    public function show($id)
    {
        return User::find($id);    // Here we'll be showing a user of a given 'id' value
    }

    /** Update the specified resource in storage. */
    public function update(Request $request, $id)
    {
        // With this function, the idea is that we GET the user, UPDATE and then POST them back with the PUT request method
        // The PUT method takes the same arguments as those of the POST method.
        $user = User::find($id);  // find the user of a given id
        $user->update($request->all());  // update the fields that will be specified in the put request
        return $user;    // call the line above
    }

    /** Remove the specified resource from storage. */
    public function destroy($id)
    {
        return User::destroy($id);   // delete the user instance of the provided id.  RETURNS '200 ok'
    }

    /** Search the specified resource from storage. */
    public function where($name)
    {
        return User::query()
            ->where('first_name', 'LIKE', "%{$name}%")
            ->orWhere('last_name', 'LIKE', "%{$name}%")
            ->get();   // search for the user instance of the provided string about them.  RETURNS 'resource'
        // The convention above means that say you type 's' to search,
        // the result should contain character 's' somewhere at the start, middle or the end of the provided string which in our case is '$string'
    }

    public function myBeneficiaries(){
        // code
//        $this->myBeneficiaries()
    }
}
