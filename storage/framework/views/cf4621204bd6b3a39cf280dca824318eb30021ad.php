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
      <li>
        <a id="notify" href="<?php echo e($n->link, false); ?>" title="<?php echo e($n->message, false); ?>">
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
</li><?php /**PATH C:\Users\HP ENVY\Desktop\stts\resources\views/notification-bell.blade.php ENDPATH**/ ?>