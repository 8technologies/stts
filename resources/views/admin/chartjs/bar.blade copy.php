<?php
if (!isset($link)) {
    $link = admin_url();
}
?>

<div class="">

<canvas id="bar" style="width: 100%;"></canvas>

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


    var ctx = document.getElementById('bar').getContext('2d');
    new Chart(ctx, {
            type: 'bar',
            data: {
                labels: JSON.parse('<?= json_encode($data['products']) ?>'),
                datasets: [{
                        label: 'Products',
                        data: JSON.parse('<?= json_encode($data['income']) ?>'),
                        borderColor: 'rgba(255,99,132,1)',
                        backgroundColor: 'rgba(255,99,132,1)',
                        borderWidth: 2
                    },
                    {
                        label: 'Orders',
                        data: JSON.parse('<?= json_encode($data['orders']) ?>'),
                        borderColor: 'green',
                        backgroundColor: 'green',
                        borderWidth: 2
                    },
                    {
                        label: 'Pre-Orders',
                        data: JSON.parse('<?= json_encode($data['pre-orders']) ?>'),
                        borderColor: 'green',
                        backgroundColor: 'green',
                        borderWidth: 2
                    },
                    {
                        label: 'Quotations',
                        data: JSON.parse('<?= json_encode($data['quotations']) ?>'),
                        borderColor: 'green',
                        backgroundColor: 'green',
                        borderWidth: 2
                    },
                ]
            },
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

</div>
