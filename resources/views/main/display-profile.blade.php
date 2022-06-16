@php
use App\Models\Product;
use App\Models\Profile;
use App\Models\Utils;


$slug = request()->segment(1);
$pro = Product::where('slug', "oppo-a5-2020-432-used")->firstOrFail();
$images = $pro->get_images();
$attributes = json_decode($pro->attributes);
$url = $_SERVER['REQUEST_URI'];

$profile = Profile::where('username', $slug)->firstOrFail();
$products = Product::where('user_id',$profile->user_id)->get();
//$products = Product::where('user_id',2)->get();

$imgs = json_decode($profile->profile_photo);
$profile_pic = "assets/images/avatar/03.jpg";
if($imgs->src){
    $profile_pic = Utils::get_file_url($imgs->src);
}
@endphp
@extends('layouts.layout')

@section('title', $pro->name)

@section('head')
<link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/ad-details.css') }}">
@endsection

@section('content')


<section class="inner-section ad-details-part pt-3 mb-0 pb-0 ">
    <div class="container mt-3">

        <div class="row" z>
            <div class="col-lg-8 ">

                <div class="row ad-standard">
                    
                    @if (!$products)
                    <div class="card w-100">
                        <div class="card-body">
                            <h3>No product uploaded in this shop.</h3>
                        </div>
                    </div>
                    @endif

                    @foreach ($products as $item) 
                    <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 mb-2">
                        <x-product2  :item="$item" />
                    </div>
                    @endforeach

                </div>



            </div>

            <div class="modal fade" id="number">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>Contact Phone Number</h4><button class="fas fa-times" data-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <h3 class="modal-number">{{$profile->phone_number}}</h3>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">

                <div class="common-card">
                    <div class="card-header">
                        <h1 class="card-title h5">{{ $profile->company_name }}</h1>
                    </div>
                    <div class="ad-details-author">
                        <a href="mailto:{{$profile->email}}" class="author-img active"><img width="100" height="100"
                                src="{{$profile_pic}}" alt="avatar"></a>
                        <div class="author-meta">
                            <h4><a href="/{{$pro->user->profile->username}}">
                                    {{$pro->user->profile->first_name}}
                                    {{$pro->user->profile->last_name}}
                                </a></h4>
                            <h5>joined since: {{$pro->user->created_at->diffForHumans()}}</h5>
                        </div>
                        <div class="author-widget">

                            <a href="mailto:{{$profile->email}}" title="Message" class="fas fa-envelope"></a><button
                                type="button" title="Follow" class="follow fas fa-heart"></button><button type="button"
                                title="Number" class="fas fa-phone" data-toggle="modal"
                                data-target="#number"></button><button type="button" title="Share"
                                class="fas fa-share-alt" data-toggle="modal" data-target="#profile-share"></button>
                        </div>
                        <ul class="author-list">
                            <li>
                                <h6>Phone number</h6>
                                <p>{{$profile->phone_number}}</p>
                            </li>
                            <li>
                                <h6>Email address</h6>
                                <p>{{$profile->email}}</p>
                            </li>
                            <li>
                                <h6>Location</h6>
                                <p>{{$profile->location}}</p>
                            </li>
                            <li>
                                <h6>Services</h6>
                                <p>{{$profile->services}}</p>
                            </li>
                            <li>
                                <h6>Facebook</h6>
                                <p><a href="{{$profile->facebook}}" target="_blank">Facebook</a></p>
                            </li>
                            @if ($profile->twitter)
                            <li>
                                <h6>Twitter</h6>
                                <p><a href="{{$profile->twitter}}" target="_blank">Twitter</a></p>
                            </li>
                            @endif
                            @if ($profile->whatsapp)
                            <li>
                                <h6>Whatsapp</h6>
                                <p><a href="{{$profile->whatsapp}}" target="_blank">Whatsapp</a></p>
                            </li>
                            @endif
                        </ul>
                        <h6 class="mt-3 mb-2">About</h6>
                        <p class="text-left">{{$profile->about}}</p>
                    </div>
                </div>
                <div class="common-card">
                    <div class="card-header">
                        <h5 class="card-title">opening hour</h5>
                    </div>
                    <ul class="ad-details-opening">
                        <li>
                            <h6>Saturday</h6>
                            <p>09:00am - 05:00pm</p>
                        </li>
                        <li>
                            <h6>Sunday</h6>
                            <p>09:00am - 05:00pm</p>
                        </li>
                        <li>
                            <h6>monday</h6>
                            <p>09:00am - 05:00pm</p>
                        </li>
                        <li>
                            <h6>tuesday</h6>
                            <p>09:00am - 05:00pm</p>
                        </li>
                        <li>
                            <h6>wednesday</h6>
                            <p>09:00am - 05:00pm</p>
                        </li>
                        <li>
                            <h6>thursday</h6>
                            <p>09:00am - 05:00pm</p>
                        </li>
                        <li>
                            <h6>friday</h6>
                            <p>closed</p>
                        </li>
                    </ul>
                </div>
                <div class="common-card">
                    <div class="card-header">
                        <h5 class="card-title">area map</h5>
                    </div><iframe class="ad-details-map"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3654.3406974350205!2d90.48469931445422!3d23.663771197998262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b0d5983f048d%3A0x754f30c82bcad3cd!2sJalkuri%20Bus%20Stop!5e0!3m2!1sen!2sbd!4v1610539261654!5m2!1sen!2sbd"></iframe>
                </div>
                <div class="common-card">
                    <div class="card-header">
                        <h5 class="card-title">safety tips</h5>
                    </div>
                    <div class="ad-details-safety">
                        <p>Check the item before you buy</p>
                        <p>Pay only after collecting item</p>
                        <p>Beware of unrealistic offers</p>
                        <p>Meet seller at a safe location</p>
                        <p>Do not make an abrupt decision</p>
                        <p>Be honest with the ad you post</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@php
$related_products = Product::where('category_id', $pro->category_id)->get();
@endphp





@endsection