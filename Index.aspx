<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="falconDex.Index" %>

<!DOCTYPE html>

<html lang="pt-br" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link rel="apple-touch-icon" sizes="57x57" href="/img/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/img/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/img/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/img/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/img/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/img/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/img/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/img/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/img/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="/img/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/img/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/img/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon-16x16.png">
    <link rel="manifest" href="/img/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/img/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <link href="style/Style.css" rel="stylesheet" />

    <title>Falcon Dex | Soluções empresariais</title>
</head>

<body class="texto-centro">
    <header class="falconDexPadrao">
        <img class="imgLogo" src="img/LogoFalcon.png" width="102" height="102" />

        <h1 class="nomeFalcon">FALCON</h1>

        <h4 class="nomeDex">DEX</h4>
    </header>
    <main class="principal">
        <form runat="server" class="formulario">

            <div class="form-group">
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="200" AutoCompleteType="Email" CssClass="form-control" placeholder="E-mail "></asp:TextBox>
                <small class="form-text text-left ml-3">
                    <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                      ControlToValidate="txtEmail"
                      ErrorMessage="Digite um e-mail válido."
                      ForeColor="Gray">
                    </asp:RequiredFieldValidator>
                </small>
                <!--small id="emailHelp" class="form-text text-muted">Digite um e-mail válido</!--small-->
            </div>

            <div class="form-group">
                <asp:TextBox ID="txtSenha" TextMode="Password" MaxLength="32" runat="server" CssClass="form-control" placeholder="Senha"></asp:TextBox>
                <small class="form-text text-left ml-3">
                     <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                        ControlToValidate="txtSenha"
                        ErrorMessage="Digite uma senha de 8 a 32 caracteres."
                        ForeColor="Gray">
                    </asp:RequiredFieldValidator>
                </small>
                <!--small id="passwordHelp" class="form-text text-muted">Digite uma senha de 8 a 32 caracteres</!--small-->
            </div>

            <asp:Button ID="btnEntrar" runat="server" Text="ENTRAR" CssClass="btn btn-primary btn-block" OnClick="btnEntrar_Click" />

            <asp:Label ID="esqueciSenha" runat="server" Text="esqueciSenha" CssClass="mb-3">

                <a href="esqueci a senha">Esqueceu a senha</a>

            </asp:Label>

            <div id="loginAlert" class="alert alert-danger position-absolute" role="alert" runat="server">
                Dados incorretos
            </div>

        </form>
    </main>
    <script src="Scripts/jquery-3.5.1.slim.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
