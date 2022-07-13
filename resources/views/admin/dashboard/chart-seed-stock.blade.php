<?php 
use App\Models\Crop;
use App\Models\StockRecord;

      $crops = Crop::all();
        $labels = [];
        $values = [];
        foreach ($crops as $key => $seed) {
            $seed->quantity = 0;
            $labels[] = Str::limit($seed->name,10,"..");

            foreach ($seed->crop_varieties as $_key => $variety) {
                $marketable_seeds = StockRecord::where("crop_variety_id", $variety->id)->get();
                foreach ($marketable_seeds as $__key => $val) {
                    $seed->quantity += $val->quantity;
                }
            }
            $values[] = $seed->quantity;
        }
?>
<canvas id="chart-seed-stock" style="width: 100%;"></canvas>
<script>
    $(function () {

    function randomScalingFactor() {
        return Math.floor(Math.random() * 100)
    }

    window.chartColors = {
        red: 'rgb(255, 99, 132)',
        orange: 'rgb(255, 159, 64)',
        yellow: 'rgb(255, 205, 86)',
        green: 'rgb(75, 192, 192)',
        blue: 'rgb(54, 162, 235)',
        purple: 'rgb(153, 102, 255)',
        grey: 'rgb(201, 203, 207)'
    };

    var barChartData = {

        labels: <?= json_encode($labels); ?>,
        datasets: [{
            label: 'Seed stock', 
            borderColor: window.chartColors.green,
            backgroundColor: window.chartColors.red,
            borderWidth: 1,
            data: <?= json_encode($values); ?>
        }]

    };

    var ctx = document.getElementById('chart-seed-stock').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: barChartData,
        options: {
            responsive: false, 
            legend: {
                position: 'top',
            },
            title: {
                display: false, 
            }
        }
    });
});
</script>