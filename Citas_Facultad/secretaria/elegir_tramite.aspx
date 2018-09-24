<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraSecretario.Master" CodeBehind="elegir_tramite.aspx.vb" Inherits="Citas_Facultad.elegir_tramite" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <div style="text-align: initial;">
        <h3>
            <asp:Label ID="Label2" runat="server" Text="Trámites" meta:resourcekey="Label2Resource1"></asp:Label></h3>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Seleccione el Grado y el trámite que desea citar." meta:resourcekey="Label3Resource1"></asp:Label>
        </p>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="form-group" style="text-align: left;">
                <label for="grado">
                    <asp:Label ID="Label5" runat="server" Text="Grado en:" meta:resourcekey="Label5Resource1"></asp:Label></label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT nombre, Id FROM Grado"></asp:SqlDataSource>
                <asp:DropDownList ID="grado" runat="server" AutoPostBack="True" class="form-control" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="Id" meta:resourcekey="gradoResource1"></asp:DropDownList>
            </div>
            <div class="form-group" style="text-align: left;">
                <label for="tramite">
                    <asp:Label ID="Label6" runat="server" Text="Trámite:" meta:resourcekey="Label6Resource1"></asp:Label></label>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT Tareas.nombre, Tareas.Id FROM (Tareas INNER JOIN EdificioTramite ON Tareas.Id = EdificioTramite.idTarea) INNER JOIN Grado ON EdificioTramite.idEdificio = Grado.idEdificio WHERE (Grado.Id = @Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="grado" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="tramite" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="Id" AutoPostBack="True" meta:resourcekey="tramiteResource1">
                </asp:DropDownList>
            </div>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT desde, hasta FROM DisponibilidadTareas WHERE (idTarea = @idTarea) ORDER BY desde ASC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tramite" Name="idTarea" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server" Text="Fechas en las que está abierto el trámite" meta:resourcekey="Label1Resource1"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" AllowSorting="True" meta:resourcekey="GridView1Resource1">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="desde" HeaderText="Abierto desde" SortExpression="desde" meta:resourcekey="BoundFieldResource1" />
                    <asp:BoundField DataField="hasta" HeaderText="Hasta" SortExpression="hasta" meta:resourcekey="BoundFieldResource2" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Siguiente" class="btn btn-primary" meta:resourcekey="Button1Resource1" />
            <br />
            <asp:Label ID="msg" runat="server" meta:resourcekey="msgResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
