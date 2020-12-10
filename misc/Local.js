'use strict';

// var button = document.querySelector("#btnLocal");

import { appendClass, createAlert, appendOption } from './DOMManipulate.JS';

import { Put, getAll, Post } from './FetchAPI.js';

var form1 = document.querySelector("#form1");

$("#table_Local").DataTable({
    "processing": true,
    language: {
        "emptyTable": "Nenhum registro encontrado",
        "info": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
        "infoEmpty": "Mostrando 0 até 0 de 0 registros",
        "infoFiltered": "(Filtrados de _MAX_ registros)",
        "infoThousands": ".",
        "lengthMenu": "_MENU_ resultados por página",
        "loadingRecords": "Carregando...",
        "processing": "Processando...",
        "zeroRecords": "Nenhum registro encontrado",
        "search": "Pesquisar",
        "pagingType": "numbers",
        "paginate": {
            "next": "Próximo",
            "previous": "Anterior",
            "first": "Primeiro",
            "last": "Último"
        },
        "aria": {
            "sortAscending": ": Ordenar colunas de forma ascendente",
            "sortDescending": ": Ordenar colunas de forma descendente"
        },
        "select": {
            "rows": {
                "_": "Selecionado %d linhas",
                "0": "Nenhuma linha selecionada",
                "1": "Selecionado 1 linha"
            }
        },
        "buttons": {
            "copy": "Copiar para a área de transferência",
            "copyTitle": "Cópia bem sucedida",
            "copySuccess": {
                "1": "Uma linha copiada com sucesso",
                "_": "%d linhas copiadas com sucesso"
            }
        }
    },
    ajax: {
        url: '/api/local',
        dataSrc: ''
    },
    columns: [
        { data: 'Id' },
        { data: 'Nome' },
        { data: 'Bloco' },
        { data: 'status.Nome' }
    ]
});


form1.addEventListener("submit", e => {
    e.preventDefault();

    let formData = new FormData(form1);

    var local = {};
    formData.forEach((value, key) => {
        local[key] = value;
    });

    Post(local, "api/local/").then(
        response => {
            $("#table_Local").DataTable().ajax.reload();
            createAlert("Local adicionado com sucesso");
        }
    ).catch(
        error => console.error('Error:', error)
    );
})
