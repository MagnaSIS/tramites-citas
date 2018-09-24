<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin/gestionar_horario.master" CodeBehind="gestionar_horario_dia.aspx.vb" Inherits="Citas_Facultad.gestionar_horario_dia" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <br />
    <h3>
        <asp:Label ID="Label3" runat="server" Text="Horario de día" meta:resourcekey="Label3Resource1"></asp:Label></h3>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="form-group" style="text-align: left;">
                <label for="empleados">
                    <asp:Label ID="Label4" runat="server" Text="Seleccione el email del empleado:" meta:resourcekey="Label4Resource1"></asp:Label></label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT email, dni FROM Usuarios WHERE (tipo = 'Secretario')"></asp:SqlDataSource>
                <asp:DropDownList ID="empleados" runat="server" DataSourceID="SqlDataSource1" DataTextField="email" DataValueField="dni" CssClass="form-control" meta:resourcekey="empleadosResource1"></asp:DropDownList>
            </div>

            <div class="row">
                <div class="col-sm-5">
                    <asp:Label ID="Label1" runat="server" Text="Selecciona el día" meta:resourcekey="Label1Resource1"></asp:Label>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="6" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="200px" Width="220px" meta:resourcekey="Calendar1Resource1">
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
                <div class="col-sm-7">
                    <asp:Label ID="Label2" runat="server" Text="Las horas deben ir en intervalos de 15 (:00, :15, :30, :45)" meta:resourcekey="Label2Resource1"></asp:Label>
                    <div class="form-group" style="text-align: left;">
                        <label for="horaInit">
                            <asp:Label ID="Label5" runat="server" Text="Hora inicio de trabajo" meta:resourcekey="Label5Resource1"></asp:Label></label>
                        <asp:TextBox ID="horaInit" runat="server" CssClass="form-control" meta:resourcekey="horaInitResource1"></asp:TextBox>

                    </div>
                    <div class="form-group" style="text-align: left;">
                        <label for="horaFin">
                            <asp:Label ID="Label6" runat="server" Text="Hora fin de trabajo" meta:resourcekey="Label6Resource1"></asp:Label></label>
                        <asp:TextBox ID="horaFin" runat="server" CssClass="form-control" meta:resourcekey="horaFinResource1"></asp:TextBox>
                    </div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="horaInit" EnableClientScript="False" ValidationExpression="([01]?[0-9]|2[0-3]):(00|15|30|45)" meta:resourcekey="RegularExpressionValidator1Resource1">El formato de la hora inicial es incorrecto (hh:mm)<br /></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" EnableClientScript="False" ControlToValidate="horaFin" ValidationExpression="([01]?[0-9]|2[0-3]):(00|15|30|45)" meta:resourcekey="RegularExpressionValidator2Resource1">El formato de la hora final es incorrecto (hh:mm)<br /></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" Text="La hora de incio es obligatoria<br />" EnableClientScript="False" ControlToValidate="horaInit" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" EnableClientScript="False" ControlToValidate="horaFin" Text="La hora final es obligatoria<br />" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                    <asp:Label ID="msg" runat="server" meta:resourcekey="msgResource1"></asp:Label>
                </div>
            </div>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Insertar disponibilidad" meta:resourcekey="Button1Resource1" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
