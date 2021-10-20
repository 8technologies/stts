@extends('layouts.layout')
@section('head')
    <link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/user-form.css') }}">
@endsection
@section('content')

    <body>
        <section class="user-form-part">
            <div class="user-form-banner">
                <div class="user-form-content"><a href="#"><img src="{{ URL::asset('/assets') }}/images/logo.png"
                            alt="logo"></a>
                    <h1>Advertise your assets <span>Buy what are you needs.</span></h1>
                    <p>Biggest Online Advertising Marketplace in the World.</p>
                </div>
            </div>
            <div class="user-form-category">
                <div class="user-form-header"><a href="#"><img src="{{ URL::asset('/assets') }}/images/logo.png"
                            alt="logo"></a><a href="{{ url('') }}"><i class="fas fa-home"></i></a></div>
                <div class="user-form-category-btn">
                    <ul class="nav nav-tabs">
                        <li><a href="#register-tab" class="nav-link active" data-toggle="tab">sign up</a></li>
                    </ul>
                </div>
                <div class="tab-pane active" id="register-tab">
                    <div class="user-form-title">
                        <h2>Register</h2>
                        <p>Setup a new account in a minute.</p>
                    </div>


                    <form method="POST" accept="/login">
                        @csrf

                        <div class="row">
                            <div class="col-12">
                                <div class="form-group"><input type="text" value="{{ old('phone_number') }}"
                                        class="form-control" placeholder="Phone number" name="phone_number"><small
                                        class="form-alert">Please follow this example
                                        -
                                        +256XXXXXXXXX</small>
                                    @error('phone_number')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror

                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group"><input type="password" class="form-control"
                                        placeholder="Password" name="password"><button class="form-icon"><i
                                            class="eye fas fa-eye"></i></button><small class="form-alert">Password must
                                        be more than 6 characters</small>
                                    @error('password')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror

                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group"><input name="password1" type="password" class="form-control"
                                        placeholder="Repeat Password"><button class="form-icon"><i
                                            class="eye fas fa-eye"></i></button><small class="form-alert">This Password
                                        must
                                        match with the other on top</small>
                                    @error('password1')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                           
                            <div class="col-12">
                                <div class="form-group"><button type="submit" class="btn btn-inline"><i
                                            class="fas fa-user-check"></i><span>Create new account</span></button></div>
                            </div>
                        </div>
                    </form>
                    <div class="user-form-direction">
                        <p>Already have an account? <a href="{{ route('login') }}">Login</a> </p>
                    </div>
                </div>
            </div>
        </section>
    @endsection
