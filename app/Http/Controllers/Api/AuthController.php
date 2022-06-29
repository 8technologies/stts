<?php

namespace App\Http\Controllers\Api\Auth;

use Illuminate\Validation\ValidationException;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Support\Facades\DB;
use Encore\Admin\Facades\Admin;
use Illuminate\Support\Facades\Auth;
// use Validator;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
	/*
	 * Register new admin/ user
	*/
	public function register(Request $request) {
		
        if ($request->input("username") != null) {

            $admin = $request->validate([
                'first_name' => 'required|max:24|min:2',
                'last_name' => 'required|max:24|min:2',
				'email' => 'required|email|unique:users,email',
                'password' => 'required|max:100|min:3',
                'password1' => 'required|max:100|min:3',
            ]);

            if ($request->input("password") != $request->input("password1")) {
				return response()->json(['message' => 'Passwords did not match!'], 201);
            }

            $old_user = Administrator::where('username',  $request->input("username"))->first();
            if ($old_user) {
				$username_provided = $request->input("username");
				return response()->json(['message' => 'The username '. "'". $username_provided ."'".' already exists!'], 201);
            }

            $remember = $request->input('remember');   // making sure the user agrees to the t&cs
			if ($remember == 1){
				$admin = new Administrator();
				$admin->username = $request->input("username");
				$admin->first_name = $request->input("first_name");
				$admin->last_name = $request->input("last_name");
				$admin->name = $request->input("first_name") . " " . $request->input("last_name");
				$admin->email = $request->input("email");
				$admin->password = Hash::make($request->input("password"));
			
				if ($admin->save()) {
					DB::table('admin_role_users')->insert([
						'role_id' => 3,
						'user_id' => $admin->id
					]);
				} else {
					return response()->json(['message' => 'Failed to created your account. Please try again1!'], 201);
				}
			
				$userr['email'] = $request->input("email");
				$userr['password'] = $request->input("password");
				// $userr['password'] = Hash::make($request->input("password"));
				
				if (Admin::guard()->attempt($userr, $remember)) {   // log the user in 
					$request->session()->regenerate();
					return response()->json(['message' => 'Login successful!'], 200);
				}
			}
			// return response()->json(['message' => 'Y!'], 404);
        }
		return response()->json(['message' => 'Failed to created your account. Please try again!'], 201);
	}


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
            'password' => 'required|min:8',
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
        if (auth()->attempt($input)) {
            $token = auth()->user()->createToken('passport_token')->accessToken;
            
            return response()->json([
                'success' => true,
                'message' => 'User login succesfully, Use token to authenticate.',
                'token' => $token
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'User authentication failed.'
            ], 401);
        }
    }



	public function logout(Request $request) {
		if ($request->user()) { 
			$request->user()->tokens()->delete();
		} else {
			return response()->json(['message' => 'Invalid request!'], 501);
		}
	
		return response()->json(['message' => 'Logout Success!'], 200);
	}


	/*
	 * Get authenticated admin details
	*/
	public function getAuthenticatedUser(Request $request) {
		return $request->admin();
	}


	public function sendPasswordResetLinkEmail(Request $request) {
		$request->validate(['email' => 'required|email']);

		$status = Password::sendResetLink(
			$request->only('email')
		);

		if($status === Password::RESET_LINK_SENT) {
			return response()->json(['message' => __($status)], 200);
		} else {
			throw ValidationException::withMessages([
				'email' => __($status)
			]);
		}
	}

	public function resetPassword(Request $request) {
		$request->validate([
			'token' => 'required',
			'email' => 'required|email',
			'password' => 'required|min:8|confirmed',
		]);

		$status = Password::reset(
			$request->only('email', 'password', 'password_confirmation', 'token'),
			function ($user, $password) use ($request) {
				$user->forceFill([
					'password' => Hash::make($password)
				])->setRememberToken(Str::random(60));

				$user->save();

				event(new PasswordReset($user));
			}
		);

		if($status == Password::PASSWORD_RESET) {
			return response()->json(['message' => __($status)], 200);
		} else {
			throw ValidationException::withMessages([
				'email' => __($status)
			]);
		}
	}
}

