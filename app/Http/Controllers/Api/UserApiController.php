<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Encore\Admin\Auth\Database\Administrator;


class UserAPIController extends Controller
{
    /** Display a listing of the resource. */
    public function index()
    {
        return Administrator::all();  // List all the User entries in the database with their respective fields
    }

    /** Display the specified resource. */
    public function show($id)
    {
        return Administrator::find($id);    // Here we'll be showing a user of a given 'id' value
    }

    /** Update the specified resource in storage. */
    public function update(Request $request, $id)
    {
        // With this function, the idea is that we GET the user, UPDATE and then POST them back with the PUT request method
        // The PUT method takes the same arguments as those of the POST method.
        $user = Administrator::find($id);  // find the user of a given id
        $user->update($request->all());  // update the fields that will be specified in the put request
        return $user;    // call the line above
    }

    /** Remove the specified resource from storage. */
    public function destroy($id)
    {
        return Administrator::destroy($id);   // delete the user instance of the provided id.  RETURNS '200 ok'
    }

    /** Search the specified resource from storage. */
    public function where($name)
    {
        return Administrator::query()
            ->where('first_name', 'LIKE', "%{$name}%")
            ->orWhere('last_name', 'LIKE', "%{$name}%")
            ->get();   // search for the user instance of the provided string about them.  RETURNS 'resource'
        // The convention above means that say you type 's' to search,
        // the result should contain character 's' somewhere at the start, middle or the end of the provided string which in our case is '$string'
    }
    
}