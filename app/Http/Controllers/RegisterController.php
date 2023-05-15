<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Registration;
use Illuminate\Http\Request;
use App\Models\Utils;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
       /**
     * Display register page.
     * 
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('registration.register');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
  
    /**
     * Handle account registration request
     * 
     * 
     * 
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request) 
    {
        $customMessages = [
            'required' => 'The :attribute field is required.',
            'email' => 'The :attribute must be a valid email address.',
            'unique' => 'The :attribute has already been taken.',
            'min' => 'The :attribute must be at least :min characters.'
        ];
    
        $validator = Validator::make($request->all(), [
            'email' => 'required|email:rfc,dns|unique:admin_users,email',
            'username' => 'required|unique:admin_users,username',
            'password' => 'required|min:8',
            'password_confirmation' => 'required|same:password'
        ], $customMessages);

        
        if ($validator->fails()) {
            Utils::register_alert('Validation failed', 'error', $validator->errors());
            return redirect('/registration')->withErrors($validator)->withInput();
        }
        
        

        
        $user = Registration::create([
            'name' => $request->fname . ' ' . $request->lname, 
            'email' => $request->email,
            'username' => $request->username,
            'password' => bcrypt($request->password)
        ]);
         
        Utils::add_role($user->id);
        //if the saving fails,sends an error message to the front end
        if (!$user) {
            Utils::alert('Account registration failed!','error'); 
            return redirect('/registration');
        }

        Utils::alert('Account registered successfully!','success'); 
        return redirect('/admin/auth/login');
    }
}
