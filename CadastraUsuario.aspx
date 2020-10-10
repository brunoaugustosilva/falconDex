<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CadastraUsuario.aspx.cs" Inherits="CadastraUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

     <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="style/Style.css" rel="stylesheet" />
  
    
    
    <title>FALCON DEX</title>
</head>
<body>
    <div class="row">
    <div class="col-md-3 weapper">
    <nav class="navbar navbar-expand-md navbar-dark bg-primary">
        <div class="container">
            <div class="sidebar-header">
        <a class="navbar-brand "  href="#">Usuario</a>
         </div>
        <button class="navbar navbar-toggler" type="button" data-target="#navbarMenu" data-toggle="collapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarMenu">
            
            <ul class="navbar-nav nav flex-column">
                <li class="nav-item">
                    <a href="#">
                        <i ></i>Perfil
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i ></i>Chamados
                    </a>
                </li >
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i ></i>Técnicos
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#"  class="nav-link">
                        <i></i>Equipamentos
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i ></i>Solicitantes
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i ></i>Empréstimos
                    </a>
                </li >
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i ></i>Gráficos
                    </a>
                </li>
                <li class="nav-item">
                    <a href="TelaInicial.aspx" class="nav-link">
                        <i ></i>SAIR
                    </a>
                </li>
            </ul>
</div>
        </div>
    
    </nav>
        </div>
    <div class="col-md-9 ">
        <div class="container">
            <img class="img-fluid rounded float-left" src="img/SetaRetorno.png"  width="30" height="30" />

        <h1 class="aquarium" >Aquarium</h1>
            <img class="img-fluid rounded float-right" src="img/captura de tela  principal.PNG"  width="65"  height="65" />
        </div>
    <form id="form1" runat="server">
        <div>
            <h2 class="">Tecnicos</h2>
         <asp:TextBox ID="txbEmail" runat="server" MaxLength="200" AutoCompleteType="Email" CssClass="form-control" placeholder="E-mail "></asp:TextBox>

        <asp:TextBox ID="txbSenha" TextMode="Password" MaxLength="32" runat="server" CssClass="form-control" placeholder="Senha"></asp:TextBox>
        
        <asp:Button ID="btnEntrar" runat="server" Text="ENTRAR" CssClass="btn btn-primary btn-block" />
        </div>
    </form>
        </div>
        </div>
    <script src="Scripts/jquery-3.5.1.slim.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
