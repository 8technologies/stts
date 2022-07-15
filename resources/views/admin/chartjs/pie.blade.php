<canvas id="pie" style="width: 100%;"></canvas>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    
$(function () {
    function randomScalingFactor() {
        return Math.floor(Math.random() * 1000)
    }

    window.chartColors = {
        red: 'rgb(255, 99, 132)',
        orange: 'rgb(255, 159, 64)',
        yellow: 'rgb(255, 205, 86)',
        green: 'rgb(75, 192, 192)',
        blue: 'rgb(54, 162, 235)',
        purple: 'rgb(153, 102, 255)',
        grey: 'rgb(201, 203, 207)',
        ccc: '#318db4',
        ggreen: '#008140'
    };

    var config = {
        type: 'pie',
        
        data: {
            datasets: [{
                data: [
                    $total_import_permits,
                    $total_export_permits,
                    $total_planting_returns_company,
                    $total_planting_returns_grower,
                    $total_form_sr10s,
                    $total_form_qds,
                    $total_seed_labs,
                    $total_seed_labels
                ], 
                
                backgroundColor: [
                    window.chartColors.red,
                    window.chartColors.orange,
                    window.chartColors.yellow,
                    window.chartColors.green,
                    window.chartColors.blue,
                    window.chartColors.ccc,
                    window.chartColors.ggreen,
                    window.chartColors.purple,
                ],
                label: 'Marketplace Data'
            }],

            labels: [
                'Import Permits',
                'Export Permits',
                'Planting Returns Company',
                'Planting Returns Grower',
                'Form SR10s',
                'Form QDS',
                'Total Seed Labs',
                'Seed Labels',
            ]
        },

        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'left',
                },
                title: {
                    display: true,
                    text: 'Marketplace Pie Chart'
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            },
        },
    };

    var ctx = document.getElementById('pie').getContext('2d');
    new Chart(ctx, config);
});
</script>