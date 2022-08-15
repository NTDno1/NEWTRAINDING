const width_threshold = 480;

function RoomChart1(status, nameStatus) {
    if ($("#RoomChart").length) {
        ctxLine = document.getElementById("RoomChart").getContext("2d");
        const data = {
            labels: status,
            datasets: [{
                    label: "Số Liệu",
                    data: nameStatus,
                    backgroundColor: [
                        'rgb(255, 99, 132)',
                        'rgb(54, 162, 235)',
                        'rgb(255, 205, 86)'
                    ],
                    hoverOffset: 4
                }]
        };
        const config = {
            type: 'pie',
            data: data
        };
        RoomChart = new Chart(ctxLine, config);
    }
}
function drawBarChart(device, nameDevice) {
    if ($("#barChart").length) {
        ctxBar = document.getElementById("barChart").getContext("2d");

        optionsBar = {
            responsive: true,
            scales: {
                yAxes: [
                    {
                        barPercentage: 0.4,
                        ticks: {
                            beginAtZero: true
                        },
                        scaleLabel: {
                            display: true,

                        }
                    }
                ]
            }
        };

        optionsBar.maintainAspectRatio =
                $(window).width() < width_threshold ? false : true;
        configBar = {
            type: "horizontalBar",
            data: {
                labels: nameDevice,
                datasets: [
                    {
                        label: "Số Liệu",
                        data: device,
                        backgroundColor: [

                            "#F7604D",
                            "#4ED6B8",
                            "#A8D582",
                            "#D7D768",
                            "#9D66CC",
                            "#DB9C3F",
                            "#3889FC",
                            "#CCC",
                            'rgb(60, 100, 25)',
                            'rgb(201, 203, 207)'
                        ],
                        borderWidth: 0
                    }
                ]
            },
            options: optionsBar
        };

        barChart = new Chart(ctxBar, configBar);
    }
}
//function RoomAllChart1(roomName, totalRoom) {
//    if ($("#RoomAllChart").length) {
//        ctxBar = document.getElementById("RoomAllChart").getContext("2d");
//
//        const data = {
//            labels: roomName,
//            datasets: [{
//                    label: 'My First Dataset',
//                    data: totalRoom,
//                    backgroundColor: [
//                        'rgb(255, 99, 132)',
//                        'rgb(54, 162, 235)',
//                        'rgb(255, 205, 86)',
//                        'rgb(201, 203, 207)',
//                        'rgb(60, 100, 25)'
//                    ],
//                    hoverOffset: 4
//                }]
//        };
//        const config = {
//            type: 'line',
//            data: data,
//        };
//
//        RoomAllChart = new Chart(ctxBar, config);
//    }
//}

function ServiceChart1(service, nameService) {
    if ($("#ServiceChart").length) {
        ctxBar = document.getElementById("ServiceChart").getContext("2d");

        optionsBar = {
            responsive: true,
            scales: {
                yAxes: [
                    {
                        barPercentage: 0.4,
                        ticks: {
                            beginAtZero: true
                        },
                        scaleLabel: {
                            display: true,

                        }
                    }
                ]
            }
        };

        optionsBar.maintainAspectRatio =
                $(window).width() < width_threshold ? false : true;
        configBar = {
            type: "line",
            data: {
                labels: nameService,
                datasets: [
                    {
                        label: "Số Liệu",
                        data: service,
                        fill: false,
                        borderColor: 'rgb(75, 192, 192)',
                        tension: 0.1

                    }
                ]
            },
            options: optionsBar
        };
        ServiceChart = new Chart(ctxBar, configBar);

    }
}

