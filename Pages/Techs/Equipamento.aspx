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
    <asp:Repeater ID="RepeaterEquipaments" runat="server">
        <ItemTemplate>
            <div class="card m-3" style="width: 18rem;">
                <img class="card-img-top" src="../../misc/computer.jpg" alt="Computer">
                <div class="card-body">
                    <h5 class="card-title"><asp:Label ID="Label1" runat="server" Text='<%#Eval("equ_nome") %>' /></h5>
                    <p class="card-text">Patrimonio: <asp:Label ID="Label2" runat="server" Text='<%#Eval("equi_patrimonio") %>' /></p>
                    <a href="#" class="btn btn-primary">Visualizar informações</a>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
