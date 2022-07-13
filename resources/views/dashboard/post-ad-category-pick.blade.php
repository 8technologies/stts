@php
$id = Auth::id();
$user = Auth::user();
$status = $user->account_status();
if($status != "active"){
header("Location: ".route('complete_profile_request'));
die();
}

use App\Models\category;
$cats = category::where("parent",0)->get();
@endphp

@extends('layouts.layout')

@section('title', 'Page Title')

@section('head')
<link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/ad-post.css') }}">
@endsection

@section('content')
@include('layouts.dashboard-header');
<section class="adpost-part">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 ">
                <form class="adpost-form">
                    <div class="adpost-card pb-5">
                        <div class="adpost-title">
                            <h3 class="text-secondary text-center mb-3">STEP 1/2</h3>
                            <h3>Select Ad category</h3>
                        </div>
                        <ul class="adpost-plan-list">


                            <div class="accordion " id="accordionExample">

                                @foreach ($cats as $item)

                                <div class="card">
                                    <div class="card-header" id="_{{$item->id}}">
                                        <h2 class="mb-0">
                                            <button class="btn  btn-block text-left border-0 pt-3 pb-0" type="button"
                                                data-toggle="collapse" data-target="#__{{$item->id}}"
                                                aria-expanded="true" aria-controls="__{{$item->id}}">
                                                <img width="25" height="25" src="storage/{{$item->image}}" alt="">
                                                {{$item->name}}
                                            </button>
                                        </h2>
                                    </div>

                                    <div id="__{{$item->id}}" class="collapse" aria-labelledby="_{{$item->id}}"
                                        data-parent="#accordionExample">
                                        <div class="card-body pb-0">
                                            @foreach ($item->sub_categories as $sub_cat)
                                            <div class="border-bottom pb-2 pt-1">
                                                <a href="{{ url("post-ad/".$sub_cat->slug) }}"
                                                    ><h6>{{ $sub_cat->name }} </h6>
                                                </a>
                                            </div> 
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                                @endforeach

                            </div>

 
                        </ul>
                    </div>

                </form>
            </div>
        </div>
    </div>
</section>

@endsection