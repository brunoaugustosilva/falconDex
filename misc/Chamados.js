(function () {
    'use strict';

    //items
    var titulo = document.querySelector("#cha_nome");
    var descricao = document.querySelector("#cha_descricao");
    var equipamento = document.querySelector("#equiTipo");
    var local = document.querySelector("#locTipo");
    var prioridade = document.querySelector("#priTipo");
    //button
    var button = document.querySelector("#btnChamado");
    //forms
    var form1 = document.querySelector("#form1");

    //AJAX
    const AJAX = new XMLHttpRequest();

    //Itens card
    var nome = document.querySelector("#cha_name_card");
    var descricao2 = document.querySelector("#cha_descricao_card");
    var dataCriacao = document.querySelector("#cha_criacao_card");

    var validation = {
        Nome: false,
        Descricao: false
    }

    function getChamados() {
        //http://localhost:58052/api/test/
        fetch("/api/test/"
        ).then(
            response => response.json()
        ).then(
            response => {
                console.log(response[0]); // Get the results
                let chamado = response[0];

                nome.textContent = chamado.Nome;
                descricao2.textContent = chamado.Descricao;
                dataCriacao.textContent = chamado.Data;
            }
        ).catch(
            error => console.error('Error:', error)
        );
    };

    getChamados();

    titulo.addEventListener("keyup", e => {
        var text = e.target.value;

        var tip = document.querySelector("[data-source='" + e.target.id + "']");

        if (!isSentence(text)) {
            e.target.classList.remove("is-valid");
            e.target.classList.add("is-invalid");
            tip.textContent = "Elabore com mais de uma palavra";
            validation.Nome = false;
        }
        else {
            e.target.classList.add("is-valid");
            e.target.classList.remove("is-invalid");
            tip.textContent = "Por exemplo, Projetor queimado, cabo de rede sem funcionamento";
            validation.Nome = true;
        }

        disabledButton();
    });

    descricao.addEventListener("keyup", e => {
        var text = e.target.value;

        var tip = document.querySelector("[data-source='" + e.target.id + "']");

        if (!isSentence(text)) {
            e.target.classList.remove("is-valid");
            e.target.classList.add("is-invalid");
            tip.textContent = "Elabore com mais de uma palavra";
            validation.Descricao = false;
        }
        else {
            e.target.classList.add("is-valid");
            e.target.classList.remove("is-invalid");
            tip.textContent = "Descrição do chamado";
            validation.Descricao = true;
        }

        disabledButton();
    });


    function isSentence(entry) {
        return entry.split(/\b\W+\b/).length > 1;
    }

    form1.addEventListener("submit", e => {
        e.preventDefault();

        //ASSINCRONO

        var chamado = {
            Nome: titulo.value,
            Descricao: descricao.value,
            abridor: { Id: "1" },
            Equipamento: { ID: equipamento.options[equipamento.selectedIndex].value },
            Local: { Id: local.options[local.selectedIndex].value },
            Prioridade: { Id: prioridade.options[prioridade.selectedIndex].value },
            Data: Date.now()
        }

        fetch("/chamados/Send", {
            method: "POST",
            body: JSON.stringify(chamado),
            headers: {
                'Accept': 'application/json; charset=utf-8',
                'Content-Type': 'application/json;charset=UTF-8'
            }
        }).then(
            response => response.json()
        ).then(
            response => console.log('Success:', JSON.stringify(response))
        ).catch(
            error => console.error('Error:', error)
        );
        //LIMPAR CAMPOS

        //FECHAR MODAL

        //INSERIR CARD
    })

    disabledButton();

    function disabledButton() {
        if (validation.Nome == true && validation.Descricao == true) {
            button.removeAttribute("disabled");
        }
        else {
            button.setAttribute("disabled", "disabled");
        }
    }
})();