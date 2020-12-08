<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Chamado.aspx.cs"
    Inherits="Pages_Techs_Chamado" Title="Chamado" %>

<asp:Content
    runat="server"
    ContentPlaceHolderID="head">
    <title>Chamado</title>
</asp:Content>

<asp:Content
    runat="server"
    ContentPlaceHolderID="ContentPlaceHolder1">
    <form class="form-row" id="form2">
        <div class="col-lg-3">
            <button type="button" class="btn btn-primary" data-target="#novoChamado" data-toggle="modal">
                <i class="fa fa-plus"> </i>  Novo chamado
            </button>
        </div>
        <div class="col-lg-2 form-group">
            <select id="tipoFiltro" class="form-control"></select>
        </div>
        <div class="col-lg-6">
            <div class="input-group">
                <input id="searchInput" type="search" class="form-control" placeholder="Digite para pesquisar"/>
                <div class="input-group-append">
                    <div class="input-group-text"><i class="fa fa-search"></i></div>
                </div>
            </div>
        </div>
    </form>
    <!-- Abrir chamado -->
    <div class="modal fade" id="novoChamado" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Criar chamado</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="form1" name="form1">
                        <div class="form-group">
                            <label for="cha_nome">Título</label>
                            <input type="text" id="cha_nome" name="Nome" placeholder="Título" class="form-control" maxlength="100" required="required"/>
                            <small class="form-text text-muted"><span id="nomeHelp" data-source="cha_nome">Por exemplo, Projetor queimado, cabo de rede sem funcionamento</span>
                            </small>
                        </div>
                        <div class="form-group">
                            <label for="descHelp">Descrição</label>
                            <textarea id="cha_descricao" name="Descricao" class="form-control" maxlength="300" required="required"></textarea>
                            <small class="form-text text-muted"><span id="descHelp" data-source="cha_descricao">Descrição do chamado</span>
                            </small>
                        </div>
                        <div class="form-group">
                            <label for="equiTipo">Equipamento</label>        
                            <select id="equiTipo" required="required" class="form-control" name="equipamento.ID">
                                <option value="1">Computador</option>
                                <option value="2">Cabo</option>
                                <option value="3">Projetor</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="locTipo">Local</label>
                            <select id="locTipo" required="required" class="form-control" name="Local.Id"></select>
                        </div>
                        <div class="form-group">
                            <label for="priTipo">Prioridade</label>
                            <select id="priTipo" required="required" class="form-control" name="prioridade.Id"></select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary" id="btnChamado" form="form1">Solicitar</button>
                </div>
            </div>
        </div>
    </div>
    <div class="d-flex flex-wrap" id="chamados-cards"></div>
       
    <!-- Modal -->
    <div class="modal fade" id="atenderModal" tabindex="-1" role="dialog" aria-labelledby="encerrarModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="atenderModalLabel">Deseja atender o chamado?</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
            <button type="button" class="btn btn-primary" id="chamado-atender">Atender</button>
            </div>
        </div>
        </div>
    </div>
    <div class="modal fade" id="encerrarModal" tabindex="-1" role="dialog" aria-labelledby="encerrarModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="encerrarModalLabel">Deseja encerar o chamado?</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
            <button type="button" class="btn btn-primary" id="chamado-encerrar">Encerrar</button>
            </div>
        </div>
        </div>
    </div>
    <div class="slider row" id="slider">
        <div class="slider-content col-lg-6">
            <div class="slider-body">
                <div class="slider-header d-flex justify-content-between pt-2">
                    <div class="slider-header-text">
                        <h2 id="slider-title">Nome</h2>
                        <h4 id="slider-description" class="text-muted">Descricao</h4>
                    </div>
                    <div class="slider-header-close">
                        <a href="#" id="slider-close" class="badge badge-light">
                            <i class="slider-close fa fa-close fa-3x"></i>
                        </a>
                    </div>
                </div>
                <i class="fa fa-user mr-1"></i><span class="font-weight-light">Aberto por: </span><p id="slider-opener" class="border-bottom">{abridor}</p>
                <i class="fa fa-laptop mr-1"></i><span class="font-weight-light">Equipamento: </span><p id="slider-equipament" class="border-bottom">{equipamento}</p>
                <i class="fa fa-map-marker mr-1"></i><span class="font-weight-light">Local: </span><p id="slider-local" class="border-bottom">{Local}</p>
                <i class="fa fa-user mr-1"></i><span class="font-weight-light">Responsavel: </span><p id="slider-resposavel" class="border-bottom">{Responsavel}</p>
                <i class="fa fa-warning mr-1"></i><span class="font-weight-light">Prioridade: </span><p id="slider-prioridade" class="border-bottom">{prioridade}</p>
                <i class="fa fa-calendar mr-1"></i><span class="font-weight-light">Data de abertura: </span><p class="border-bottom"><time id="slider-data">{Data}</time></p>
                <i class="fa fa-eye mr-1"></i><span class="font-weight-light">Status: </span><p id="slider-status" class="border-bottom">{status}</p>
                <i class="fa fa-mouse-pointer mr-1"></i><span class="font-weight-light">Feedback </span><input type="range" id="slider-feed" min="0" max="5" step="1" disabled>
            </div>
        </div>
     </div>  
    <script type="module">
        $("#form1").submit(function (e) {
            $('#novoChamado').modal('hide');
        });
    </script>
    <script type="module" src="misc/Chamados.js"></script>
</asp:Content>