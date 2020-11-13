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
                            <form id="form1">
                                <div class="form-group">
                                    <label for="cha_nome">Título</label>
                                    <input type="text" id="cha_nome" placeholder="Título" class="form-control" maxlength="100" required="required"/>
                                    <small class="form-text text-muted"><span id="nomeHelp" data-source="cha_nome">Por exemplo, Projetor queimado, cabo de rede sem funcionamento</span>
                                    </small>
                                </div>
                                <div class="form-group">
                                    <label for="descHelp">Descrição</label>
                                    <textarea id="cha_descricao" class="form-control" maxlength="300" required="required"></textarea>
                                    <small class="form-text text-muted"><span id="descHelp" data-source="cha_descricao">Descrição do chamado</span>
                                    </small>
                                </div>
                                <div class="form-group">
                                    <label for="equiTipo">Equipamento</label>        
                                    <select id="equiTipo" required="required" class="form-control">
                                        <option value="1">Computador</option>
                                        <option value="2">Cabo</option>
                                        <option value="3">Projetor</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="locTipo">Local</label>
                                    <select id="locTipo" required="required" class="form-control">
                                        <option value="1">Sala</option>
                                        <option value="2">Laboratório</option>
                                        <option value="3">Diretoria</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="priTipo">Prioridade</label>
                                    <select id="priTipo" required="required" class="form-control">
                                        <option value="1">Sala</option>
                                        <option value="2">Laboratório</option>
                                        <option value="3">Diretoria</option>
                                    </select>
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
        </div>
        <div class="p-3" id="chamados-cards">
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title" id="cha_name_card"></h5>
                    <h6 class="card-subtitle mb-2 text-muted" id="cha_descricao_card"></h6>
                    <p class="card-text" id="cha_criacao_card"></p>
                    <a href="#" class="card-link">Visualizar</a>
                    <a href="#" class="card-link" data-toggle="modal" data-target="#encerrarModal">Encerrar</a>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="encerrarModal" tabindex="-1" role="dialog" aria-labelledby="encerrarModal" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
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
    <script src="misc/Chamados.js"></script>
</body>
</html>
