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
                <th>Form Entry</th>
                <th>Count</th>
                <th>Status</th>
            </tr>

                @foreach($non_admin_envs_data as $env)
                <tr>
                    <td>{{ $env['name'] }}</td>
                    <td>{{ $env['value'] }}</td>
                    <td>####</td>
                </tr>
                @endforeach
            
            
            </table>
        </div>
        <!-- /.table-responsive -->
    </div>
    <!-- /.box-body -->

    <?php } ?>
</div>
