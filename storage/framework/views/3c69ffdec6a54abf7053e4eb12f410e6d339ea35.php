<div class="form-group">
    <label><?php echo e($label, false); ?></label>

    <select class="form-control <?php echo e($class, false); ?>" style="width: 100%;" name="<?php echo e($name, false); ?>" <?php echo $attributes; ?> >

        <option value=""></option>
        <?php $__currentLoopData = $options; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $select => $option): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <option value="<?php echo e($select, false); ?>" <?php echo e($select == old($column, $value) ?'selected':'', false); ?>><?php echo e($option, false); ?></option>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </select>
    <?php echo $__env->make('admin::actions.form.help-block', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
</div>

<?php /**PATH C:\Users\Cole\Desktop\stts\vendor\encore\laravel-admin\src/../resources/views/actions/form/select.blade.php ENDPATH**/ ?>