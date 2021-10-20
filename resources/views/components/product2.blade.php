<div class="product-card standard">
    <div class="product-media">
        <div class="product-img"><img src={{$item->get_thumbnail()}} alt="product"></div>
        <div class="cross-vertical-badge product-badge"><i class="fas fa-clipboard-check"></i><span>recommend</span>
        </div>
    </div>
    <div class="product-content">
        <ol class="breadcrumb product-category">
            <li><i class="fas fa-tags"></i></li>
            <li class="breadcrumb-item"><a href="#">{{$item->category->name}}</a></li>
        </ol>
        <h5 class="product-title"><a href="<?= URL::asset('/') ?>{{$item->slug}}">{{$item->name}}</a></h5>
        <div class="product-meta"><span><i class="fas fa-map-marker-alt"></i>{{$item->country->name}},
                {{$item->city->name}}</span><span><i
                    class="fas fa-clock"></i>{{$item->created_at->diffForHumans()}}</span></div>
        <div class="product-info">
            <h5 class="product-price">${{number_format($item->price)}}<span>/@if ($item->fixed_price)
                    Fixed
                    @else
                    Negotiable
                    @endif</span></h5>
            <div class="product-btn"><a href="javascript:;" title="Compare" class="fas fa-compress"></a><button
                    type="button" title="Wishlist" class="far fa-heart"></button></div>
        </div>
    </div>
</div>