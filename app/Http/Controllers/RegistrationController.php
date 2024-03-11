<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\AdminRoleUser;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;
use Encore\Admin\Auth\Database\Administrator;

class RegistrationController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        header('Content-Type: application/json');

        $requestUrl = request()->path();
        $segments = explode('/', $requestUrl);
        $lastSegment = end($segments);

        if ($lastSegment != 'login' && $lastSegment != 'register') {
            $u = auth('api')->user();
            if ($u == null) {
                die(json_encode(['code' => 0, 'message' => 'Unauthorized']));
            }
        }
        // die("my api");
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        die('test');
    }
    public function profile()
    {
        $u = auth('api')->user();
        if ($u == null) {
            return response()->json(['code' => 0, 'message' => 'Unauthorized']);
        }
        return response()->json(['code' => 1, 'message' => 'User profile', 'data' => $u]);
    }

    
    public function register(Request $r)
    {
        if ($r->name == null) {
            return response()->json(['code' => 0, 'message' => 'Name is required.']);
        }
        if ($r->email == null) {
            return response()->json(['code' => 0, 'message' => 'Email is required.']);
        }
        if ($r->password == null) {
            return response()->json(['code' => 0, 'message' => 'Password is required.']);
        }
        $u = User::where('email', $r->email)
            ->orWhere('username', $r->email)
            ->first();
        if ($u != null) {
            return response()->json(['code' => 0, 'message' => 'User account already exists.']);
        }
        $u = new User();
        $u->name = $r->name;
        $u->email = $r->email;
        $u->username = $r->email;
        $u->password = password_hash($r->password, PASSWORD_DEFAULT);
        try {
            $u->save();
            $role = new AdminRoleUser();
            $role->user_id = $u->id;
            $role->role_id = 3;
            $role->save();
        } catch (\Throwable $th) {
            return response()->json(['code' => 0, 'message' => 'An error occurred.']);
        }

        $u = User::where('email', $r->email)->first();

        JWTAuth::factory()->setTTL(60 * 24 * 30 * 12);
        $token = auth('api')->attempt([
            'email' => $u->email,
            'password' => $r->password,
        ]);
        $u->token = $token;
        return response()->json(['code' => 1, 'message' => 'User registered successfully.', 'data' => $u]);
    }

    public function login(Request $r)
    {

        if ($r->username == null) {
            return response()->json(['code' => 0, 'message' => 'Username is required.']);
        }
        if ($r->password == null) {
            return response()->json(['code' => 0, 'message' => 'Password is required.']);
        }
        $u = Administrator::where('username', $r->username)
        ->with('roles') // Assuming 'role' is the name of the relationship in your User model
        ->first();
        if ($u == null) {
            return response()->json(['code' => 0, 'message' => 'Invalid credentials.']);
        }


        JWTAuth::factory()->setTTL(60 * 24 * 30 * 12);
        $token = auth('api')->attempt([
            'username' => $u->username,
            'password' => $r->password,
        ]);

        if ($token == null) {
            return response()->json(['code' => 0, 'message' => 'Invalid credentials.']);
        }
        $u->token = $token;
        return response()->json(['code' => 1, 'message' => 'User logged in successfully.', 'data' => $u]);
    }

    
    public function logout()
    {
        // get token
        $token = JWTAuth::getToken();

        // invalidate token
        $invalidate = JWTAuth::invalidate($token);

        if($invalidate) {
            return response()->json([
                'meta' => [
                    'code' => 200,
                    'status' => 'success',
                    'message' => 'Successfully logged out',
                ],
                'data' => [],
            ]);
        }
    }



}