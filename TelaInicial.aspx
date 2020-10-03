<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TelaInicial.aspx.cs" Inherits="TelaInicial" %>

<!DOCTYPE html>

<html lang="pt-br" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <link href="style/Style.css" rel="stylesheet" />

    <title>FALCON DEX</title>
</head>

<body class="texto-centro">
    <div class="falconDexPadrao">
        <img class="imgLogo" src="img/LogoFalcon.png"  width="102" height="102" />

        <h1 class="nomeFalcon" >FALCON</h1>

        <h4 class="nomeDex">DEX</h4>
    </div>
    <form runat="server" class="formulario">

       

        <asp:TextBox ID="txbEmail" runat="server" CssClass="form-control" placeholder="E-mail "></asp:TextBox>

        <asp:TextBox ID="txbSenha" runat="server" CssClass="form-control" placeholder="Senha"></asp:TextBox>
        
        <asp:Button ID="btnEntrar" runat="server" Text="ENTRAR" CssClass="btn btn-primary btn-block" />

         <asp:Label ID="esqueciSenha" runat="server"  Text="esqueciSenha">

            <a href="esqueci a senha">Esqueceu a senha</a>

        </asp:Label>

    </form>
    <script src="Scripts/jquery-3.0.0.slim.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
