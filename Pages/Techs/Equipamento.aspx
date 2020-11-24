<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Equipamento.aspx.cs"
    Inherits="Pages_Techs_Equipamento" Title="Equipamento" %>

<asp:Content
    runat="server"
    ContentPlaceHolderID="head">
    <title>Equipamento</title>
</asp:Content>

<asp:Content
    runat="server"
    ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="d-flex flex-column">
    <form class="form-row" id="form1">
        <div class="col-md-6 mt-2">
            <button type="button" class="btn btn-primary" data-target="#novoChamado" data-toggle="modal">
                <i class="fa fa-plus"> </i>  Novo equipamento
            </button>
        </div>
        <div class="col-md-5 mt-2 form-group">
            <label for="searchInput" class="sr-only">Password</label>
            <input id="searchInput" type="search" class="form-control" placeholder="Digite para pesquisar"/>
        </div>
    </form>
        <!-- Abrir chamado -->
    <div class="modal fade" id="novoChamado" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Criar equipamento</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="form2">
                        <div class="form-group">
                            <label for="equ_nome">Nome</label>
                            <input type="text" id="equ_nome" placeholder="Nome" class="form-control" maxlength="100" required="required"/>
                            <small class="form-text text-muted"><span id="nomeHelp" data-source="equ_nome">Exemplo: Computador Acer Aspire</span>
                            </small>
                        </div>
                        <div class="form-group">
                            <label for="equ_patrimonio">Patrimônio</label>
                            <input type="text" id="equ_patrimonio" placeholder="0000-000" class="form-control" maxlength="100" required="required"/>
                            <small class="form-text text-muted"><span id="patriHelp" data-source="equ_patrimonio">Número do patrimônio</span>
                            </small>
                        </div>
                        <div class="form-group">
                            <label for="equiTipo">Tipo</label>        
                            <select id="equiTipo" required="required" class="form-control">
                                <option value="1">Computador</option>
                                <option value="2">Cabo</option>
                                <option value="3">Projetor</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary" id="btnEquipamento" form="form1">Solicitar</button>
                </div>
            </div>
        </div>
    </div>
    <div class="d-flex flex-wrap" id="equipamentos-cards"></div>
    </div>
    <script type="text/javascript" src="../../misc/Equipamentos.js"></script>
</asp:Content>
