(function () {
    'use strict';

     // var button = document.querySelector("#btnLocal");

    var form2 = document.querySelector("#form2");
    var titulo = document.querySelector("#loc_nome");
    var bloco = document.querySelector("#tipoBloco");


    var LocalLabel = document.querySelector("#label_bory");

    async function getLocal() {
        //http://localhost:58052/api/local/
        fetch("/api/local/"
        ).then(
            local => local.json()
        ).then(
            local => {
                local.map(e => {
                    createLabel(e);
                })
            }
        ).
            catch(
                error => console.error('Erro ao obter local:', error)
            );
    };

    getLocal();

    function createLabel(local) {

        let tr = document.createElement("tr");
        

        let pri_td = document.createElement("td");
        pri_td.setAttribute('id', 'loc_id' + local.Id);
        pri_td.textContent = local.Id;

        let nome = document.createElement("td");
        nome.setAttribute('id', 'loc_nome' + local.Id);
        nome.textContent = local.Nome;

        let bloco = document.createElement("td");
        bloco.setAttribute('id', 'loc_bloco' + local.Id);
        bloco.textContent = local.Bloco;

        let status = document.createElement("td");
        status.setAttribute('id', 'loc_Status' + local.Id);
        status.textContent = local.status.Id;
        
        tr.appendChild(pri_td);
        tr.appendChild(nome);
        tr.appendChild(bloco);
        tr.appendChild(status);

        LocalLabel.appendChild(tr);
    }


    form2.addEventListener("submit", e => {
        e.preventDefault();

        //ASSINCRONO

        var local = {
            Nome: titulo.value,
            bloco: bloco.options[bloco.selectedIndex].value

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
 
