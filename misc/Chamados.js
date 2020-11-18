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
    var form2 = document.querySelector("#form2");

    //Itens card
    var ChamadosCards = document.querySelector("#chamados-cards");

    //search
    var search = document.querySelector("#searchInput");

    //statics
    var locais = [];
    var equipamentos = [];
    var statu = [];
    var prioridades = [];

    var validation = {
        Nome: false,
        Descricao: false
    }

    //FETCHS
    async function getChamados() {
        //http://localhost:58052/api/test/
        await fetch("/api/chamado/"
        ).then(
            chamados => chamados.json()
        ).then(
            chamados => {
                chamados.map(e => {
                    createCard(e);
                })
            }
        ).
            catch(
                error => console.error('Erro ao obter chamados:', error)
            );
    };

    getChamados();

    async function getChamado(id) {
        //http://localhost:58052/api/test/{id}
        await fetch("/api/chamado/" + id
        ).then(
            chamados => chamados.json()
        ).then(
            chamados => {
                chamados.map(e => {
                    setSlider(e);
                })
            }
        ).catch(
            error => console.error('Erro ao obter chamados:', error)
        );
    }


    async function searchChamado(term) {
        //http://localhost:58052/api/test/{id}

        await fetch("/api/chamado/"
        ).then(
            chamados => chamados.json()
        ).then(
            chamados => {
                ChamadosCards.innerHTML = null;

                var result = chamados.filter(e =>
                    searching(term, [ e.Nome, e.Descricao ]))

                result.map(e => {
                    createCard(e);
                })

                if (result.length == 0) {
                    ChamadosCards.textContent = "Sem Resultados";
                }
            }
        ).catch(
            error => console.error('Erro ao obter chamados:', error)
        );
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

    async function getEquipamento() {
        //http://localhost:58052/api/test/
        await fetch("/api/tipoequipamento/"
        ).then(
            equipamento => equipamento.json()
        ).then(
            equipamento => {
                equipamento.map(e => {
                    equipamentos.push(e);
                })
            }
        ).catch(
            error => console.error('Erro ao obter equipamentos:', error)
        );
    };

    getEquipamento();

    async function getStatus() {
        //http://localhost:58052/api/test/
        await fetch("/api/status/"
        ).then(
            status => status.json()
        ).then(
            status => {
                status.map(e => {
                    statu.push(e);
                })
            }
        ).catch(
            error => console.error('Erro ao obter equipamentos:', error)
        );
    };

    getStatus();

    async function getPrioridade() {
        //http://localhost:58052/api/test/
        await fetch("/api/prioridade/"
        ).then(
            prioridade => prioridade.json()
        ).then(
            prioridade => {
                prioridade.map(e => {
                    prioridades.push(e);
                })
            }
        ).catch(
            error => console.error('Erro ao obter equipamentos:', error)
        );
    };

    getPrioridade();

    search.addEventListener("search", e => {
        searchChamado(search.value);
    });

    function setSlider(data) {

        console.log(data);
        var slider = document.querySelector("#slider");
        var sliderTitle = document.querySelector("#slider-title");
        sliderTitle.textContent = data.Nome;
        var sliderDescription = document.querySelector("#slider-description");
        sliderDescription.textContent = data.Descricao;
        var sliderAbridor = document.querySelector("#slider-opener");
        sliderAbridor.textContent = data.abridor.Id;
        var sliderEquipamento = document.querySelector("#slider-equipament");
        sliderEquipamento.textContent = equipamentos[data.equipamento.ID - 1].Nome;
        var sliderLocal = document.querySelector("#slider-local");
        sliderLocal.textContent = data.Local.Id;
        var sliderResponsavel = document.querySelector("#slider-resposavel");
        sliderResponsavel.textContent = data.Responsavel.Id;
        var sliderPrioridade = document.querySelector("#slider-prioridade");
        sliderPrioridade.textContent = prioridades[data.prioridade.Id - 1].Nome;
        var sliderData = document.querySelector("#slider-data");
        var utc = new Date(data.Data);
        sliderData.textContent = utc.toLocaleDateString();
        var sliderStatus = document.querySelector("#slider-status");
        sliderStatus.textContent = statu[data.status.Id - 1].Nome;
        var sliderFeed = document.querySelector("#slider-feed");
        sliderFeed.value = data.Feed;
        var slideClose = document.querySelector("#slider-close");
        slideClose.addEventListener('click', e => {
            slider.classList.remove("slide-in");
            slider.classList.add('slide-out');
        });

    }

    function getTime(datetime = new Date()) {
        if (Math.floor(getDays(datetime)) > 0) {
            return Math.floor(getDays(datetime)) + " Dias";
        }
        else if (Math.floor(getHours(datetime)) > 0) {
            return Math.floor(getHours(datetime)) + " Horas";
        }
        return Math.floor(getMinutes(datetime)) + " Minutos";
    }


    function getDays(datetime = new Date()) {
        return getHours(datetime) / 24;
    }

    function getHours(datetime = new Date()) {
        return getMinutes(datetime) / 60;
    }

    function getMinutes(datetime = new Date()) {
        let data = new Date(datetime);
        let now = new Date();

        return (now.getTime() - data.getTime()) / 60000;
    }

    function getElement(element) {
        element.addEventListener('click', e => {
            var sliderElement = document.querySelector("#slider");
            let slider = sliderElement.className;
            var chamadoId = e.target.getAttribute('data-chamado');

            if (slider !== 'slide-in' || sliderElement.classList.contains('slide-out')) {
                if (sliderElement.classList.contains('slide-out')) {
                    sliderElement.classList.remove('slide-out');
                }
                sliderElement.classList.add('slide-in');
            }

            getChamado(chamadoId);
        });
    }


    function createCard(chamado) {
        let card = document.createElement("div");
        card.setAttribute('id', 'chamado_num_' + chamado.Id);
        card.classList.add("card");
        card.classList.add("ml-1");
        card.classList.add("mr-1");
        card.classList.add("mt-1");
        card.classList.add("animate__animated");//fadeInRight
        card.classList.add("animate__fadeIn");
        card.style.width = "18rem";

        let card_body = document.createElement("div");
        card_body.classList.add('card-body');

        let card_title = document.createElement('h5');
        card_title.setAttribute('id', 'chamado_title_' + chamado.Id);
        card_title.classList.add('card-title');
        card_title.textContent = chamado.Nome;

        let card_descricao = document.createElement('h6');
        card_descricao.setAttribute('id', 'chamado_descricao_' + chamado.Id);
        card_descricao.classList.add('card-subtitle');
        card_descricao.classList.add('mb-2');
        card_descricao.classList.add('text-muted');
        card_descricao.textContent = chamado.Descricao;

        let card_footer = document.createElement('div');
        card_footer.classList.add('card-footer');

        let card_criacao = document.createElement('p');
        card_criacao.setAttribute('id', 'chamado_criacao_' + chamado.Id);
        card_criacao.classList.add('card-text');

        let card_criacao_span = document.createElement('span');
        card_criacao_span.classList.add('fa');
        card_criacao_span.classList.add('fa-calendar');

        card_criacao.appendChild(card_criacao_span);

        let text = document.createTextNode(" " + getTime(chamado.Data));

        card_criacao.appendChild(text);

        let visualizar = document.createElement('a');
        visualizar.href = "#";
        visualizar.classList.add('card-link');
        visualizar.setAttribute('data-chamado', chamado.Id);
        getElement(visualizar);

        visualizar.textContent = 'Visualizar';

        let modal = document.createElement('a');
        modal.href = "#";
        modal.classList.add('card-link');
        modal.setAttribute('data-toggle', 'modal');
        modal.setAttribute('data-target', '#encerrarModal');
        modal.textContent = 'Encerrar';

        card_body.appendChild(card_title);
        card_body.appendChild(card_descricao);
        card_footer.appendChild(card_criacao);
        card_footer.appendChild(visualizar);
        card_footer.appendChild(modal);
        card.appendChild(card_body);
        card.appendChild(card_footer);

        ChamadosCards.appendChild(card);
    }

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

        var chamado = {
            Nome: titulo.value,
            Descricao: descricao.value,
            abridor: { Id: "1" },
            equipamento: { ID: equipamento.options[equipamento.selectedIndex].value },
            Local: { Id: local.options[local.selectedIndex].value },
            prioridade: { Id: prioridade.options[prioridade.selectedIndex].value },
            Data: Date.now()
        }

        fetch("api/chamado", {
            method: "POST",
            body: JSON.stringify(chamado),
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

    form2.addEventListener("submit", e => {
        e.preventDefault();
    })

    function disabledButton() {
        if (validation.Nome == true && validation.Descricao == true) {
            button.removeAttribute("disabled");
        }
        else {
            button.setAttribute("disabled", "disabled");
        }
    }

    function clean() {
        titulo.value = null;
        titulo.classList.remove("is-valid");
        descricao.value = null;
        descricao.classList.remove("is-valid");
        validation.Descricao = false
        validation.Nome = false;
        disabledButton();
    }
})();