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


class PassportController extends Controller
{
    /**
     * Register user.
     *
     * @return json
     */
    public function register(Request $request)
    {
        $input = $request->only(['first_name', 'last_name', 'email', 'password', 'password1']);

        $user = [
            'first_name' => 'required|max:24|min:2',
            'last_name' => 'required|max:24|min:2',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|max:100|min:3',
            'password1' => 'required|max:100|min:3'
        ];

        $validator = Validator::make($input, $user);

        if ($request->input("password") != $request->input("password1")) {
            return response()->json([
                'success' => false,
                'message' => 'Passwords did not match!',
                'errors' => $validator->errors()
            ]);
        }

        $old_user = Administrator::where('email',  $request->input("email"))->first();
        if ($old_user) {
            $email_provided = $request->input("email");
            return response()->json(['message' => 'The email '. "'". $email_provided ."'".' already exists!'], 201);
        }

        $validator = Validator::make($input, $user);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Please see errors parameter for all errors.',
                'errors' => $validator->errors()
            ]);
        }
        
        
        $remember = $request->input('remember');   // making sure the user agrees to the t&cs
        if ($remember == 1){
            $user = new Administrator();
            $user->username = $request->input("email");
            $user->first_name = $request->input("first_name");
            $user->last_name = $request->input("last_name");
            $user->name = $request->input("first_name") . " " . $request->input("last_name");
            $user->email = $request->input("email");
            $user->password = Hash::make($request->input("password"));
            
            if ($user->save()) {
                DB::table('admin_role_users')->insert([
                    'role_id' => 3,    // id '3' is the id of the normal users on the system
                    'user_id' => $user->id
                ]);
                
            $accessToken = $user->createToken('passportToken')->accessToken;
            return response()->json([
                'success' => true,
                'message' => 'User registered succesfully, Use Login method to receive token.',
                'accessToken' => $accessToken,
            ], 200);
        } else {
                return response()->json(['message' => 'Failed to created your account. Please try again1!'], 201);
            }
        }

        // return response for a user that fails to agree to the t&cs
        return response()->json([
            'success' => false,
            'message' => 'You must first agree to the t&cs'
        ], 201);

    }  // end if


    /**
     * Login user.
     *
     * @return json
     */
    public function login(Request $request)
    {
        $input = $request->only(['email', 'password']);

        $validate_data = [
            'email' => 'required|email',
            'password' => 'required|min:3',
        ];

        $validator = Validator::make($input, $validate_data);
        
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Please see errors parameter for all errors.',
                'errors' => $validator->errors()
            ]);
        }

        // authentication attempt
        if (auth()->attempt($validate_data)) {
            $token = auth()->user()->createToken('passport_token')->accessToken;
            
            return response()->json([
                'success' => true,
                'message' => 'User login succesful, Use token to authenticate.',
                'token' => $token
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'authentication failed'
            ], 401);
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
    public function logout()
    {
        $access_token = auth()->user()->token();

        // logout from only current device
        $tokenRepository = app(TokenRepository::class);
        $tokenRepository->revokeAccessToken($access_token->id);

        // use this method to logout from all devices
        // $refreshTokenRepository = app(RefreshTokenRepository::class);
        // $refreshTokenRepository->revokeRefreshTokensByAccessTokenId($$access_token->id);

        return response()->json([
            'success' => true,
            'message' => 'User logout successfully.'
        ], 200);
    }
}
