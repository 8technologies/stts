<div>

    <?php

    // use Encore\Admin\Facades\Admin;
    
    if (Admin::user()->isRole('super-admin') || Admin::user()->isRole('admin')) { ?>
    <div class="box-body">
        <div class="table-responsive">
            <table class="table table-striped">

                <?php $__currentLoopData = $envs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $env): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr>
                    <td><?php echo e($env['name'], false); ?></td>
                    <td><?php echo e($env['value'], false); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            
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

                <?php $__currentLoopData = $non_admin_envs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $env): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr>
                    <td><?php echo e($env['name'], false); ?></td>
                    <td><?php echo e($env['value'], false); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                <br>

                
            </table>

        </div>

        <div class="table-responsive">
            <table class="table table-striped"> 
            <tr>
                <th>Type of Form</th>
                <th>Count</th>
                <!-- <th>Status</th> -->
            </tr>

                    <?php $__currentLoopData = $non_admin_envs_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $env): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr>
                    <td><?php echo e($env['name'], false); ?></td>
                    <td><?php echo e($env['value'], false); ?></td>
                    <!-- <td>####</td> -->
                </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            
            </table>
        </div>
        <!-- /.table-responsive -->
    </div>
    <!-- /.box-body -->

    <?php } ?>
</div>
<?php /**PATH C:\Users\HP ENVY\Desktop\stts\vendor\encore\laravel-admin\src/../resources/views/dashboard/dash_table.blade.php ENDPATH**/ ?>