<%@ Page Title="Ver citas" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraSecretario.Master" CodeBehind="ver_citas.aspx.vb" Inherits="Citas_Facultad.ver_citas" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <div style="text-align: left;">
        <h3>
            <asp:Label ID="Label1" runat="server" Text="Ver todas las citas" meta:resourcekey="Label1Resource1"></asp:Label>
        </h3>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Selecciona el día:" meta:resourcekey="Label2Resource1"></asp:Label>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Calendar ID="Calendar1" AutoPostBack="true" runat="server" Width="100%" BackColor="White" BorderColor="#999999" CellPadding="5" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="220px" meta:resourcekey="Calendar1Resource1">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="Gray" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar>
            <br />
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" Width="100%" GridLines="None" meta:resourcekey="GridView1Resource1">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Eliminar" meta:resourcekey="CommandFieldResource1" />
                </Columns>
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
            <div style="text-align: left;">
                <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1"></asp:Label>
            </div>
            <asp:GridView ID="GridView2" runat="server" CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None" meta:resourcekey="GridView2Resource1">
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
