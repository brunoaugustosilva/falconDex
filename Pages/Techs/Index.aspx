<%@ Page Language="C#" MasterPageFile="~/Pages/Techs/MasterPage.master" 
    AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Pages_Techs_Index" Title="Página Inicial"%>

<asp:content
    runat="server"
    contentplaceholderid="head">
    <title>Página Inicial</title>
</asp:content>

<asp:content
    runat="server"
    contentplaceholderid="ContentPlaceHolder1" >

    <div class="row">
        <h4>Boa noite, Joãzinho</h4>
        <hr/>
        <div class="col-md-3">
                Quantidade de atendimentos: 10
        </div>
        <div class="col-md-3">
                Feedback médio: 5
        </div>
        <div class="col-md-3">
                Chamados hoje: 5
        </div>
    </div>
</asp:content>

