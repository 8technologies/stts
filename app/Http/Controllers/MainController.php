<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductReview;
use App\Models\Profile;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class MainController extends Controller
{
    public function index()
    {
        return redirect()->intended('login');
    }

    public function slugSwitcher(Request  $request)
    {
        //echo "<pre>"; 
        //dd($request);
        //die();
        if(
            isset($_POST['reason']) &&
            isset($_POST['product_id']) &&
            isset($_POST['comment']
            )){
                $review = new ProductReview();
                $review->rating = $_POST['rating'];
                $review->reason = $_POST['reason'];
                $review->comment = $_POST['comment'];
                $review->product_id = $_POST['product_id'];
                $review->user_id =  Auth::id();
                
                $url = $_SERVER['REQUEST_URI'];
 
                if ($review->save()) {
                    $errors['success'] = "Review was submitted successfully!";
                    return redirect($url)
                        ->withErrors($errors)
                        ->withInput();
                } else {
                    $errors['password'] = "Failed to submit review, please try again.";
                    return redirect($url)
                        ->withErrors($errors)
                        ->withInput();
                }

        }

        $seg = request()->segment(1);
        $profile = Profile::where('username', $seg)->first();
        if ($profile) {
            return view('main.display-profile');
            return;
        }
        
        $pro = Product::where('slug', $seg)->first();
        if ($pro) {
            return view('main.display-ad');
            return;
        }
        return view('main.index');
    }

    public function login(Request  $request)
    {
        if (isset($_POST['phone_number'])) {

            $u['email'] = $_POST['phone_number'];
            $u['password'] = $_POST['password'];

            // /dd(password_hash("269435158522",PASSWORD_DEFAULT));

            if (Auth::attempt($u)) {
                $errors['success'] = "Account created successfully!";
                return redirect('dashboard')
                    ->withErrors($errors)
                    ->withInput();
            } else {
                $errors['password'] = "Wrong password";
                return redirect('login')
                    ->withErrors($errors)
                    ->withInput();
            }
        }

        return view('main.login');
    }

    public function register(Request  $request)
    {
        if (isset($_POST['phone_number'])) {
            $validated = $request->validate([
                'phone_number' => 'required|max:14|min:5',
                'password' => 'required|max:100|min:6',
            ]);



            if ($request->input('password') !=  $request->input('password1')) {
                $errors['password1'] = "Password don't match";
                return redirect('register')
                    ->withErrors($errors)
                    ->withInput();
            }

            $u['name'] = "";
            $u['email'] = $request->input("phone_number");

            $old_user = User::where('email', $u['email'])->first(); 
            if($old_user){
                $errors['phone_number'] = "User with same email or phone number already exist.";
                return redirect('register')
                    ->withErrors($errors)
                    ->withInput();
                    die();
            }

            $u['password'] = Hash::make($request->input("password"));
            $users = User::create($u);

            $credentials['email'] = $u['email'];
            $credentials['password'] = $request->input("password");

            if (Auth::attempt($credentials)) {
                $request->session()->regenerate();
                return redirect()->intended('dashboard');
            } else {
                return redirect()->intended('login');
            }
        }
        return view('main.register');
    }

    public function about()
    {
        dd("about us!");
    }
}
