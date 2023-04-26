<div class="box box-default">
    <div class="box-header with-border">
        
    <?php 
        use Encore\Admin\Facades\Admin;
        
        if (Admin::user()->isRole('super-admin') || Admin::user()->isRole('admin')) { ?>
            <h3 class="box-title">Pre-Stock Examination- (General)</h3>
        <?php } else { ?>
            <h3 class="box-title">Pre-Stock Examination</h3>
        <?php } ?>

        <!-- <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
        </div> -->
    </div>


    <!-- /.box-header -->
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
            
            </table>
        </div>
        <!-- /.table-responsive -->
    </div>
    <!-- /.box-body -->

    <?php } ?>
</div>

