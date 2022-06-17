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
use Illuminate\Support\Facades\Auth;
// use Auth;


class SanctumAuthApiController extends Controller
{
    /**
     * Register user.
     *
     * @return json
     */
    public function register(Request $request){

        $post_data = $request->validate([
            'first_name' => 'required|max:24|min:2',
            'last_name' => 'required|max:24|min:2',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|max:100|min:3',
            'password1' => 'required|max:100|min:3'
        ]);
 
            $user = Administrator::create([
                'first_name' => $post_data['first_name'],
                'last_name' => $post_data['last_name'],
                'name' => $post_data['first_name'] . " " . $post_data['last_name'],
                'username' => $post_data['email'],
                'email' => $post_data['email'],
                'password' => Hash::make($post_data['password']),
                'remember_token' => Str::random(62)
            ]);

            if ($user->create()) {
                DB::table('admin_role_users')->insert([
                    'role_id' => 3,
                    'user_id' => $user->id
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Failed to created your account. Please try again.',
                ], 200);
            }
 
            $token = $user->createToken('authToken')->plainTextToken;

            // return response()->json([
            //     'success' => true,
            //     'message' => 'User register succesful. Use Login method to receive token.',
            //     'access_token' => $token,
            //     'token_type' => 'Bearer',
            // ], 200);

            return $this->success([
                'token' => $user->createToken('tokens')->plainTextToken
            ]);
        }
 

    public function login(Request $request){
    if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json([
            'message' => 'Invalid Login details'
            ], 401);
    }

    $user = Administrator::where('email', $request['email'])->firstOrFail();
            $token = $user->createToken('authToken')->plainTextToken;

            return response()->json([
                'success' => true,
                'message' => 'Login success.',
                'access_token' => $token,
                'token_type' => 'Bearer',
            ], 200);
    }  // end if


    /**
     * Logout user.
     *
     * @return json
     */
    public function logout (Request $request) {
        $token = $request->user()->token();
        $token->revoke();
        $response = ['message' => 'Logged out'];
        return response($response, 200);
    }

     // this method signs out users by removing tokens
     public function logout2()
     {
         auth()->user()->tokens()->delete();
         return [
             'message' => 'Logged out'
         ];
     }
}