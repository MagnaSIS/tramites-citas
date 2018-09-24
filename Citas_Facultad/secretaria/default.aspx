<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraSecretario.Master" CodeBehind="default.aspx.vb" Inherits="Citas_Facultad._default1" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <h3>
        <asp:Label ID="Label1" runat="server" Text="Citas de hoy" meta:resourcekey="Label1Resource1"></asp:Label></h3>
    <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" Width="100%" GridLines="None" meta:resourcekey="GridView1Resource1">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="No ha venido" meta:resourcekey="CommandFieldResource1" />
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
    <asp:Button ID="Button1" runat="server" Text="Imprimir las citas de hoy" meta:resourcekey="Button1Resource1" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
