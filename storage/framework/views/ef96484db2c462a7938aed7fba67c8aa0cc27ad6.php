<li class="dropdown messages-menu">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-language"></i>
    </a>
    <ul class="dropdown-menu">
        <li>
            <!-- inner menu: contains the actual data -->
            <ul class="menu">

                <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <li><!-- start message -->
                        <a class="language text-dark" href="#" data-id="<?php echo e($key, false); ?>">
                            <?php echo e($language, false); ?>

                            <?php if($key == $current): ?>
                                <i class="fa fa-check pull-right"></i>
                            <?php endif; ?>
                        </a>
                    </li>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </ul>
        </li>
    </ul>
</li>
<script>
    $.ajaxSetup({headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}});

    $(".language").click(function () {
        let id = $(this).data('id');
        $.post("<?php echo e(admin_url('/locale'), false); ?>",{_token:LA.token, locale: id}, function () {
            location.reload();
        })
    })
</script>
<?php /**PATH C:\Users\Cole\Desktop\stts\vendor\laravel-admin-extensions\multi-language\src/../resources/views/language-menu.blade.php ENDPATH**/ ?>