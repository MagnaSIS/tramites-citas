<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraSecretario.Master" CodeBehind="confirmacion.aspx.vb" Inherits="Citas_Facultad.confirmacion1" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <div style="align-content: initial">
        <h3>
            <asp:Label ID="Label7" runat="server" Text="Trámites" meta:resourcekey="Label7Resource1"></asp:Label></h3>
        <p>
            <asp:Label ID="Label8" runat="server" Text="Su solicitud ha sido registrada con éxito. Recibirás un email confirmando los datos de la cita previa." meta:resourcekey="Label8Resource1"></asp:Label></p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT Disponibilidad.dia AS dia, Disponibilidad.horaInit AS hora, Tareas.nombre AS tramite, Tareas.duracion AS duracion, Edificio.nombre AS edificio, Edificio.direccion AS direccion FROM (((Citas INNER JOIN Tareas ON Citas.idTarea=Tareas.Id) INNER JOIN Disponibilidad ON Citas.Id=Disponibilidad.idCita) INNER JOIN Usuarios ON Disponibilidad.dni=Usuarios.dni) INNER JOIN Edificio ON Usuarios.idEdificio=Edificio.Id WHERE (Citas.Id = @Id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Id" QueryStringField="cita" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Panel ID="Panel2" runat="server" meta:resourcekey="Panel2Resource1">
            <table width="100%">
                <tr>
                    <th>
                        <asp:Label ID="Label1" runat="server" Text="Código de cita" meta:resourcekey="Label1Resource1"></asp:Label></th>
                    <th>
                        <asp:Label ID="Label2" runat="server" Text="Día" meta:resourcekey="Label2Resource1"></asp:Label></th>
                    <th>
                        <asp:Label ID="Label3" runat="server" Text="Hora" meta:resourcekey="Label3Resource1"></asp:Label></th>
                    <th>
                        <asp:Label ID="Label4" runat="server" Text="Duración aproximada" meta:resourcekey="Label4Resource1"></asp:Label></th>
                                        <th>
                        <asp:Label ID="Label5" runat="server" Text="Trámite" meta:resourcekey="Label5Resource2"></asp:Label></th>
                    <th>
                        <asp:Label ID="Label9" runat="server" Text="Edificio" meta:resourcekey="Label9Resource1"></asp:Label></th>
                    <th>
                        <asp:Label ID="Label10" runat="server" Text="Dirección" meta:resourcekey="Label10Resource1"></asp:Label></th>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="codigo" runat="server" meta:resourcekey="codigoResource1"></asp:Label></td>
                    <td>
                        <asp:Label ID="dia" runat="server" meta:resourcekey="diaResource1"></asp:Label></td>
                    <td>
                        <asp:Label ID="hora" runat="server" meta:resourcekey="horaResource1"></asp:Label></td>
                    <td>
                        <asp:Label ID="duracion" runat="server" meta:resourcekey="duracionResource1"></asp:Label></td>
                    <td>
                        <asp:Label ID="tramite" runat="server" meta:resourcekey="tramiteResource1"></asp:Label></td>
                    <td>
                        <asp:Label ID="edificio" runat="server" meta:resourcekey="edificioResource1"></asp:Label></td>
                    <td>
                        <asp:Label ID="direccion" runat="server" meta:resourcekey="direccionResource1"></asp:Label></td>
                   </tr>
            </table>

        </asp:Panel>

    </div>
    <br />
    <asp:Button ID="Button1" runat="server" class="btn btn-outline-danger" Text="Anular cita" meta:resourcekey="Button1Resource1" />
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/usuario/default.aspx" class="btn btn-outline-success" meta:resourcekey="HyperLink2Resource1" Text="Otra cita previa"></asp:HyperLink>
    <br />
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
