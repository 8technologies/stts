<div class="feature-card "><a href="{{url($item->slug)}}" class="feature-img"><img src="{{$item->get_thumbnail()}}"
            alt="feature"></a>
    <div class="feature-content p-2 pl-3 pr-3">
        <ol class="breadcrumb feature-category mb-0 mt-0">

            <li class="breadcrumb-item"><a href="{{url($item->category->slug)}}">{{$item->category->name}}</a></li>
        </ol>
        <h3 class="feature-title h5 mb-0 mt-0"><a href="{{url($item->slug)}}">{{$item->name}}</a></h3>
        <div class="feature-meta"><span class="feature-price">UGX.
                {{number_format($item->price)}}<small>/Negotiable</small></span><span class="feature-time"><i
                    class="fas fa-clock"></i>{{$item->created_at->diffForHumans()}}</span>
        </div>
    </div>
</div>