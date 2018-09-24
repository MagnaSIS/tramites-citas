<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAdmin.Master" CodeBehind="default.aspx.vb" Inherits="Citas_Facultad._default" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <div class="row">
        <div class="col-sm-4 d-flex flex-column">
            <h4>
                <asp:Label ID="Label1" runat="server" Text="Gestionar citas" meta:resourcekey="Label1Resource1"></asp:Label></h4>
            <p>
                <asp:Label ID="Label2" runat="server" Text="Desde aquí podrás gestionar las citas, podrás ver las citas que se han pedido y podras cancelarlas." meta:resourcekey="Label2Resource1"></asp:Label></p>
            <asp:Button ID="Button1" runat="server" Text="Gestionar Citas" class="mt-auto" meta:resourcekey="Button1Resource1"/>
        </div>
        <div class="col-sm-4 d-flex flex-column">
            <h4>
                <asp:Label ID="Label3" runat="server" Text="Gestionar trámites" meta:resourcekey="Label3Resource1"></asp:Label></h4>
            <p>
                <asp:Label ID="Label4" runat="server" Text="Desde aquí podrás gestionar los trámites, podrás abrir y cerrarlos, crear más, modificarlos..." meta:resourcekey="Label4Resource1"></asp:Label></p>
            <asp:Button ID="Button2" runat="server" Text="Gestionar Trámites" class="mt-auto" meta:resourcekey="Button2Resource1"/>
        </div>
        <div class="col-sm-4 d-flex flex-column">
            <h4>
                <asp:Label ID="Label5" runat="server" Text="Gestionar secretario/a" meta:resourcekey="Label5Resource1"></asp:Label></h4>
            <p>
                <asp:Label ID="Label6" runat="server" Text="Desde aquí podrás gestionar el horario de los/as secretarios/as, podrás añadir más y gestionar sus horarios." meta:resourcekey="Label6Resource1"></asp:Label></p>
            <asp:Button ID="Button3" runat="server" Text="Gestionar Secretarios/as" class="mt-auto" meta:resourcekey="Button3Resource1"/>
        </div>
    </div>
    <br />
    <div style="text-align: left;">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/admin/ajustes_avanzados.aspx" meta:resourcekey="HyperLink1Resource1">Ajustes avanzados</asp:HyperLink>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
