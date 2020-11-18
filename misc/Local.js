(function () {
    'use strict';

    var titulo = document.querySelector("#loc_nome");

    var button = document.querySelector("#btnLocal");

    var bloco = document.querySelector("#tipoBloco");

    var tr = document.createElement("tr")

    var pri_td = document.createElement("td")

    var form2 = document.querySelector("#form2");

    var LocalLabel = document.querySelector("#local-label");
    var ID = 0;

    var validation = {
        Nome: false
    }

    async function getLocal() {
        //http://localhost:58052/api/local/
        fetch("/api/local/"
        ).then(
            local => local.json()
        ).then(
            local => {
                local.map(e => {
                    createLabel(e);
                    ID++;
                })
            }
        ).
            catch(
                error => console.error('Erro ao obter local:', error)
            );
    };



    form2.addEventListener("submit", e => {
        e.preventDefault();

        //ASSINCRONO
        ID++;

        var local = {
            Id: ID,
            Nome: titulo.value,
            bloco: { Id: bloco.optionslocal.selectedIndex].value },

        }

        fetch("api/local", {
            method: "POST",
            body: JSON.stringify(local),
            headers: {
                'Accept': 'application/json; charset=utf-8',
                'Content-Type': 'application/json;charset=UTF-8'
            }
        }).then(
            response => response
        ).then(
            response => {
                //console.log('Success:', response)
                LocalLabel.textContent = null;
                getLocal();
                createLabel(response);
            }
        ).catch(
            error => console.error('Error:', error)
        );
        //LIMPAR CAMPOS
        clean();

        //INSERIR LABEL
        //createLabel(local);
    })
})();