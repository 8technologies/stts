<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Laravel\Passport\RefreshTokenRepository;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use Encore\Admin\Auth\Database\Administrator;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Laravel\Passport\TokenRepository;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
// use Laravel\Passport\Passport;
use Tymon\JWTAuth\Exceptions\JWTException;
use Symfony\Component\HttpFoundation\Response;
use JWTAuth;


class AuthApiController extends Controller {
     /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }

	
    /**
     * Register user.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(Request $request)
    {
        $data = $request->only('first_name', 'last_name', 'email', 'password', 'password_confirmation');

        $post_data = Validator::make($data, [
            'first_name' => 'required|max:24|min:2',
            'last_name' => 'required|max:24|min:2',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|max:100|min:3',
            'password_confirmation' => 'required|max:100|min:3'
        ]);

        if ($request->input("password") != $request->input("password_confirmation")) {
            $errors['password_confirmation'] = "Passwords did not match.";
            return response()->json([
                'success' => false,
                'message' => $errors,
            ], Response::HTTP_OK); 
        }

        $old_user = Administrator::where('username',  $request->input("username"))->first();
        if ($old_user) {
            $errors['username'] = "User with same email already exists.";
            return response()->json([
                'success' => false,
                'message' => $errors,
            ], Response::HTTP_OK); 
        }

        $user = new Administrator();            
            $user->first_name = $request->input("first_name");
            $user->last_name = $request->input("last_name");
            $user->name = $request->input("first_name") . " " . $request->input("last_name");
            $user->username = $request->input("username");
            $user->email = $request->input("email");
            $user->password = Hash::make($request->input("password"));
            $user->remember_token = Str::random(62);
            
        if ($user->save()) {
            DB::table('admin_role_users')->insert([
                'role_id' => 3,
                'user_id' => $user->id
            ]);
        } else {
            $errors['username'] = "Failed to created your account. Please try again.";
            return response()->json([
                'success' => false,
                'message' => $errors
            ], Response::HTTP_OK);
        }

        //User created, return success response
        return response()->json([
            'success' => true,
            'message' => 'User create Success'
        ], Response::HTTP_OK); 
    }


    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login()
    {
        $credentials = request(['email', 'password']);

        if (! $token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json(auth()->user());
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }
}
