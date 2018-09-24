<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin/gestionar_horario.master" CodeBehind="eliminar_horario.aspx.vb" Inherits="Citas_Facultad.eliminar_horario" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <br />
    <h3>
        <asp:Label ID="Label1" runat="server" Text="Eliminar horario" meta:resourcekey="Label1Resource1"></asp:Label></h3>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="form-group" style="text-align: left;">
                <label for="empleados">
                    <asp:Label ID="Label2" runat="server" Text="Seleccione el email del empleado:" meta:resourcekey="Label2Resource1"></asp:Label></label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT email, dni FROM Usuarios WHERE (tipo = 'Secretario')"></asp:SqlDataSource>
                <asp:DropDownList ID="empleados" runat="server" DataSourceID="SqlDataSource1" DataTextField="email" DataValueField="dni" CssClass="form-control" AutoPostBack="True" meta:resourcekey="empleadosResource1"></asp:DropDownList>
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" DeleteCommand="DELETE FROM Disponibilidad WHERE Id = @original_Id AND dia = @original_dia AND horaInit = @original_horaInit" InsertCommand="INSERT INTO Disponibilidad (dia, horaInit)VALUES (@dia, @horaInit)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Id, dia, horaInit FROM Disponibilidad WHERE (dni = @dni AND idCita IS NULL) ORDER BY dia ASC, horaInit ASC" UpdateCommand="UPDATE Disponibilidad SET dia = @dia, horaInit = @horaInit WHERE Id = @original_Id AND dia = @original_dia AND horaInit = @original_horaInit">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_dia" Type="String" />
                    <asp:Parameter Name="original_horaInit" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="dia" Type="String" />
                    <asp:Parameter Name="horaInit" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="empleados" Name="dni" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="dia" Type="String" />
                    <asp:Parameter Name="horaInit" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_dia" Type="String" />
                    <asp:Parameter Name="original_horaInit" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" meta:resourcekey="GridView1Resource1">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="dia" HeaderText="Día" SortExpression="dia" meta:resourcekey="BoundFieldResource1" />
                    <asp:BoundField DataField="horaInit" HeaderText="Hora" SortExpression="horaInit" meta:resourcekey="BoundFieldResource2" />
                    <asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource1" />
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
