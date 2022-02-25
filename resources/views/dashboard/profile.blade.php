@php
$id = Auth::id();
$user = Auth::user();
if(!$user->profile){
header("Location: ".route('complete_profile_request'));
die();
}
if(!$user->profile->status){
header("Location: ".route('complete_profile_request'));
die();
}
if(!$user->profile->status != "active"){
header("Location: ".route('complete_profile_request'));
die();
}

@endphp
@extends('layouts.layout')

@section('title', 'Page Title')

@section('head')
<link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/my-ads.css') }}">
@endsection

@section('content')
@php
use Illuminate\Support\Facades\Auth;
use App\Models\Product;
$user_id = Auth::id();
$products = Product::where('user_id', $user_id)->get();
@endphp


@include('layouts.dashboard-header');
<section class="myads-part">
    <div class="container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8 ">
                    <div class="card dash-header-card pt-0">
                        <div class="card-body text-center">

                            <img src="<?= URL::asset('assets/') ?>/images/empty-box.png" width="120"
                                alt="empty-box.png">

                            <h2 class="h4 text-center mt-4">You don't have any service yet.</h2>
                            <p class="text-center">Click the "Post servicee" now button to post your service.</p>
                            <a href="<?= URL::asset('/post-ad') ?>" class="btn btn-inline mt-4 mb-2 post-btn"><i
                                    class="fas fa-plus-circle"></i><span>post your service</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>




        <div class="row">
            @foreach ($products as $item)
            <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                <div class="product-card">
                    <div class="product-media">
                        <div class="product-img"><img src="{{$item->get_thumbnail()}}" alt="{{$item->get_thumbnail()}}">
                        </div>
                        <div class="cross-vertical-badge product-badge"><i class="fas fa-fire"></i><span>top
                                niche</span></div>
                        <div class="product-type"><span class="flat-badge booking">new</span></div>
                        <ul class="product-action">
                            <li class="view"><i class="fas fa-eye"></i><span>264</span></li>
                            <li class="click"><i class="fas fa-mouse"></i><span>134</span></li>
                            <li class="rating"><i class="fas fa-star"></i><span>4.5/7</span></li>
                        </ul>
                    </div>
                    <div class="product-content">
                        <ol class="breadcrumb product-category">
                            <li><i class="fas fa-tags"></i></li>
                            <li class="breadcrumb-item"><a href="#">Luxury</a></li>
                            <li class="breadcrumb-item active" aria-current="page">resort</li>
                        </ol>
                        <h5 class="product-title"><a href="ad-details-left.html">{{ $item->name }}</a></h5>
                        <div class="product-meta"><span><i
                                    class="fas fa-map-marker-alt"></i>{{ $item->category->name }},
                                {{ $item->category->name }}</span><span><i
                                    class="fas fa-clock"></i>{{ $item->updated_at }}</span></div>
                        <div class="product-info">
                            <h5 class="product-price">${{ $item->price }}<span>/starting price</span></h5>
                            <div class="product-btn">
                                <a href="#" title="Delete" class="fas fa-trash text-danger"></a><button type="button"
                                    title="Edit" class="far fa-edit"></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>

    </div>
</section>
@endsection