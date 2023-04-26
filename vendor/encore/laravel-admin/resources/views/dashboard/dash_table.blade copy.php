<div>
    
        
    <?php 
        use Encore\Admin\Facades\Admin;
        
        if (Admin::user()->isRole('super-admin') || Admin::user()->isRole('admin')) { ?>
            <h3 class="box-title">At a glance- (General activity)</h3>
        <?php } else { ?>
            <h3 class="box-title">At a glance- (Your activity)</h3>
        <?php } ?>

    <?php 
    // use Encore\Admin\Facades\Admin;
    
    if (Admin::user()->isRole('super-admin') || Admin::user()->isRole('admin')) { ?>
    <div class="box-body">
        <div class="table-responsive">
            <table class="table table-striped">

                @foreach($envs as $env)
                <tr>
                    <td>{{ $env['name'] }}</td>
                    <td>{{ $env['value'] }}</td>
                </tr>
                @endforeach
            
            </table>
        </div>
        <!-- /.table-responsive -->
    </div>
    <!-- /.box-body 1-->

    <?php } else { ?>

    <!-- /.box-header 2 -->
    <div class="box-body">
        <div class="table-responsive">
            <table class="table table-striped">

                @foreach($non_admin_envs as $env)
                <tr>
                    <td>{{ $env['name'] }}</td>
                    <td>{{ $env['value'] }}</td>
                </tr>
                @endforeach

                <br>
            <tr>
                <th>QA Form</th>
                <th>Count</th>
                <th>Status</th>
            </tr>

                    @foreach($non_admin_envs_data as $env)
                <tr>
                        <td>{{ $env['name'] }}</td>
                        <td>{{ $env['value'] }}</td>
                    <td>

                        <!-- @if ($env['name'] == 'Import Permits:')
                            {!! $import_status !!}
                        @elseif ($env['name']=='Export Permits:')
                            {!! $export_permit_status !!}   
                        @elseif ($env['name']=='Planting returns:')
                            {!! $planting_return_status  !!} 
                        @elseif ($env['name']=='SR10 Forms:')
                            {!! $sr10_status !!}  
                        @elseif ($env['name']=='QDS Forms::')
                            {!! $qds_status !!}  
                        @elseif ($env['name']=='Seed Labs:')
                            {!! $seedlab_status !!}  
                        @elseif ($env['name']=='Stock Examination Requests:')
                            {!! $form_stock_er_status !!}  
                        @elseif ($env['name']=='Orders:')
                            {!! $order_status !!}  
                        @elseif ($env['name']=='PreOrders:')
                            {!! $pre_order_status !!}  
                        @elseif ($env['name']=='Quotations:')
                            {!! $quotation_status !!}  
                        @endif -->
                        
                    </td>
                </tr>
                    @endforeach
            
            
            </table>
        </div>
        <!-- /.table-responsive -->
    </div>
    <!-- /.box-body -->

    <?php } ?>
</div>

