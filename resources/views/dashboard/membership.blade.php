@extends('layouts.layout')

@section('title', 'Page Title')

@section('head')
    <link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/ad-post.css') }}">
@endsection

@section('content') 
    <section class="adpost-part">
        <div class="container">
           <h1>Membership section</h1>
        </div>
    </section>
@endsection
