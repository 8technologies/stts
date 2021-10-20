@php

$id = Auth::id();
$seg = request()->segment(1);

use Illuminate\Support\Facades\Auth;
$user = Auth::user();

@endphp
<section class="dash-header-part mt-4">
    <div class="container">
        <div class="dash-header-card pt-0 ">
            <div class="row ">
                <div class="col-lg-12 ">
                    <div class="dash-menu-list pt-0 mt-0 ">
                        <ul>
                            <li><a @if ($seg=='dashboard'  ) class="active" @endif
                                    href="{{ route('dashboard') }}">dashboard</a></li>

                            <li><a @if ($seg=='post-ad' || $seg== "complete-profile-request") class="active" @endif href="{{ route('post-ad') }}">Post
                                    ad</a></li>

                            <li><a @if ($seg=='messages' ) class="active" @endif
                                    href="{{ url('messages') }}">Messages</a></li>

                            <li><a @if ($seg=='membership' ) class="active" @endif
                                    href="{{ route('membership') }}">Membership</a></li>
                            <li><a @if ($seg=='profile-edit' ) class="active" @endif
                                    href="{{ url('profile-edit') }}/{{ $id }}">My Profile</a></li>
                            <li><a @if ($seg=='post-ad' ) class="active" @endif
                                    href="{{ url('profile-edit') }}/{{ $id }}">Settings</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
