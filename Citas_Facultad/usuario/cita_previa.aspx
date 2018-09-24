<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraUsuario.Master" CodeBehind="cita_previa.aspx.vb" Inherits="Citas_Facultad.cita_previa" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <div style="text-align: initial;">
        <asp:SqlDataSource ID="sqlGrado" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT nombre FROM Grado WHERE (Id = @Id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Id" QueryStringField="grado" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlTramite" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT nombre FROM Tareas WHERE (Id = @Id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Id" QueryStringField="tramite" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlEdificio" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT nombre, direccion FROM Edificio WHERE (Id = (SELECT idEdificio FROM Grado WHERE Grado.Id = @Id))">
            <SelectParameters>
                <asp:QueryStringParameter Name="Id" QueryStringField="grado" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <h3>
            <asp:Label ID="Label6" runat="server" Text="Trámites" meta:resourcekey="Label6Resource1"></asp:Label></h3>
        <asp:Label ID="Label1" runat="server" Text="Grado: " meta:resourcekey="Label1Resource1"></asp:Label>
        <asp:Label ID="grado" runat="server" meta:resourcekey="gradoResource1"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Trámite: " meta:resourcekey="Label2Resource1"></asp:Label>
        <asp:Label ID="tramite" runat="server" meta:resourcekey="tramiteResource1"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Edificio: " meta:resourcekey="Label3Resource1"></asp:Label>
        <asp:Label ID="edificio" runat="server" meta:resourcekey="edificioResource1"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Seleccione el dia y la hora de las opciones disponibles" meta:resourcekey="Label4Resource1"></asp:Label>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row" style="padding-top: 10px;">
                <div class="col-sm-5">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="5" DayNameFormat="Shortest" Font-Names="Verdana" AutoPostBack="true" Font-Size="8pt" ForeColor="Black" Height="220px" Width="90%" meta:resourcekey="Calendar1Resource1">
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
                <div class="col-sm-1"></div>
                <div class="col-sm-6" style="text-align: initial;">
                    <div class="form-group">
                        <label for="citasDDL">
                            <asp:Label ID="Label5" runat="server" Text="Citas disponibles:" meta:resourcekey="Label5Resource1"></asp:Label></label>
                        <asp:DropDownList ID="citasDDL" runat="server" class="form-control" AutoPostBack="True" meta:resourcekey="citasDDLResource1">
                        </asp:DropDownList>
                    </div>
                    <asp:Label ID="msg" runat="server" meta:resourcekey="msgResource1"></asp:Label>
                    <asp:Button ID="Button1" runat="server" Text="Reservar cita" class="btn btn-primary" meta:resourcekey="Button1Resource1"/>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>

