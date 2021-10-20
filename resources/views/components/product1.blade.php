<div class="product-card">
    <div class="product-media">
        <div class="product-img"><img src="{{$item->get_thumbnail()}}" alt="product"></div>
        <div class="product-type"><span class="flat-badge sale">sale</span></div>
        <ul class="product-action">
            <li class="view"><i class="fas fa-eye"></i><span>264</span></li>
            <li class="click"><i class="fas fa-mouse"></i><span>134</span></li>
            <li class="rating"><i class="fas fa-star"></i><span>4.5/7</span></li>
        </ul>
    </div>
    <div class="product-content">
        <ol class="breadcrumb product-category">
            <li><i class="fas fa-tags"></i></li>
            <li class="breadcrumb-item"><a href="#">{{$item->category->name}}</a></li>
        </ol>
        <h5 class="product-title"><a href="<?= URL::asset('/') ?>{{$item->slug}}">{{$item->get_name_short()}}</a></h5>
        <div class="product-meta"><span><i class="fas fa-map-marker-alt"></i>{{$item->country->name}},
                {{$item->city->name}}</span><span><i
                    class="fas fa-clock"></i>{{$item->created_at->diffForHumans()}}</span></div>
        <div class="product-info">
            <h5 class="product-price">${{ number_format($item->price,0) }}<span>/@if ($item->fixed_price)
                    Fixed
                    @else
                    Negotiable
                    @endif</span></h5>
            <div class="product-btn">
                <a href="<?= URL::asset('/') ?>{{$item->slug}}" title="Compare" class="fas fa-compress"></a><button type="button"
                    title="Wishlist" class="far fa-heart"></button>
            </div>
        </div>
    </div>
</div>