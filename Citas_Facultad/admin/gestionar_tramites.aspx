<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAdmin.Master" CodeBehind="gestionar_tramites.aspx.vb" Inherits="Citas_Facultad.gestionar_tramites" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <h3>
        <asp:Label ID="Label2" runat="server" Text="Gestionar trámites" meta:resourcekey="Label2Resource1"></asp:Label></h3>
    <div class="row">
        <div class="col-sm-3">
            <asp:Button ID="Button1" runat="server" Text="Añadir trámite" meta:resourcekey="Button1Resource1" />
        </div>
        <div class="col-sm-5">
            <asp:Button ID="Button2" runat="server" Text="Modificar disponibilidad trámite" meta:resourcekey="Button2Resource1" />
        </div>
        <div class="col-sm-4">
            <asp:Button ID="Button3" runat="server" Text="Modificar secretarios trámite" meta:resourcekey="Button3Resource1"/>
        </div>
    </div>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" DeleteCommand="DELETE FROM Tareas WHERE Id = @original_Id AND nombre = @original_nombre AND duracion = @original_duracion" InsertCommand="INSERT INTO Tareas (nombre, duracion) VALUES (@nombre, @duracion)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM Tareas" UpdateCommand="UPDATE Tareas SET nombre = @nombre, duracion = @duracion WHERE Id = @original_Id AND nombre = @original_nombre AND duracion = @original_duracion">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_nombre" Type="String" />
                    <asp:Parameter Name="original_duracion" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="duracion" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="duracion" Type="Int32" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_nombre" Type="String" />
                    <asp:Parameter Name="original_duracion" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" AutoPostBack="True" meta:resourcekey="GridView1Resource1">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Código" SortExpression="Id" meta:resourcekey="BoundFieldResource3" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre del trámite" SortExpression="nombre" meta:resourcekey="BoundFieldResource1" />
                    <asp:BoundField DataField="duracion" HeaderText="Duración" SortExpression="duracion" meta:resourcekey="BoundFieldResource2" />
                    <asp:CommandField ShowEditButton="True" meta:resourcekey="CommandFieldResource1" ShowSelectButton="True" SelectText="Eliminar" />
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
            <asp:Label ID="Label1" runat="server" Text="Cuidado: si modificas la duración del trámite, las citas de dicho trámite podrían verse modificadas" meta:resourcekey="Label1Resource1"></asp:Label>
            <br />
            <asp:Label ID="msg" runat="server" meta:resourcekey="msgResource1"></asp:Label>
            <asp:Panel ID="Panel1" runat="server" CssClass="invisible" meta:resourcekey="Panel1Resource1">
                <asp:Label ID="Label6" runat="server" Text="¿Estás seguro de que quieres cancelar el trámite?" meta:resourcekey="Label6Resource1"></asp:Label>
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
