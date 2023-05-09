<li class="dropdown notifications-menu">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
        <i class="fa fa-language"></i>
    </a>
    <ul class="dropdown-menu">
        <li>
            <!-- inner menu: contains the actual data -->
            <ul class="menu">
                <li>
                    <a href="<?php echo e(url('change-lang')."?change_lang=en", false); ?>" title="Switch to English">
                        <i class="fa fa-check text-success"></i>
                        English
                    </a>
                </li>
                <li>
                    <a href="<?php echo e(url('change-lang')."?change_lang=fr", false); ?>" title="Switch to English">
                        <i class="fa fa-check text-success"></i>
                        French
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</li>
<!-- script to change the color of the link once it has been clicked -->
<script>
    $(document).ready(function() {
        $('#notify').click(function() {
            $(this).css('color', '#8B837E');
        });
    });
</script>
<?php /**PATH C:\xampp\htdocs\stts\resources\views/langauge.blade.php ENDPATH**/ ?>