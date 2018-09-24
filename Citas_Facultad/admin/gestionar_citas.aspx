<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAdmin.Master" CodeBehind="gestionar_citas.aspx.vb" Inherits="Citas_Facultad.gestionar_citas" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <asp:Calendar ID="Calendar1" AutoPostBack="True" runat="server" BackColor="White" BorderColor="#999999" CellPadding="5" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="220px" Width="100%" meta:resourcekey="Calendar1Resource1">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar>
        </div>
    </div>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="<%$ ConnectionStrings:DatabaseConnectionString.ProviderName %>" SelectCommand="SELECT Id, nombre FROM edificio"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" AutoPostBack="True" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="Id"></asp:DropDownList>
    <br />
    <asp:CheckBox ID="CheckBox1" AutoPostBack="True" runat="server" />
    <asp:Label ID="Label1" runat="server" Text="Filtrar por trámite"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="<%$ ConnectionStrings:DatabaseConnectionString.ProviderName %>" SelectCommand="SELECT Id, nombre FROM tareas WHERE Id IN (SELECT idTarea FROM edificiotramite WHERE idEdificio = @nombre)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="nombre" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList2" AutoPostBack="True" Width="70%" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="Id"></asp:DropDownList>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" meta:resourcekey="GridView1Resource1" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
    <asp:Label ID="msg" runat="server" meta:resourcekey="msgResource1"></asp:Label>
    <asp:Panel ID="Panel1" runat="server" CssClass="invisible" meta:resourcekey="Panel1Resource1">
        <asp:Label ID="Label6" runat="server" Text="¿Estás seguro de que quieres cancelar la cita? (Se le notificará al alumno por email)" meta:resourcekey="Label6Resource1"></asp:Label>
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
