<?php
use App\Models\Utils;
use Encore\Admin\Facades\Admin;

?>
<div class="box">
    <?php if(isset($title)): ?>
    <div class="box-header with-border">
        <h3 class="box-title"> <?php echo e($title, false); ?></h3>
    </div>
    <?php endif; ?>

    <div class="box-header with-border">
        <div class="pull-right">
            <?php echo $grid->renderExportButton(); ?>

            <?php echo $grid->renderCreateButton(); ?>

        </div>
        <span>
            <?php echo $grid->renderHeaderTools(); ?>

        </span>
    </div>

    <?php echo $grid->renderFilter(); ?>


    <!-- /.box-header -->
    <div class="box-body">

        <ul class="mailbox-attachments clearfix">
            <?php $__currentLoopData = $grid->rows(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <?php
            $link = admin_url("/products/".$row->column('id'));
            $link_buy = admin_url("/orders/create?id=".$row->column('id'));
            ?>

            <li>
                <?php
                $img = Utils::get_file_url($row->column('image_url'));
                ?>

                <a href="<?php echo e($link, false); ?>">
                    <span class="mailbox-attachment-icon has-img">
                        <img  src="<?php echo $img; ?>"/>
                    </span>
                 
                    <div class="mailbox-attachment-info">
                        <h2 class="product-price" style="font-size: 22px!important">
                            UGX <?php echo $row->column('price'); ?>

                        </h2>
                        <p class="product-title" style="color: black;">
                            AVAILABLE QTY: <?php echo $row->column('quantity'); ?> KGs
                        </p>
                        <p class="product-title" style="color: black;">
                            <?php echo $row->column('name'); ?>

                        </p>

                        <?Php
                        // use Encore\Admin\Facades\Admin;
                        $administrator_id = $row->column('administrator_id');
                        if($administrator_id == Admin::user()->id){  
                    ?>
                </a>

                <?php }?><br>
                <a class="btn btn-primary mt-2" href="<?php echo e($link_buy, false); ?>">BUY NOW</a><br>
    </div>


    </li>

    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </ul>

</div>
<div class="box-footer clearfix">
    <?php echo $grid->paginator(); ?>

</div>
<!-- /.box-body -->
</div><?php /**PATH C:\Users\HP ENVY\Desktop\stts\resources\views/admin/grid/card.blade.php ENDPATH**/ ?>