<li class="dropdown notifications-menu">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
  <i class="fa fa-bell-o"></i>
  @if (count($notifications) > 0)
  <span class="label label-danger" style="padding-bottom: 3px;  ">{{ count($notifications) }}</span>
  @endif
</a>
<ul class="dropdown-menu">
  <li class="header">You have {{ count($notifications) }} pending tasks.</li>
  <li>
    <!-- inner menu: contains the actual data -->
    <ul class="menu">
       
      @foreach ($notifications as $n) 
      <li >
        <a id="notify" href="{{ $n->form_link }}" title="{{ $n->message }}">
          @if ($n->receiver_id == null)
          <i class="fa fa-users text-success"></i> 
          @else
          <i class="fa fa-user text-success"></i> 
          @endif
          {{ $n->message }}
        </a>
      </li>
      @endforeach
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
</script>