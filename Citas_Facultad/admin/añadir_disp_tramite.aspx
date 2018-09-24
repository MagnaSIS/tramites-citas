<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAdmin.Master" CodeBehind="añadir_disp_tramite.aspx.vb" Inherits="Citas_Facultad.añadir_disp_tramite" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT nombre FROM Tareas WHERE (Id = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text="Nombre: " meta:resourcekey="Label1Resource1"></asp:Label>
    <asp:Label ID="nombre" runat="server" meta:resourcekey="nombreResource1"></asp:Label>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-sm-6" style="text-align: left;">
                    <asp:Label ID="Label2" runat="server" Text="Desde" meta:resourcekey="Label2Resource1"></asp:Label>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="5" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="220px" Width="90%" meta:resourcekey="Calendar1Resource1">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="Gray" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </div>
                <div class="col-sm-6" style="text-align: left;">
                    <asp:Label ID="Label3" runat="server" Text="Hasta" meta:resourcekey="Label3Resource1"></asp:Label>
                    <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#999999" CellPadding="5" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="220px" Width="90%" meta:resourcekey="Calendar2Resource1">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="Gray" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </div>
            </div>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Añadir disponibilidad entre fechas" meta:resourcekey="Button1Resource1" />
            <asp:Label ID="Label4" runat="server" Text="&nbsp;&nbsp;" meta:resourcekey="Label4Resource1"></asp:Label>
            <asp:Button ID="Button2" runat="server" Text="Siguiente" meta:resourcekey="Button2Resource1" />
            <br />
            <asp:Label ID="msg" runat="server" meta:resourcekey="msgResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
