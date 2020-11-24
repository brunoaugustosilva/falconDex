'use strict'

import "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.min.js";

var ctx = document.getElementById('myChart').getContext('2d');

var LABELS = [];
var DATA = [];

async function getGrafico(id) {
    //http://localhost:58052/api/equipamento/
    fetch("/api/grafico/" + id
    ).then(
        grafico => grafico.json()
    ).then(
        grafico => {
            grafico.map(e => {
                LABELS.push(e.nome);
                DATA.push(e.quantidade);
            })

            createChart();
        }
    ).catch(
        error => console.error('Erro ao obter grafico:', error)
    );


};

getGrafico(1);
function createChart() {
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: LABELS,
            datasets: [{
                label: 'Dados',
                data: DATA,
                backgroundColor: [
                    'firebrick',
                    'olivedrab'
                ]
            }]
        },
        options: {
            chart: {
                fontColor: 'black',
            },
            legend: {
                labels: {
                    fontColor: 'black',
                    fontFamily: 'Segoe UI',
                    fontSize: 16
                }
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
}