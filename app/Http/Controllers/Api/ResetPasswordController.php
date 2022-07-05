<?php

namespace App\Http\Controllers\Api;

// use App\Models\User;
use Encore\Admin\Auth\Database\Administrator;
use App\Mail\SendMailreset;
use Illuminate\Support\Facades\Mail;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;


class ResetPasswordController extends Controller{

    public function sendEmail(Request $request)
    {
        if(!$this->validateEmail($request->email)) {
            return $this->failedResponse();
        }

        $this->send($request->email);
        return $this->successResponse();
    }


    public function send($email)
    {
        $token = $this->createToken($email);
        Mail::to($email)->send(new SendMailreset($token, $email));
    }


    public function createToken($email)
    {

        $oldToken = DB::table('password_resets')->where('email', $email)->first();

        if ($oldToken) {
            return $oldToken->token;
        }

        $token = Str::random(40);
        $this->saveToken($token, $email);
        return $token;
    }


    public function saveToken($token, $email)
    {
        DB::table('password_resets')->insert([
            'email' => $email,
            'token' => $token,
            'created_at' => Carbon::now()
        ]);

    }


    public function validateEmail($email)
    {
        return !!Administrator::where('email', $email)->first();
    }


    public function failedResponse()
    {
        return response()->json([
            'error' => "Email was not found in the Database"
        ], 404);
    }


    public function successResponse()
    {
        return response()->json([
            'data' => "Reset email link sent successfully, please check your inbox"
        ], 200);
    }
}