<!DOCTYPE html>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<head>
    <link rel="stylesheet" href="{{ URL::asset('assets/css/vendor/bootstrap.min.css') }}">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Muhindo Mubaraka">
    <meta name="title" content="JO-Trace">
    <meta name="keywords"
        content="classicads, classified, ads, classified ads, listing, business, directory, jobs, marketing, portal, advertising, local, posting, ad listing, ad posting,">
    <title>@yield('title')</title>
    <link rel="icon" href="images/favicon.png">
    <link rel="stylesheet" href="{{ URL::asset('/assets/fonts/flaticon/flaticon.css') }}">
    <link rel="stylesheet" href="{{ URL::asset('/assets/fonts/font-awesome/fontawesome.css') }}">
    <link rel="stylesheet" href="{{ URL::asset('/assets/css/vendor/slick.min.css') }}">
    <link rel="stylesheet" href="{{ URL::asset('/assets/css/vendor/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/main.css') }}">
    <link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/index.css') }}">
    @yield('head')
</head>

@php
    $key_word = "";
    if(isset($_GET['search'])){
    if(strlen(isset($_GET['search']))>0){
    $key_word = trim($_GET['search']);
    }
}

use App\Models\Category;
$cats = Category::all();

@endphp

<body>
    <header class="header-part">
        <div class="container">
            <div class="header-content">
                <div class="header-left"><button type="button" class="header-widget sidebar-btn"><i
                            class="fas fa-align-left"></i></button><a href="<?= URL::asset('/') ?>"
                        class="header-logo"><img src="<?= URL::asset('assets/') ?>/images/logo.png" alt="logo"></a>

                </div>
                <form class="header-form" action="/">
                    <div class="header-search pl-3">
                        <input name="search" type="search" value="{{$key_word}}"
                            placeholder="Search, Whatever you need...">
                        <button type="submit" title="Search Submit "><i class="fas fa-search"></i></button>
                    </div>
                </form>
                <div class="header-right">
                    @auth
                    <ul class="header-list">

                        <li class="header-item"><a type="button" href="{{url("messages")}}" class="header-widget"><i
                                    class="fas fa-envelope"></i><sup>0</sup></a>
                            {{-- <div class="dropdown-card">
                                <div class="dropdown-header">
                                    <h5>message (2)</h5><a href="<?= URL::asset('/') ?>">view all</a>
                                </div>
                                <ul class="message-list">
                                    <li class="message-item unread"><a href="<?= URL::asset('/') ?>"
                                            class="message-link">
                                            <div class="message-img active"><img
                                                    src="<?= URL::asset('assets/') ?>/images/avatar/01.jpg"
                                                    alt="avatar"></div>
                                            <div class="message-text">
                                                <h6>miron mahmud <span>now</span></h6>
                                                <p>How are you my best frien...</p>
                                            </div><span class="message-count">4</span>
                                        </a></li>
                                    <li class="message-item"><a href="<?= URL::asset('/') ?>" class="message-link">
                                            <div class="message-img active"><img
                                                    src="<?= URL::asset('assets/') ?>/images/avatar/03.jpg"
                                                    alt="avatar"></div>
                                            <div class="message-text">
                                                <h6>shipu ahmed <span>3m</span></h6>
                                                <p><span>me:</span>How are you my best frien...</p>
                                            </div>
                                        </a></li>
                                    <li class="message-item unread"><a href="<?= URL::asset('/') ?>"
                                            class="message-link">
                                            <div class="message-img"><img
                                                    src="<?= URL::asset('assets/') ?>/images/avatar/02.jpg"
                                                    alt="avatar">
                                            </div>
                                            <div class="message-text">
                                                <h6>tahmina bonny <span>2h</span></h6>
                                                <p>How are you my best frien...</p>
                                            </div><span class="message-count">12</span>
                                        </a></li>
                                    <li class="message-item"><a href="<?= URL::asset('/') ?>" class="message-link">
                                            <div class="message-img active"><img
                                                    src="<?= URL::asset('assets/') ?>/images/avatar/04.jpg"
                                                    alt="avatar"></div>
                                            <div class="message-text">
                                                <h6>nasrullah <span>5d</span></h6>
                                                <p>How are you my best frien...</p>
                                            </div>
                                        </a></li>
                                    <li class="message-item"><a href="<?= URL::asset('/') ?>" class="message-link">
                                            <div class="message-img"><img
                                                    src="<?= URL::asset('assets/') ?>/images/user.png" alt="avatar">
                                            </div>
                                            <div class="message-text">
                                                <h6>saikul azam <span>7w</span></h6>
                                                <p><span>me:</span>How are you my best frien...</p>
                                            </div>
                                        </a></li>
                                    <li class="message-item"><a href="<?= URL::asset('/') ?>" class="message-link">
                                            <div class="message-img active"><img
                                                    src="<?= URL::asset('assets/') ?>/images/avatar/02.jpg"
                                                    alt="avatar"></div>
                                            <div class="message-text">
                                                <h6>munni akter <span>9m</span></h6>
                                                <p>How are you my best frien...</p>
                                            </div>
                                        </a></li>
                                    <li class="message-item"><a href="<?= URL::asset('/') ?>" class="message-link">
                                            <div class="message-img active"><img
                                                    src="<?= URL::asset('assets/') ?>/images/avatar/03.jpg"
                                                    alt="avatar"></div>
                                            <div class="message-text">
                                                <h6>shahin alam <span>1y</span></h6>
                                                <p>How are you my best frien...</p>
                                            </div>
                                        </a></li>
                                </ul>
                            </div> --}}
                        </li>
                    </ul>

                    <a href="<?= url('/dashboard') ?>" class="header-widget header-user"><img
                            src="<?= URL::asset('assets/') ?>/images/user.png" alt="user"><span class="text-dark">My
                            Account</span></a><button type="button" class="header-widget search-btn"><i
                            class="fas fa-search"></i></button>
                    @endauth
                    @guest

                    <a href="/register"
                        class="header-user border rounded pr-3 pl-3 mr-3 text-primary border-primary "><span>Register</span></a><button
                        type="button" class="header-widget search-btn"><i class="fas fa-search"></i></button>

                    <a href="/login"
                        class="header-widget header-user border rounded pr-2 border-primary text-primary"><span>Sign
                            in</span></a><button type="button" class="header-widget search-btn"><i
                            class="fas fa-search"></i></button>
                    @endguest

                    <a href="<?= URL::asset('/post-ad') ?>" class="btn btn-inline post-btn"><i
                            class="fas fa-plus-circle"></i><span>post your service</span></a>
                </div>
            </div>
        </div>
    </header>
    <aside class="sidebar-part">
        <div class="sidebar-body">
            <div class="sidebar-header"><a href="<?= URL::asset('/') ?>" class="sidebar-logo"><img
                        src="<?= URL::asset('assets/') ?>/images/logo.png" alt="logo"></a><button
                    class="sidebar-cross"><i class="fas fa-times"></i></button></div>
            <div class="sidebar-content">
                <div class="sidebar-profile">

                    @auth
                    @php
                    if(strlen(Auth::user()->name)<1){ Auth::user()->name = null;
                        }
                        @endphp
                        <a href="/" class="sidebar-avatar"><img src="<?= URL::asset('assets/') ?>/images/avatar/01.jpg"
                                alt="avatar"></a>
                        <h4><a href="#" class="sidebar-name">{{ Auth::user()->name ?? Auth::user()->email }}</a></h4>
                        @endauth


                        <a href="<?= URL::asset('/') ?>" class="btn btn-inline sidebar-post"><i
                                class="fas fa-plus-circle"></i><span>post your
                                ad</span></a>
                </div>
                <div class="sidebar-menu">
                    <ul class="nav nav-tabs">
                        <li><a href="#main-menu" class="nav-link active" data-toggle="tab">Categories</a></li>
                        <li><a href="#author-menu" class="nav-link" data-toggle="tab">My Account</a></li>
                    </ul>
                    <div class="tab-pane active" id="main-menu">
                        <ul class="navbar-list">
                            @foreach ($cats as $item)
                            @php
                            if($item->parent == null){
                            $parent = 0;
                            }else{
                            $parent = (int)($item->parent);
                            }

                            if($parent>=1){
                            continue;
                            }
                            @endphp
                            <li class="navbar-item navbar-dropdown"><a class="navbar-link"
                                    href="#"><span>{{$item->name}}</span><i class="fas fa-plus"></i></a>
                                <ul class="dropdown-list">
                                    @foreach ($item->sub_categories as $sub_item)
                                    <li class="navbar-item"><a class="navbar-link" href="/{{ $sub_item->slug }}">
                                            <span style="color: black!important">
                                                {{$sub_item->name}}
                                            </span>
                                            <span style="color: black!important">{{ count($sub_item->products) }}</span>
                                        </a>
                                    </li>
                                    @endforeach
                            </li>
                        </ul>
                        </li>
                        @endforeach

                        </ul>
                    </div>
                    <div class="tab-pane" id="author-menu">
                        @guest
                        <ul class="navbar-list text-center">

                            <a href="<?= URL::asset('/login') ?>" class="btn btn-inline sidebar-post mt-4"><i
                                    class="fas fa-sign-in-alt"></i><span>LOGIN</span></a>
                        </ul>
                        @endguest
                        @auth
                        @php
                        $id = Auth::id();
                        @endphp
                        <ul class="navbar-list">
                            <li class="navbar-item"><a class="navbar-link" href="/dashboard">My Ads</a></li>
                            <li class="navbar-item navbar-dropdown"><a class="navbar-link"
                                    href="/messages"><span>Messages</span><span>0</span></a></li>
                            <li class="navbar-item"><a class="navbar-link" href="/favourites">Favourites</a>
                            </li>
                            <li class="navbar-item"><a class="navbar-link" href="{{ url('profile-edit') }}/{{ $id }}">My
                                    profile</a>
                            </li>
                            <li class="navbar-item"><a class="navbar-link" href="javascript:;">My Membership</a>
                            </li>
                            <li class="navbar-item"><a class="navbar-link" href="/logout">Logout</a></li>

                        </ul>
                        @endauth
                    </div>
                </div>
                <div class="sidebar-footer">
                    <p>All Rights Reserved By <a href="javascript:;">JO-Trace</a></p>
                    <p>Developed By <a href="javascript:;">##########</a></p>
                </div>
            </div>
        </div>
    </aside>
    


    @yield('content')


    @if ("messages" != request()->segment(1))

    <nav class="mobile-nav">
        <div class="container">
            <div class="mobile-group"><a href="<?= URL::asset('/') ?>" class="mobile-widget"><i
                        class="fas fa-home"></i><span>home</span></a><a href="<?= URL::asset('/') ?>"
                    class="mobile-widget"><i class="fas fa-user"></i><span>join me</span></a><a
                    href="<?= URL::asset('/') ?>" class="mobile-widget plus-btn"><i class="fas fa-plus"></i><span>Ad
                        Post</span></a><a href="<?= URL::asset('/') ?>" class="mobile-widget"><i
                        class="fas fa-bell"></i><span>notify</span><sup>0</sup></a><a href="<?= URL::asset('/') ?>"
                    class="mobile-widget"><i class="fas fa-envelope"></i><span>message</span><sup>0</sup></a></div>
        </div>
    </nav>


    <footer class="footer-part">
        <div class="container">
            <div class="row newsletter">
                <div class="col-lg-6">
                    <div class="news-content">
                        <h2>Subscribe for Latest Offers</h2>
                        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laboriosam, aliquid reiciendis!
                            Exercitationem soluta provident non.</p>
                    </div>
                </div>
                <div class="col-lg-6">
                    <form class="news-form"><input type="text" placeholder="Enter Your Email Address"><button
                            class="btn btn-inline"><i class="fas fa-envelope"></i><span>Subscribe</span></button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="footer-content">
                        <h3>Contact Us</h3>
                        <ul class="footer-address">
                            <li><i class="fas fa-map-marker-alt"></i>
                                <p>1420 West Jalkuri Fatullah, <span>Narayanganj, BD</span></p>
                            </li>
                            <li><i class="fas fa-envelope"></i>
                                <p>support@classicads.com <span>info@classicads.com</span></p>
                            </li>
                            <li><i class="fas fa-phone-alt"></i>
                                <p>+8801838288389 <span>+8801941101915</span></p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="footer-content">
                        <h3>Quick Links</h3>
                        <ul class="footer-widget">
                            <li><a href="#">Store Location</a></li>
                            <li><a href="#">Orders Tracking</a></li>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Size Guide</a></li>
                            <li><a href="#">Faq</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="footer-content">
                        <h3>Information</h3>
                        <ul class="footer-widget">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Delivery System</a></li>
                            <li><a href="#">Secure Payment</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Sitemap</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="footer-info"><a href="#"><img src="<?= URL::asset('assets/') ?>/images/logo.png"
                                alt="logo"></a>
                        <ul class="footer-count">
                            <li>
                                <h5>929,238</h5>
                                <p>Registered Users</p>
                            </li>
                            <li>
                                <h5>242,789</h5>
                                <p>Community Ads</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer-card-content">
                        <div class="footer-payment"><a href="#"><img
                                    src="<?= URL::asset('assets/') ?>/images/pay-card/01.jpg" alt="01"></a><a
                                href="#"><img src="<?= URL::asset('assets/') ?>/images/pay-card/02.jpg" alt="02"></a><a
                                href="#"><img src="<?= URL::asset('assets/') ?>/images/pay-card/03.jpg" alt="03"></a><a
                                href="#"><img src="<?= URL::asset('assets/') ?>/images/pay-card/04.jpg" alt="04"></a>
                        </div>
                        <div class="footer-option"><button type="button" data-toggle="modal" data-target="#language"><i
                                    class="fas fa-globe"></i>English</button><button type="button" data-toggle="modal"
                                data-target="#currency"><i class="fas fa-dollar-sign"></i>USD</button></div>
                        <div class="footer-app"><a href="#"><img
                                    src="<?= URL::asset('assets/') ?>/images/play-store.png" alt="play-store"></a><a
                                href="#"><img src="<?= URL::asset('assets/') ?>/images/app-store.png"
                                    alt="app-store"></a></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-end">
            <div class="container">
                <div class="footer-end-content">
                    <p>All Copyrights Reserved &copy; 2021 - Developed by <a href="#">Mironcoder</a></p>
                    <ul class="footer-social">
                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                        <li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
                        <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                        <li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
                        <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                        <li><a href="#"><i class="fab fa-dribbble"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <div class="modal fade" id="currency">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>Choose a Currency</h4><button class="fas fa-times" data-dismiss="modal"></button>
                </div>
                <div class="modal-body"><button class="modal-link active">United States Doller (USD) -
                        $</button><button class="modal-link">Euro (EUR) - €</button><button class="modal-link">British
                        Pound (GBP) -
                        £</button><button class="modal-link">Australian Dollar (AUD) - A$</button><button
                        class="modal-link">Canadian Dollar (CAD) - C$</button></div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="language">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>Choose a Language</h4><button class="fas fa-times" data-dismiss="modal"></button>
                </div>
                <div class="modal-body"><button class="modal-link active">English</button><button
                        class="modal-link">bangali</button><button class="modal-link">arabic</button><button
                        class="modal-link">germany</button><button class="modal-link">spanish</button></div>
            </div>
        </div>
    </div>
    @endif
    <script src="{{ URL::asset('/assets/js/vendor/jquery-1.12.4.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/js/vendor/popper.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/js/vendor/bootstrap.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/js/vendor/slick.min.js') }} "></script>
    <script src="{{ URL::asset('/assets/js/custom/slick.js') }}"></script>
    <script src="{{ URL::asset('/assets/js/custom/main.js') }} "></script>


    @yield('foot')
</body>

</html>