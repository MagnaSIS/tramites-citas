<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAnon.Master" CodeBehind="default.aspx.vb" Inherits="Citas_Facultad.index" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Bienvenido/a al gestor de cita previa de la...
Desde este gestor podrás reservar cita previa en los trámites abiertos según cada momento.
En caso de querer anular la cita deberás hacerlo a través de este mismo gestor." meta:resourcekey="Label1Resource1"></asp:Label>
    <br />
    <br />
    <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="CITA PREVIA" meta:resourcekey="Button1Resource1" />
    <br />
    <br />
    <div class="row">
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
