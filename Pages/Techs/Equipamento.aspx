<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Equipamento.aspx.cs"
    Inherits="Pages_Techs_Equipamento" Title="Equipamento" %>

<asp:Content
    runat="server"
    ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="col">
        <div>

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#novoEquipamento">
                <span class="fa fa-plus mr-2"></span>Novo Equipamento
            </button>

            <div class="modal fade" id="novoEquipamento" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Criar Equipamento</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="form1" name="form1">
                                <div class="form-group">
                                    <label for="txtNome">Nome</label>
                                    <input type="text" class="form-control" id="txtNome" name="Nome" placeholder="Titulo" maxlength="100" required="required">
                                    <small class="form-text text-muted">
                                        <span id="nomeHelp" data-source="equ_nome">Nome do equipamento de maneira clara</span>
                                    </small>
                                </div>
                                <div class="form-group">
                                    <label for="txtPatrimonio">Patrimonio</label>
                                    <input type="text" class="form-control" id="txtPatrimonio" name="Patrimonio" placeholder="Patrimonio" maxlength="100" required="required">
                                    <small class="form-text text-muted">
                                        <span id="patrimonioHelp" data-source="equi_patrimonio">Digite o patrimonio como esta no equipamento</span>
                                    </small>
                                </div>
                                <div class="form-group">
                                    <label for="cbmTipo">Tipo de equipamento</label>
                                    <select id="cbmTipo" required="required" class="form-control" name="Tipo.ID"></select>
                                </div>
                                <div class="form-group">
                                    <label for="cbmLocal">Local</label>
                                    <select id="cbmLocal" required="required" class="form-control" name="Local.Id"></select>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                            <button type="submit" form="form1" class="btn btn-primary" id="btnLocal">Criar local</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="overflow-hidden mt-2">
            <table id="table_Equipamento" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Patrimonio</th>
                        <th>Tipo</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <script type="module" src="misc/Equipamento.js"></script>

</asp:Content>
