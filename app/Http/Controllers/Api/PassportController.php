<?php

namespace App\Http\Controllers\Api;

// use Validator;
use Illuminate\Support\Facades\Validator;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Laravel\Passport\TokenRepository;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;


class PassportController extends Controller
{
    /**
     * Register user.
     *
     * @return json
     */
    public function register (Request $request) {
        $validator = Validator::make($request->all(), [
            'first_name' => 'required|max:24|min:2',
            'last_name' => 'required|max:24|min:2',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|max:100|min:3',
            'password1' => 'required|max:100|min:3'
        ]);

        if ($validator->fails()) {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        $request['password']=Hash::make($request['password']);
        $request['remember_token'] = Str::random(10);
        $user = Administrator::create($request->toArray());
        $token = $user->createToken('Laravel Password Grant Client')->accessToken;
        $response = ['token' => $token];

        return response()->json([
            'success' => true,
            'message' => 'User registered succesfully, Use Login method to receive token.',
            'accessToken' => $response,
        ], 200);
    }  // end if


    /**
     * Login user.
     *
     * @return json
     */
    public function login (Request $request) {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255',
            'password' => 'required|string|min:3',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $user = Administrator::where('email', $request->email)->first();
        if ($user) {
            if (Hash::check($request->password, $user->password)) {
                $token = $user->createToken('Laravel Password Grant Client')->accessToken;
                $response = ['token' => $token];
                
                return response()->json([
                    'success' => true,
                    'message' => 'User login succesful, Use token to authenticate.',
                    'accessToken' => $response
                ], 200);
            } else {
                $response = ["message" => "Password mismatch"];
                return response($response, 422);
            }
        } else {
            $response = ["message" =>'User does not exist'];
            return response($response, 422);
        }
    }

    /**
     * Access method to authenticate.
     *
     * @return json
     */
    public function userDetail()
    {
        return response()->json([
            'success' => true,
            'message' => 'Data fetched successfully.',
            'data' => auth()->user()
        ], 200);
    }

    /**
     * Logout user.
     *
     * @return json
     */
    public function logout (Request $request) {
        $token = $request->user()->token();
        $token->revoke();
        $response = ['message' => 'You have been successfully logged out!'];
        return response($response, 200);
    }
}
