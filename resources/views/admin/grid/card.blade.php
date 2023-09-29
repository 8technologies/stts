@php
use App\Models\Utils;
use Encore\Admin\Facades\Admin;
@endphp

<div class="box">
    @if(isset($title))
    <div class="box-header with-border">
        <h3 class="box-title">{{ $title }}</h3>
    </div>
    @endif

    <div class="box-header with-border">
        <div class="pull-right">
            {!! $grid->renderExportButton() !!}
            {!! $grid->renderCreateButton() !!}
        </div>
        <span>
            {!! $grid->renderHeaderTools() !!}
        </span>
    </div>

    {!! $grid->renderFilter() !!}

    <!-- /.box-header -->
    <div class="box-body">
        <div class="row">
            @foreach($grid->rows() as $row)
                @php
                $link = admin_url("/products/".$row->column('id'));
                $link_buy = admin_url("/orders/create?id=".$row->column('id'));
                $img = Utils::get_file_url($row->column('image_url'));
                $administrator_id = $row->column('administrator_id');
                @endphp

                <div class="col-md-4"> <!-- Adjust the column width as needed -->
                    <div class="card">
                        <a href="{{$link}}">
                            <img src="{!! $img !!}" class="card-img-top" alt="Product Image">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">{{ $row->column('name') }}</h5>
                            <p class="card-text"><i>In stock: {{ $row->column('available_stock') }} bags</i></p>
                            @if($administrator_id == Admin::user()->id)
                                <!-- Add any additional content for authorized users here -->
                            @endif
                            @if($row->column('available_stock') > 0)
                                <a class="btn btn-primary" href="{{ $link_buy }}">BUY NOW</a>
                            @else
                                <a class="btn btn-primary disabled">OUT OF STOCK</a>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>

    <div class="box-footer clearfix">
        {!! $grid->paginator() !!}
    </div>
</div>
