<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAdmin.Master" CodeBehind="modificar_disp_tramites.aspx.vb" Inherits="Citas_Facultad.modificar_disp_tramites" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <h3>
        <asp:Label ID="Label2" runat="server" Text="Modificar disponibilidad de los trámites" meta:resourcekey="Label2Resource1"></asp:Label></h3>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT nombre, Id FROM Tareas"></asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="Id" AutoPostBack="True" meta:resourcekey="DropDownList1Resource1"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" DeleteCommand="DELETE FROM DisponibilidadTareas WHERE Id = @original_Id AND desde = @original_desde AND hasta = @original_hasta" InsertCommand="INSERT INTO DisponibilidadTareas (desde, hasta) VALUES (@desde, @hasta)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Id, desde, hasta FROM DisponibilidadTareas WHERE (idTarea = @idTarea)" UpdateCommand="UPDATE DisponibilidadTareas SET desde = @desde, hasta = @hasta WHERE Id = @original_Id AND desde = @original_desde AND hasta = @original_hasta">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_desde" Type="String" />
                    <asp:Parameter Name="original_hasta" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="desde" Type="String" />
                    <asp:Parameter Name="hasta" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="idTarea" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="desde" Type="String" />
                    <asp:Parameter Name="hasta" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_desde" Type="String" />
                    <asp:Parameter Name="original_hasta" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" meta:resourcekey="GridView1Resource1">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" SortExpression="Id" meta:resourcekey="BoundFieldResource1" />
                    <asp:BoundField DataField="desde" HeaderText="Desde" SortExpression="desde" meta:resourcekey="BoundFieldResource2" />
                    <asp:BoundField DataField="hasta" HeaderText="Hasta" SortExpression="hasta" meta:resourcekey="BoundFieldResource3" />
                    <asp:CommandField ShowSelectButton="True" SelectText="Eliminar" meta:resourcekey="CommandFieldResource1" />
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
            <asp:Panel ID="Panel1" runat="server" CssClass="invisible" meta:resourcekey="Panel1Resource1">
                <asp:Label ID="Label1" runat="server" Text="¿Estás seguro de que quieres eliminar esa tarea?" meta:resourcekey="Label1Resource1"></asp:Label>
                <div class="row">
                    <div class="col-sm-5"></div>
                    <div class="col-sm-1">
                        <asp:Button ID="btnSi" runat="server" Text="Sí" meta:resourcekey="btnSiResource1" />
                    </div>
                    <div class="col-sm-1">
                        <asp:Button ID="btnNo" runat="server" Text="No" meta:resourcekey="btnNoResource1" />
                    </div>
                </div>
                <br />
            </asp:Panel>
            <asp:Label ID="msg" runat="server" meta:resourcekey="msgResource1"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Añadir disponibilidad" meta:resourcekey="Button1Resource1" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
