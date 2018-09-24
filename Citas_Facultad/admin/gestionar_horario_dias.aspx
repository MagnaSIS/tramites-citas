<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin/gestionar_horario.master" CodeBehind="gestionar_horario_dias.aspx.vb" Inherits="Citas_Facultad.gestionar_horario_dias" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <br />
    <h3>
        <asp:Label ID="Label19" runat="server" Text="Horario de intervalo" meta:resourcekey="Label19Resource1"></asp:Label></h3>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="form-group" style="text-align: left;">
                <label for="empleados">
                    <asp:Label ID="Label20" runat="server" Text="Seleccione el email del empleado:" meta:resourcekey="Label20Resource1"></asp:Label></label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT email, dni FROM Usuarios WHERE (tipo = 'Secretario')"></asp:SqlDataSource>
                <asp:DropDownList ID="empleados" runat="server" DataSourceID="SqlDataSource1" DataTextField="email" DataValueField="dni" CssClass="form-control" meta:resourcekey="empleadosResource1"></asp:DropDownList>
            </div>

            <div class="row" style="text-align: left;">
                <div class="col-sm-6">
                    <asp:Label ID="Label1" runat="server" Text="Selecciona desde" meta:resourcekey="Label1Resource1"></asp:Label>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="6" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="200px" Width="90%" meta:resourcekey="Calendar1Resource1">
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
                <div class="col-sm-6">
                    <asp:Label ID="Label2" runat="server" Text="Selecciona hasta" meta:resourcekey="Label2Resource1"></asp:Label>
                    <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#999999" CellPadding="6" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="200px" Width="90%" meta:resourcekey="Calendar2Resource1">
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
            <asp:Label ID="Label18" runat="server" Text="Las horas deben ir en intervalos de 15 (:00, :15, :30, :45)" meta:resourcekey="Label18Resource1"></asp:Label>
            <div class="row" style="text-align: left;">
                <div class="col-sm-2">
                    <asp:Label ID="Label3" runat="server" Text="Lunes" Font-Bold="True" meta:resourcekey="Label3Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="Label8" runat="server" Text="Hora desde" meta:resourcekey="Label8Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="horaInitLunes" runat="server" MaxLength="5" Width="80px" meta:resourcekey="horaInitLunesResource1"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:Label ID="Label13" runat="server" Text="hasta" meta:resourcekey="Label13Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="horaFinLunes" runat="server" MaxLength="5" Width="80px" meta:resourcekey="horaFinLunesResource1"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="text-align: left;">
                <div class="col-sm-2">
                    <asp:Label ID="Label4" runat="server" Text="Martes" Font-Bold="True" meta:resourcekey="Label4Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="Label9" runat="server" Text="Hora desde" meta:resourcekey="Label9Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="horaInitMartes" runat="server" MaxLength="5" Width="80px" meta:resourcekey="horaInitMartesResource1"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:Label ID="Label14" runat="server" Text="hasta" meta:resourcekey="Label14Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="horaFinMartes" runat="server" MaxLength="5" Width="80px" meta:resourcekey="horaFinMartesResource1"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="text-align: left;">
                <div class="col-sm-2">
                    <asp:Label ID="Label5" runat="server" Text="Miércoles" Font-Bold="True" meta:resourcekey="Label5Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="Label10" runat="server" Text="Hora desde" meta:resourcekey="Label10Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="horaInitMiercoles" runat="server" MaxLength="5" Width="80px" meta:resourcekey="horaInitMiercolesResource1"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:Label ID="Label15" runat="server" Text="hasta" meta:resourcekey="Label15Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="horaFinMiercoles" runat="server" MaxLength="5" Width="80px" meta:resourcekey="horaFinMiercolesResource1"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="text-align: left;">
                <div class="col-sm-2">
                    <asp:Label ID="Label6" runat="server" Text="Jueves" Font-Bold="True" meta:resourcekey="Label6Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="Label11" runat="server" Text="Hora desde" meta:resourcekey="Label11Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="horaInitJueves" runat="server" MaxLength="5" Width="80px" meta:resourcekey="horaInitJuevesResource1"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:Label ID="Label16" runat="server" Text="hasta" meta:resourcekey="Label16Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="horaFinJueves" runat="server" MaxLength="5" Width="80px" meta:resourcekey="horaFinJuevesResource1"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="text-align: left;">
                <div class="col-sm-2">
                    <asp:Label ID="Label7" runat="server" Text="Viernes" Font-Bold="True" meta:resourcekey="Label7Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="Label12" runat="server" Text="Hora desde" meta:resourcekey="Label12Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="horaInitViernes" runat="server" MaxLength="5" Width="80px" meta:resourcekey="horaInitViernesResource1"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:Label ID="Label17" runat="server" Text="hasta" meta:resourcekey="Label17Resource1"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="horaFinViernes" runat="server" MaxLength="5" Width="80px" meta:resourcekey="horaFinViernesResource1"></asp:TextBox>
                </div>
            </div>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Insertar disponibilidad" meta:resourcekey="Button1Resource1" />
            <br />
            <br />
            <div style="text-align: left;">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="horaInitLunes" EnableClientScript="False" ValidationExpression="([01]?[0-9]|2[0-3]):(00|15|30|45)" meta:resourcekey="RegularExpressionValidator1Resource1">El formato de la hora inicial del lunes es incorrecto (hh:mm)<br /></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" EnableClientScript="False" ControlToValidate="horaFinLunes" ValidationExpression="([01]?[0-9]|2[0-3]):(00|15|30|45)" meta:resourcekey="RegularExpressionValidator2Resource1">El formato de la hora final del lunes es incorrecto (hh:mm)<br /></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="horaInitMartes" EnableClientScript="False" ValidationExpression="([01]?[0-9]|2[0-3]):(00|15|30|45)" meta:resourcekey="RegularExpressionValidator3Resource1">El formato de la hora inicial del martes es incorrecto (hh:mm)<br /></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" EnableClientScript="False" ControlToValidate="horaFinMartes" ValidationExpression="([01]?[0-9]|2[0-3]):(00|15|30|45)" meta:resourcekey="RegularExpressionValidator4Resource1">El formato de la hora final del martes es incorrecto (hh:mm)<br /></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="horaInitMiercoles" EnableClientScript="False" ValidationExpression="([01]?[0-9]|2[0-3]):(00|15|30|45)" meta:resourcekey="RegularExpressionValidator5Resource1">El formato de la hora inicial del miércoles es incorrecto (hh:mm)<br /></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="RegularExpressionValidator" EnableClientScript="False" ControlToValidate="horaFinMiercoles" ValidationExpression="([01]?[0-9]|2[0-3]):(00|15|30|45)" meta:resourcekey="RegularExpressionValidator6Resource1">El formato de la hora final del miércoles es incorrecto (hh:mm)<br /></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="horaInitJueves" EnableClientScript="False" ValidationExpression="([01]?[0-9]|2[0-3]):(00|15|30|45)" meta:resourcekey="RegularExpressionValidator7Resource1">El formato de la hora inicial del jueves es incorrecto (hh:mm)<br /></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="RegularExpressionValidator" EnableClientScript="False" ControlToValidate="horaFinJueves" ValidationExpression="([01]?[0-9]|2[0-3]):(00|15|30|45)" meta:resourcekey="RegularExpressionValidator8Resource1">El formato de la hora final del jueves es incorrecto (hh:mm)<br /></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="horaInitViernes" EnableClientScript="False" ValidationExpression="([01]?[0-9]|2[0-3]):(00|15|30|45)" meta:resourcekey="RegularExpressionValidator9Resource1">El formato de la hora inicial del viernes es incorrecto (hh:mm)<br /></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ErrorMessage="RegularExpressionValidator" EnableClientScript="False" ControlToValidate="horaFinViernes" ValidationExpression="([01]?[0-9]|2[0-3]):(00|15|30|45)" meta:resourcekey="RegularExpressionValidator10Resource1">El formato de la hora final del viernes es incorrecto (hh:mm)<br /></asp:RegularExpressionValidator>
                <asp:Label ID="msg" runat="server" meta:resourcekey="msgResource1"></asp:Label>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
