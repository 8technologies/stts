<?php
use App\Models\Utils;
use Encore\Admin\Facades\Admin;
?>

<style>
    .card {
        padding: 15px; /* Add padding around each card */
    }

    .row {
        margin-left: -15px;
        margin-right: -15px;
    }

    .col-md-4 {
        padding: 15px; /* Add space between columns */
    }

    .card-img-top {
        width: 150px; /* Set your desired size for both width and height */
        height: 150px; /* Set your desired size for both width and height */
        object-fit: cover; /* Ensure the image covers the square without distortion */
    }
</style>

<div class="box">
    <?php if(isset($title)): ?>
    <div class="box-header with-border">
        <h3 class="box-title"><?php echo e($title, false); ?></h3>
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
        <div class="row">
            <?php $__currentLoopData = $grid->rows(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php
                $link = admin_url("/products/".$row->column('id'));
                $link_buy = admin_url("/orders/create?id=".$row->column('id'));
                $img = Utils::get_file_url($row->column('image_url'));
                $administrator_id = $row->column('administrator_id');
                $seller = \App\Models\User::find($administrator_id)->name;
                ?>

                <div class="col-md-4"> <!-- Adjust the column width as needed -->
                    <div class="card">
                        <a href="<?php echo e($link, false); ?>">
                            <img src="<?php echo $img; ?>" class="card-img-top" alt="Product Image">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title"><?php echo e($row->column('name'), false); ?></h5>
                            <p class="card-text"><i>Seller: <?php echo e($seller, false); ?></i></p>
                            <p class="card-text"><i>In stock: <?php echo e($row->column('available_stock'), false); ?> bags</i></p>
                            <?php if($administrator_id == Admin::user()->id): ?>
                                <!-- Add any additional content for authorized users here -->
                            <?php endif; ?>
                            <?php if($row->column('available_stock') > 0): ?>
                                <a class="btn btn-primary" href="<?php echo e($link_buy, false); ?>">BUY NOW</a>
                            <?php else: ?>
                                <a class="btn btn-primary disabled">OUT OF STOCK</a>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>

    <div class="box-footer clearfix">
        <?php echo $grid->paginator(); ?>

    </div>
</div>
<?php /**PATH C:\Users\Cole\Desktop\8Projects\stts\resources\views/admin/grid/card.blade.php ENDPATH**/ ?>