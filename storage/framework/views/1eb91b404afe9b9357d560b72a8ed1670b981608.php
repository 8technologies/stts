<style>
  @media  print {
  .no-print {
    display: none;
  }
}

</style>
<!-- Main Footer -->
<footer class="main-footer no-print">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
        <?php if(config('admin.show_environment')): ?>
            <strong>Env</strong>&nbsp;&nbsp; <?php echo config('app.env'); ?>

        <?php endif; ?>

        &nbsp;&nbsp;&nbsp;&nbsp;

        <?php if(config('admin.show_version')): ?>
        <strong>Version</strong>&nbsp;&nbsp; <?php echo \Encore\Admin\Admin::VERSION; ?>

        <?php endif; ?>

    </div>
    <!-- Default to the left -->
    <strong >Developed by <a href="https://8technologies.net" target="_blank">8technologies.net</a></strong>
</footer>
<?php /**PATH C:\Users\Cole\Desktop\stts\vendor\encore\laravel-admin\src/../resources/views/partials/footer.blade.php ENDPATH**/ ?>