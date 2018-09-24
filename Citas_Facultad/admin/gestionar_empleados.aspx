<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAdmin.Master" CodeBehind="gestionar_empleados.aspx.vb" Inherits="Citas_Facultad.gestionar_empleados" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <div class="row">
        <div class="col-sm-6 d-flex flex-column">
            <asp:Button ID="Button1" runat="server" Text="Gestionar Horarios" class="mt-auto" meta:resourcekey="Button1Resource1" />
        </div>
        <div class="col-sm-6 d-flex flex-column">
            <asp:Button ID="Button2" runat="server" Text="Añadir Empleado" class="mt-auto" meta:resourcekey="Button2Resource1" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-3"></div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" DeleteCommand="DELETE FROM Usuarios WHERE email = @original_email AND dni = @original_dni" InsertCommand="INSERT INTO Usuarios (email, dni) VALUES (@email, @dni)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT email, dni FROM Usuarios WHERE (tipo = 'Secretario')" UpdateCommand="UPDATE Usuarios SET dni = @dni WHERE email = @original_email AND dni = @original_dni">
                        <DeleteParameters>
                            <asp:Parameter Name="original_email" Type="String" />
                            <asp:Parameter Name="original_dni" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="dni" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="dni" Type="String" />
                            <asp:Parameter Name="original_email" Type="String" />
                            <asp:Parameter Name="original_dni" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <div class="col-9">
                        <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" AllowPaging="True" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="email" CellPadding="4" ForeColor="#333333" GridLines="None" meta:resourcekey="GridView1Resource1">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" AccessibleHeaderText="Edición" HeaderText="Edición" meta:resourcekey="CommandFieldResource1" />
                                <asp:BoundField DataField="email" HeaderText="Email" ReadOnly="True" SortExpression="email" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="dni" HeaderText="DNI" SortExpression="dni" meta:resourcekey="BoundFieldResource2" />
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
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
