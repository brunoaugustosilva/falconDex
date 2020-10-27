<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Pages_Solicitante_Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link href="~/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="~/Content/font-awesome.min.css" rel="stylesheet" />
    <link href="~/style/Style.css" rel="stylesheet" />
    <title>Chamados</title>
</head>
<body>
    <div class="col">
        <div class="row p-3 d-flex align-items-center">
            <div class="col-1" title="Sair">
                <a href="/index" class="badge badge-light">
                    <i class="fa fa-sign-out fa-2x text-black font-weight-lighter"></i>
                </a>
            </div>
            <div class="col-10 text-center">
                <h1 class="">Chamados</h1>
            </div>
            <div class="col-1">
                <img class="img-fluid rounded" src="img/android-icon-36x36.png" alt="Logo da Falcon Dex" />
            </div>
        </div>
        <div class="p-3">
            <button type="button" class="btn btn-primary" data-target="#novoChamado" data-toggle="modal">
                Novo chamado
            </button>
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
                            <form id="form1">
                                <div class="form-group">
                                    <label for="nomeHelp">Título</label>
                                    <input type="text" class="form-control" id="txtNome" aria-describedby="nomeHelp" 
                                        placeholder="Titulo" required>
                                    <small id="nomeHelp" class="form-text text-muted">Por exemplo, Projetor queimado, cabo de rede sem funcionamento</small>
                                </div>
                                <div class="form-group">
                                    <label for="descHelp">Descrição</label>
                                    <textarea class="form-control" id="textArea" rows="3" required="required"></textarea>
                                    <small id="descHelp" class="form-text text-muted">Descrição do chamado</small>
                                </div>
                                <div class="form-group">
                                    <label for="equiTipo">Equipamento</label>
                                    <select class="form-control" id="equiTipo" required="required">
                                      <option>Computador</option>
                                      <option>Projetor</option>
                                      <option>Cabo</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="locTipo">Local</label>
                                    <select class="form-control" id="locTipo" required="required">
                                      <option>Sala</option>
                                      <option>Laboratório</option>
                                      <option>Diretoria</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="priTipo">Prioridade</label>
                                    <select class="form-control" id="priTipo" required="required">
                                      <option>Baixa</option>
                                      <option>Média</option>
                                      <option>Alta</option>
                                      <option>Crítica</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                            <button type="submit" form="form1" class="btn btn-primary">Solicitar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="p-3" id="chamados-cards">
            <asp:Repeater ID="RepeaterChamados" runat="server">
                <ItemTemplate>
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">
                                <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("cha_name") %>' /></h5>
                            <h6 class="card-subtitle mb-2 text-muted">Chamado</h6>
                            <p class="card-text">
                                <asp:Label ID="lblDescricao" runat="server" Text='<%#Eval("cha_descricao") %>' />
                            </p>
                            <a href="#" class="card-link">Visualizar</a>
                            <a href="#" class="card-link" data-toggle="modal" data-target="#encerrarModal">Encerrar</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="encerrarModal" tabindex="-1" role="dialog" aria-labelledby="encerrarModal" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="encerrarModalLabel">Deseja encerrar o chamado?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
                <button type="button" class="btn btn-primary">Encerrar</button>
              </div>
            </div>
          </div>
        </div>
    </div>
    <script src="Scripts/jquery-3.5.1.slim.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
