<li class="dropdown notifications-menu">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
  <i class="fa fa-bell-o"></i>
  <?php if(count($notifications) > 0): ?>
  <span class="label label-danger" style="padding-bottom: 3px;  "><?php echo e(count($notifications), false); ?></span>
  <?php endif; ?>
</a>
<ul class="dropdown-menu">
  <li class="header">You have <?php echo e(count($notifications), false); ?> pending tasks.</li>
  <li>
    <!-- inner menu: contains the actual data -->
    <ul class="menu">
       
      <?php $__currentLoopData = $notifications; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $n): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?> 
      <li >
        <a id="notify" href="<?php echo e($n->form_link, false); ?>" title="<?php echo e($n->message, false); ?>">
          <?php if($n->receiver_id == null): ?>
          <i class="fa fa-users text-success"></i> 
          <?php else: ?>
          <i class="fa fa-user text-success"></i> 
          <?php endif; ?>
          <?php echo e($n->message, false); ?>

        </a>
      </li>
      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </ul>
  </li>
</ul>
</li>
<!-- script to change the color of the link once it has been clicked -->
<script>
  $(document).ready(function(){
    $('#notify').click(function(){
      $(this).css('color', '#8B837E');
    });
  });
</script><?php /**PATH C:\Users\Cole\Desktop\8Projects\stts\resources\views/notification-bell.blade.php ENDPATH**/ ?>