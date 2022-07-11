<canvas id="bar" style="width: 100%;"></canvas>
<script>
    
$(function () {

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
        labels: [
            'Import permits', 
            'Export Permits', 
            'Planting Returns- Company',
            'Planting Returns- Grower',
            'SR10 Forms', 
            'QDS Forms', 
            'Seed Labs',
            'Seed Labels'
        ],
        datasets: [{
            label: 'Dataset 1',
            borderColor: window.chartColors.red,
            borderWidth: 1,
            data: [
                $total_import_permits,
                $total_export_permits,
                $total_planting_returns_company,
                $total_planting_returns_grower,
                $total_form_sr10s,
                $total_form_qds,
                $total_seed_labs,
                $total_seed_labels
            ]
        }]
    };

    var ctx = document.getElementById('bar').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: barChartData,
        options: {
            responsive: true,
            legend: {
                position: 'top',
            },
            title: {
                display: true,
                text: 'Chart.js Bar Chart'
            }
        }
    });
});
</script>
