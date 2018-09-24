<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraUsuario.Master" CodeBehind="cancelar_cita.aspx.vb" Inherits="Citas_Facultad.cancelar_cita" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <h3>
        <asp:Label ID="Label1" runat="server" Text="Cancelar cita previa" meta:resourcekey="Label1Resource1"></asp:Label></h3>
    <div class="form-group">
        <asp:Label for="tbCodigo" ID="Label2" runat="server" Text="Código de la cita que deseas cancelar" meta:resourcekey="Label2Resource1"></asp:Label>
        <asp:TextBox ID="tbCodigo" runat="server" CssClass="form-control" TextMode="Number" meta:resourcekey="tbCodigoResource1"></asp:TextBox>
    </div>
    <asp:Button ID="Button1" runat="server" Text="Cancelar cita" CssClass="btn btn-primary" meta:resourcekey="Button1Resource1"/>
    <br />
    <asp:Panel ID="Panel2" runat="server" CssClass="invisible" meta:resourcekey="Panel2Resource1">
        <asp:Label ID="Label3" runat="server" Text="Código de la cita: " meta:resourcekey="Label3Resource1"></asp:Label>
        <asp:Label ID="codigo" runat="server" meta:resourcekey="codigoResource1"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Día de la cita: " meta:resourcekey="Label4Resource1"></asp:Label>
        <asp:Label ID="dia" runat="server" meta:resourcekey="diaResource1"></asp:Label>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Hora de la cita: " meta:resourcekey="Label5Resource1"></asp:Label>
        <asp:Label ID="hora" runat="server" meta:resourcekey="horaResource1"></asp:Label>
        <br />
    </asp:Panel>
    <asp:Label ID="msg" runat="server" meta:resourcekey="msgResource1"></asp:Label>
    <asp:Panel ID="Panel1" runat="server" CssClass="invisible" meta:resourcekey="Panel1Resource1">
        <asp:Label ID="Label6" runat="server" Text="¿Estás seguro de que quieres cancelar la cita?" meta:resourcekey="Label6Resource1"></asp:Label>
        <div class="row">
            <div class="col-sm-5"></div>
            <div class="col-sm-1">
                <asp:Button ID="btnSi" runat="server" Text="Sí" meta:resourcekey="btnSiResource1" />
            </div>
            <div class="col-sm-1">
                <asp:Button ID="btnNo" runat="server" Text="No" meta:resourcekey="btnNoResource1" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
