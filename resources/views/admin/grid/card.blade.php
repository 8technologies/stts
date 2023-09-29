@php
use App\Models\Utils;
use Encore\Admin\Facades\Admin;

@endphp
<div class="box">
    @if(isset($title))
    <div class="box-header with-border">
        <h3 class="box-title"> {{ $title }}</h3>
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

        <ul class="mailbox-attachments clearfix">
            @foreach($grid->rows() as $row)
            @php
            $link = admin_url("/products/".$row->column('id'));
            $link_buy = admin_url("/orders/create?id=".$row->column('id'));
            @endphp

            <li>
                @php
                $img = Utils::get_file_url($row->column('image_url'));
                @endphp

                <a href="{{$link}}">
                    <span class="mailbox-attachment-icon has-img" style="height:125px">
                        <img  src="{!! $img !!}" width="90px" height="90px"/>
                    </span>
                 
                    <div class="mailbox-attachment-info">
                        
                        <p class="product-title" style="color: black;">
                            {!! $row->column('name') !!}
                        </p>
                       
                        <span class="product-title" style="color: black;">
                            <i>In stock: {!! $row->column('available_stock') !!} bags</i>
                        </span>

                        <?Php
                        // use Encore\Admin\Facades\Admin;
                        $administrator_id = $row->column('administrator_id');
                        if($administrator_id == Admin::user()->id){  
                    ?>
                </a>

                <?php }?><br>
                @if($row->column('available_stock') > 0)
                    <a class="btn btn-primary mt-2" href="{{ $link_buy }}">BUY NOW</a><br>
                @else
                    <a class="btn btn-primary mt-2" disabled>OUT OF STOCK</a><br>
                @endif

    </div>


    </li>

    @endforeach
    </ul>

</div>
<div class="box-footer clearfix">
    {!! $grid->paginator() !!}
</div>
<!-- /.box-body -->
</div>