<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAdmin.Master" CodeBehind="modificar_secre_tramite.aspx.vb" Inherits="Citas_Facultad.modificar_secre_tramite" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT Id, nombre FROM Tareas"></asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text="Elige el trámite:" meta:resourcekey="Label1Resource1"></asp:Label>
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="Id" meta:resourcekey="DropDownList1Resource1"></asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Label" meta:resourcekey="Label2Resource1"></asp:Label>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT email FROM SecreTramite WHERE (tramite = @tramite)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="tramite" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label3" runat="server" Text="Secretarios/as en el trámite" meta:resourcekey="Label3Resource1"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoPostBack="true" AutoGenerateColumns="False" HorizontalAlign="Center" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" meta:resourcekey="GridView1Resource1">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="email" HeaderText="Email secretario/a" SortExpression="email" meta:resourcekey="BoundFieldResource1" />
            <asp:CommandField ShowSelectButton="True" SelectText="Quitar" meta:resourcekey="CommandFieldResource1" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Secretarios/as disponibles:" meta:resourcekey="Label4Resource1"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT Usuarios.email FROM Usuarios WHERE Usuarios.email NOT IN (SELECT SecreTramite.email FROM SecreTramite WHERE (tramite = @Id)) AND Usuarios.tipo='Secretario'">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoPostBack="true" AutoGenerateColumns="False" HorizontalAlign="Center" CellPadding="4" DataKeyNames="email" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" meta:resourcekey="GridView2Resource1">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" meta:resourcekey="BoundFieldResource2" />
            <asp:CommandField SelectText="Agregar" ShowSelectButton="True" meta:resourcekey="CommandFieldResource2" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
