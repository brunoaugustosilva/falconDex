<%@ Page Language="C#" MasterPageFile="~/Pages/Techs/MasterPage.master" AutoEventWireup="true" CodeFile="Tecnicos.aspx.cs" Inherits="Tecnicos" Title="Técnicos" %>

<asp:Content
    runat="server"
    ContentPlaceHolderID="head">
    <title>Técnicos</title>
</asp:Content>
<asp:Content
    runat="server"
    ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="w-100">
    <div class="accordion p-3" id="usuarios-accordion">
        <asp:Repeater ID="RepeaterUsers" runat="server">
            <ItemTemplate>
                <div class="card z-depth-0 bordered">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne2"
                                aria-expanded="true" aria-controls="collapseOne2">
                                <asp:Label ID="lblUser" runat="server" Text='<%#Eval("usu_nome") %>' />
                            </button>
                        </h5>
                    </div>
                    <div id="collapseOne2" class="collapse" aria-labelledby="headingOne2"
                        data-parent="#usuarios-accordion">
                        <div class="card-body">
                            E-mail:
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("usu_email") %>' />
                            Status:
                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("usu_status") %>' />
                            Permissao:
                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("usu_permissao") %>' />
                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>
        </div>
</asp:Content>
