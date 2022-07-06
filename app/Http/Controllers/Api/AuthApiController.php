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
use Tymon\JWTAuth\Exceptions\JWTException;
use Symfony\Component\HttpFoundation\Response;
use JWTAuth;
use App\Traits\ApiResponser;


class AuthApiController extends Controller 
{
    use ApiResponser;

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
        $query = auth()->user();
        return $this->successResponse($query, $message="Profile details"); 
    }


    // update details of the currently logged in user.
    public function update(Request $request)
    {
        $details=Administrator::find(auth()->user()->id);
        $details->update($request->all());
        
        return $this->successResponse($details, $message="Updated Profile"); 
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


    // forgot password api end point
    public function forgot_password(Request $request)
    {
        $input = $request->all();
        $rules = array(
            'email' => "required|email",
        );
        $validator = Validator::make($input, $rules);
        if ($validator->fails()) {
            $arr = array("status" => 400, "message" => $validator->errors()->first(), "data" => array());
        } else {
            try {
                $response = Password::sendResetLink($request->only('email'), function (Message $message) {
                    $message->subject($this->getEmailSubject());
                });
                switch ($response) {
                    case Password::RESET_LINK_SENT:
                        return \Response::json(array("status" => 200, "message" => trans($response), "data" => array()));
                    case Password::INVALID_USER:
                        return \Response::json(array("status" => 400, "message" => trans($response), "data" => array()));
                }
            } catch (\Swift_TransportException $ex) {
                $arr = array("status" => 400, "message" => $ex->getMessage(), "data" => []);
            } catch (Exception $ex) {
                $arr = array("status" => 400, "message" => $ex->getMessage(), "data" => []);
            }
        }
        return \Response::json($arr);
    }


    // change passsword
    public function change_password(Request $request)
    {
        $input = $request->all();
        $userid = Auth::guard('api')->user()->id;
        $rules = array(
            'old_password' => 'required',
            'new_password' => 'required|min:6',
            'confirm_password' => 'required|same:new_password',
        );

        $validator = Validator::make($input, $rules);
        if ($validator->fails()) {
            $arr = array("status" => 400, "message" => $validator->errors()->first(), "data" => array());
        } else {
            try {
                if ((Hash::check(request('old_password'), Auth::user()->password)) == false) {
                    $arr = array("status" => 400, "message" => "Check your old password.", "data" => array());
                } else if ((Hash::check(request('new_password'), Auth::user()->password)) == true) {
                    $arr = array("status" => 400, "message" => "Please enter a password which is not similar then current password.", "data" => array());
                } else {
                    User::where('id', $userid)->update(['password' => Hash::make($input['new_password'])]);
                    $arr = array("status" => 200, "message" => "Password updated successfully.", "data" => array());
                }
            } catch (\Exception $ex) {
                if (isset($ex->errorInfo[2])) {
                    $msg = $ex->errorInfo[2];
                } else {
                    $msg = $ex->getMessage();
                }
                $arr = array("status" => 400, "message" => $msg, "data" => array());
            }
        }
        
        return \Response::json($arr);
    }
}
