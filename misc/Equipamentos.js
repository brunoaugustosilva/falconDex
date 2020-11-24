(function () {
    'use strict';

    var EquipamentosCard = document.querySelector("#equipamentos-cards");

    //inputs
    var equi_nome = document.querySelector("#equ_nome");
    var equi_patrimonio = document.querySelector("#equ_patrimonio");
    var tipoEqu = document.querySelector("#equiTipo");

    //search
    var search = document.querySelector("#searchInput");

    var button = document.querySelector("#btnEquipamento");

    //forms
    var form1 = document.querySelector("#form1");
    var form2 = document.querySelector("#form2");

    var validation = {
        Nome: false,
        Patrimonio: false
    }

    //variavels
    var EQUIPAMENTOS = [];

    async function getEquipamento() {
        //http://localhost:58052/api/equipamento/
        fetch("/api/equipamento/"
        ).then(
            equipamento => equipamento.json()
        ).then(
            equipamento => {
                equipamento.map(e => {
                    createCard(e);
                    EQUIPAMENTOS.push(e);
                })
            }
        ).catch(
            error => console.error('Erro ao obter equipamento:', error)
        );
    };

    getEquipamento();

    async function searchEquipamento(term) {
        EquipamentosCard.innerHTML = null;

        var result = EQUIPAMENTOS.filter(e =>
            searching(term, [e.Nome]))

        result.map(e => {
            createCard(e);
        })

        if (result.length == 0) {
            EquipamentosCard.textContent = "Sem Resultados";
        }
    }

    function searching(params, compare = []) {
        let value1 = params.toLowerCase().split(" ")
        let value2 = compare;
        let final = "";
        let status = false

        value1.map(query => {
            final = value2.filter(x =>
                x.toLowerCase().includes(query)
            );
            if (final.length > 0) return true;
        })

        if (final.length > 0) return true;

        return status;
    }

    search.addEventListener("search", e => {
        searchEquipamento(search.value);
    });

    function createCard(data) {
        let card = document.createElement("div");
        card.classList.add("card");
        card.classList.add("m-1");
        card.id = "equipamento_num_" + data.Id;
        card.setAttribute("style", "width: 18rem;");

        let img = document.createElement("img");
        img.src = "../../img/tipo_" + data.Tipo.ID + ".jpg";
        img.classList.add("card-img-top");
        img.setAttribute("alt", "Computador");

        let cardBody = document.createElement("div");
        cardBody.classList.add("card-body");

        let cardTitle = document.createElement("h5");
        cardTitle.classList.add("card-title");
        cardTitle.textContent = data.Nome;

        let cardText = document.createElement("p");
        cardText.classList.add("card-text");
        cardText.textContent = "Patrimônio: " + data.Patrimonio;

        let cardLink = document.createElement("a");
        cardLink.href = "#";
        cardLink.classList.add("btn");
        cardLink.classList.add("btn-primary");
        cardLink.setAttribute("data-target", data.Id);
        cardLink.textContent = "Visualizar informações";

        cardBody.appendChild(cardTitle);
        cardBody.appendChild(cardText);
        cardBody.appendChild(cardLink);

        card.appendChild(img);
        card.appendChild(cardBody);

        EquipamentosCard.appendChild(card);
    }

    //validação
    equi_nome.addEventListener("keyup", e => {
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
            tip.textContent = "Exemplo: Computador Acer Aspire";
            validation.Nome = true;
        }

        disabledButton();
    });

    function isSentence(entry) {
        return entry.split(/\b\W+\b/).length > 1;
    }

    form1.addEventListener("submit", e => {
        e.preventDefault();
    });

    form2.addEventListener("submit", e => {
        e.preventDefault();

        var equipamento = {
            Nome: equi_nome.value,
            Patrimonio: equi_patrimonio.value,
            Tipo: { ID: tipoEqu.options[equipamento.selectedIndex].value}
        }

        fetch("api/equipamento", {
            method: "POST",
            body: JSON.stringify(equipamento),
            headers: {
                'Accept': 'application/json; charset=utf-8',
                'Content-Type': 'application/json;charset=UTF-8'
            }
        }).then(
            response => response
        ).then(
            response => {
                createCard(response);
            }
        ).catch(
            error => console.error('Error:', error)
        );
        clean();
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

    function clean() {
        equi_nome.value = null;
        equi_nome.classList.remove("is-valid");
        equi_patrimonio.value = null;
        equi_patrimonio.classList.remove("is-valid");
        validation.Patrimonio = false
        validation.Nome = false;
        disabledButton();
    }
})();