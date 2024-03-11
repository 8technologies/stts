<?php $__env->startComponent('mail::message'); ?>
# Hello

<p> <?php echo e($message, false); ?></p>

<?php $__env->startComponent('mail::button', ['url' => $link, 'color' => 'green', ]); ?>
View Form
<?php echo $__env->renderComponent(); ?>

Thanks,<br>
<?php echo e(config('app.name'), false); ?>

<?php echo $__env->renderComponent(); ?><?php /**PATH C:\Users\Cole\Desktop\stts\resources\views/emails/form_notifications.blade.php ENDPATH**/ ?>