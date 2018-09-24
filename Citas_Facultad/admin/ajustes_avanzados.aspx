<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAdmin.Master" CodeBehind="ajustes_avanzados.aspx.vb" Inherits="Citas_Facultad.ajustes_avanzados" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Actualizar base de datos" CssClass="btn btn-primary" meta:resourcekey="Button1Resource1"/>
    <asp:button ID="Button2" runat="server" Text="Borrar base de datos" CssClass="btn btn-danger" meta:resourcekey="Button2Resource1"/>
    <br />
    <asp:Label ID="msg" runat="server" meta:resourcekey="msgResource1"></asp:Label>
    <asp:Panel ID="Panel1" runat="server" CssClass="invisible" meta:resourcekey="Panel1Resource1">
        <asp:Label ID="Label6" runat="server" Text="¿Estás seguro de que quieres borrar la base de datos?" meta:resourcekey="Label6Resource1"></asp:Label>
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-1">
                <asp:Button ID="btnSi" runat="server" Text="Sí" meta:resourcekey="btnSiResource1" />
            </div>
            <div class="col-sm-1">
                <asp:Button ID="btnNo" runat="server" Text="No" meta:resourcekey="btnNoResource1" />
            </div>
            <div class="col-sm-1">
                <asp:Button ID="btnImprimir" runat="server" Text="Imprimir historial de citas" meta:resourcekey="btnImprimirResource1" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
