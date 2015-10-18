$(function () {
    $('#reports').highcharts({
        chart: {
            type: 'area'
        },
        title: {
            text: 'Tipos de reportes'
        },
        subtitle: {
            text: 'Source: CAPAMA'
        },
        xAxis: {
            categories: ['1750', '1800', '1850', '1900', '1950', '1999', '2050'],
            tickmarkPlacement: 'on',
            title: {
                enabled: false
            }
        },
        yAxis: {
            title: {
                text: 'Reportes'
            },
            labels: {
                formatter: function () {
                    return this.value / 1000;
                }
            }
        },
        tooltip: {
            shared: true,
            valueSuffix: ' Reportes'
        },
        plotOptions: {
            area: {
                stacking: 'normal',
                lineColor: '#666666',
                lineWidth: 1,
                marker: {
                    lineWidth: 1,
                    lineColor: '#666666'
                }
            }
        },
        series: [{
            name: 'Robo de agua',
            data: [502, 635, 809, 947, 1402, 3634, 5268]
        }, {
            name: 'Fuga',
            data: [106, 107, 111, 133, 221, 767, 1766]
        }, {
            name: 'Medidor averiado',
            data: [163, 203, 276, 408, 547, 729, 628]
        }, {
            name: 'Robo de medidor',
            data: [18, 31, 54, 156, 339, 818, 1201]
        }, {
            name: 'Otros',
            data: [2, 2, 2, 6, 13, 30, 46]
        }]
    });

    $('#reports2').highcharts({
        chart: {
            type: 'line'
        },
        title: {
            text: 'Reportes mensuales'
        },
        subtitle: {
            text: 'Source: CAPAMA'
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: 'miles'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        series: [{
            name: 'Recibidos',
            data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        }, {
            name: 'Solucionados',
            data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
        }]
    });

    $('#grow').highcharts({
        chart: {
            zoomType: 'xy'
        },
        title: {
            text: 'Crecimiento'
        },
        subtitle: {
            text: 'Source: CAPAMA'
        },
        xAxis: [{
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            crosshair: true
        }],
        yAxis: [{ // Primary yAxis
            labels: {
                format: '{value}%',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            },
            title: {
                text: 'Mejora del servicio',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            }
        }, { // Secondary yAxis
            title: {
                text: 'Crecimiento financiero',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            labels: {
                format: '{value} % (calidad)',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            opposite: true
        }],
        tooltip: {
            shared: true
        },
        legend: {
            layout: 'vertical',
            align: 'left',
            x: 120,
            verticalAlign: 'top',
            y: 100,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
        },
        series: [{
            name: 'Crecimiento financiero',
            type: 'column',
            yAxis: 1,
            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 235.6, 248.5, 216.4, 294.1, 295.6, 254.4],
            tooltip: {
                valueSuffix: ' mm'
            }

        }, {
            name: 'Mejora del servicio',
            type: 'spline',
            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 28.3, 23.9, 29.6],
            tooltip: {
                valueSuffix: '°C'
            }
        }]
    })
});