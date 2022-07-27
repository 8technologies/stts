<body>
 

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

    <!-- <link href="{{ asset ('assets/new_dash/css/bootstrap.min.css') }}" rel="stylesheet" /> -->
    <link href="{{ asset ('assets/new_dash/css/light-bootstrap-dashboard.css') }}" rel="stylesheet" />

    <link href="{{ asset ('assets/new_dash/css/demo.css') }}" rel="stylesheet" />
    
    <!-- <div class="wrapper"> -->

    <div class="row">
        <div class="col-md-6">
            <div class="card ">
                @include('admin.chartjs.pie')  
            </div>
        </div>

        <div class="col-md-6">
            <div class="card ">
                @include('admin.chartjs.bar')
                
                <div class="card-footer ">
                    <div class="legend">
                        <i class="fa fa-circle text-success"></i> Products
                        <i class="fa fa-circle text-info"></i> Orders
                        <i class="fa fa-circle text-warning"></i> Pre Orders
                        <i class="fa fa-circle text-danger"></i> Quotations
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="card ">
                <div class="card-header ">
                    <h4 class="card-title">Seed Stock Line Graph</h4>
                </div>
                <div class="card-body ">
                    @include('admin.chartjs.line')  
                </div>
                <div class="card-footer ">
                    <div class="legend">
                        <i class="fa fa-circle text-success"></i> Stock examination
                        <i class="fa fa-circle text-warning"></i> My Stock
                        <i class="fa fa-circle text-danger"></i> Marketable seed
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card  card-tasks">
                <div class="card-header ">
                    <h4 class="card-title">Tasks</h4>
                    <p class="card-category">Backend development</p>
                </div>
                <div class="card-body ">
                    @include('admin::dashboard.dash_table')  
                </div>
                <div class="card-footer ">
                    <hr>
                    <div class="stats">
                        <i class="now-ui-icons loader_refresh spin"></i> Updated 3 minutes ago
                    </div>
                </div>
            </div>
        </div>
    </div>
     
<script src="{{ asset ('assets/new_dash/js/core/jquery.3.2.1.min.js') }}" type="text/javascript"></script>
<script src="{{ asset ('assets/new_dash/js/core/popper.min.js') }}" type="text/javascript"></script>
<script src="{{ asset ('assets/new_dash/js/core/bootstrap.min.js') }}" type="text/javascript"></script>

<script src="{{ asset ('assets/new_dash/js/plugins/bootstrap-switch.js') }}" type="text/javascript"></script>

<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->

<script src="{{ asset ('assets/new_dash/js/plugins/chartist.min.js') }}" type="text/javascript"></script>

<script src="{{ asset ('assets/new_dash/js/plugins/bootstrap-notify.js') }}" type="text/javascript"></script>

<script src="{{ asset ('assets/new_dash/js/light-bootstrap-dashboard.js ') }}" type="text/javascript"></script>

<script src="{{ asset ('assets/new_dash/js/demo.js') }}" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function() {
        demo.initDashboardPageCharts();
        demo.showNotification();
    });
</script>

</body> 