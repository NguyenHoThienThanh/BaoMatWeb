$(document).ready(function() {
    $('#example').dataTable( {
        "pageLength": 3,
        "lengthMenu": [ 3, 10, 25, 50, 100 ]
    } );
});

// JavaScript code to set up the chart
document.addEventListener('DOMContentLoaded', function () {
    // Get the canvas element
    let ctx = document.getElementById('myAreaChart').getContext('2d');

    // Sample data
    let data = {
        labels: ['Jan', 'Feb', 'March', 'April', 'May', 'Jun', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
            label: 'My Data',
            backgroundColor: 'rgba(75,192,192,0.4)',
            borderColor: 'rgba(75,192,192,1)',
            borderWidth: 1,
            data: [10, 20, 15, 25, 30, 45, 75, 55, 100, 66, 47, 78]
        }]
    };

    // Chart options
    let options = {
        responsive: true,
        maintainAspectRatio: false
    };

    // Create the area chart
    let myAreaChart = new Chart(ctx, {
        type: 'line',
        data: data,
        options: options
    });
});

$(document).ready(function () {
    // Sample data
    let data = {
        labels: ['Asia', 'North America', 'EU', 'Australia'],
        datasets: [{
            data: [300, 150, 100, 220],
            backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#D7F9F9'],
            hoverOffset: 4
        }]
    };

    // Chart options
    let options = {
        responsive: true,
        maintainAspectRatio: false,
    };

    // Get the canvas element
    let ctx = document.getElementById('myPieChart').getContext('2d');

    // Create the pie chart
    let myPieChart = new Chart(ctx, {
        type: 'pie',
        data: data,
        options: options
    });
});