<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="imprimir_historial.aspx.vb" Inherits="Citas_Facultad.imprimir_historial" meta:resourcekey="PageResource1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT * FROM OtrasCitas ORDER BY dia, hora"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" EditRowStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" AutoGenerateColumns="False" DataKeyNames="idCita" DataSourceID="SqlDataSource1" meta:resourcekey="GridView1Resource1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="idCita" HeaderText="Código cita" ReadOnly="True" SortExpression="idCita" meta:resourcekey="BoundFieldResource1" />
                    <asp:BoundField DataField="nombreTarea" HeaderText="Trámite" SortExpression="nombreTarea" meta:resourcekey="BoundFieldResource2" />
                    <asp:BoundField DataField="duracion" HeaderText="Duración" SortExpression="duracion" meta:resourcekey="BoundFieldResource3" />
                    <asp:BoundField DataField="dia" HeaderText="Día" SortExpression="dia" meta:resourcekey="BoundFieldResource4" />
                    <asp:BoundField DataField="hora" HeaderText="Hora" SortExpression="hora" meta:resourcekey="BoundFieldResource5" />
                    <asp:BoundField DataField="emailSecretario" HeaderText="Email secretario/a" SortExpression="emailSecretario" meta:resourcekey="BoundFieldResource6" />
                    <asp:BoundField DataField="emailAlumno" HeaderText="Email alumno/a" SortExpression="emailAlumno" meta:resourcekey="BoundFieldResource7" />
                    <asp:BoundField DataField="estado" HeaderText="Comentario" SortExpression="estado" meta:resourcekey="BoundFieldResource8" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" HorizontalAlign="Left" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
<script>
    window.print();
</script>