@extends('layouts.layout')

@section('title', 'Page Title')

@section('head')
<link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/my-ads.css') }}">
@endsection

@section('content')
<?php
use Illuminate\Support\Facades\Auth;
use App\Models\Product;
$user_id = Auth::id();
$id = Auth::id();
$user = Auth::user();
$status = $user->account_status();
if($status == "active"){
    $err['success'] = "Account was verified successfully!";
    header("Location: ".route('dashboard'));
    die();
}
$is_pending = false;
if($user->profile){
if($user->profile->cover_photo){
if(strlen($user->profile->cover_photo)>5){
$is_pending = true;
}
}
}


?>

@include('layouts.dashboard-header');
<section class="myads-part">
    <div class="container">

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8 ">
                    <div class="card dash-header-card pt-0">
                        <div class="card-body text-center">

                            <img src="<?= URL::asset('assets/') ?>/images/complete-profile.jpg" width="120"
                                alt="empty-box.png">

                            @if ($is_pending)
                            <h2 class="h3 text-center mt-0">Pending For Verification.</h2>
                            <p class="text-center mb-2">Your account is pending for verification. This may take 1 to 2
                                days.</P>
                            <p class="text-center mb-2">If this process take long, please contact us on email ....</P>
                            <a href="contact" class="btn btn-inline mt-4 mb-2 post-btn"><i
                                    class="fas fa-phone"></i><span>CONTACT US</span></a>
                            @else
                            <h2 class="h3 text-center mt-0">Complete Your Profile.</h2>
                            <p class="text-left mb-2">Dear <b>{{$user->email}}</b>, we are very keen about everything
                                that
                                is posted on this site.
                                To avoid fake accounts and scamers, we manually verify each accounte before it posts
                                anything on this site.
                            </p>
                            <p class="text-left mb-2">There, you are requested to accomplish you profile, submit it for
                                review, once we very
                                it, then you will ba able to prost.</p>
                            <P class="text-left mb-2">Pleas click on the the "complete profile" button below to
                                accomplish your profile.</P>
                            <a href="{{ url('profile-edit') }}/{{ $id }}" class="btn btn-inline mt-4 mb-2 post-btn"><i
                                    class="fas fa-plus-circle"></i><span>COMPLETE PROFILE</span></a>
                            @endif

                        </div>
                    </div>
                </div>
            </div>
        </div>




    </div>
</section>
@endsection