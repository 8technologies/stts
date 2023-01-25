<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendCodeResetPassword;
use App\Models\PasswordReset;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Support\Facades\Hash;
use Encore\Admin\Facades\Admin;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

use App\Models\Utils;
use Str;

//Viewing the password reset form to capture the email address

class PasswordResetController extends Controller
{
    public function showForgetPasswordForm() {
    return view('auth.forgetPassword');
}

//viewing the password reset form to the user

public function showResetPasswordForm(Request $request) {
//accessing the token from the URL get parameter
    $token = $request->get('token');

    return view('auth.forgetPasswordLink', compact('token'));
}

//Submitting the form and sending the reset link
    public function submitForgetPasswordForm(Request $request) {
    $request->validate(['email' => 'required|email']);
    $email = $request->email;
    $token = Str::uuid();
//delete all previous requests from the same email address
    PasswordReset::where('email', $email)->delete();

//save request in the PasswordReset table
    $data = PasswordReset::create( [
        'email' => $email,
        'token' => $token
    ]);
    $data->save();
    $link = url('/reset/password?token='.$token);

 //attach the link to the mailer
    Mail::to($email)->send(new SendCodeResetPassword($link));
            return back()->with('message', 'We have sent a reset email to your email address!');
        
}

//Resetting password

   public function submitResetPasswordForm(Request $request) {
    
    $request->validate([
        'password' => 'required|min:6',
        'password_confirmation' => 'required|same:password',
        'token' => 'required'
    ]);
   
    $updatePassword = PasswordReset::where( 'token',$request->token)->first();


    if(!$updatePassword){
        return back()->withInput()->with('error', 'Invalid token!');
    }
    elseif($updatePassword->status == 1){
        return back()->withInput()->with('error', 'Token has already been used!');
    }
    elseif($updatePassword->created_at > now()->addHour(1)) {
        $updatePassword->delete();
        return back()->withInput()->with('error', 'Sorry, the token has expired!');;
    }
   
   else{
    $updatePasswordRequest = PasswordReset::where([
        'token' => $request->token,
        'status' => 0
    ])->update(
        [
            'status' => 1
        ]
    );
    $user = Administrator::where('email', $updatePassword->email)
        ->update(['password'=> Hash::make($request->password)]);
    return redirect('/admin/auth/login')->with('message', 'Your password has been changed successfully!');
   }

}
}

