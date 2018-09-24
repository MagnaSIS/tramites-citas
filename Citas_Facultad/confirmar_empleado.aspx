<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAnon.Master" CodeBehind="confirmar_empleado.aspx.vb" Inherits="Citas_Facultad.confirmar_empleado" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <h3>
        <asp:Label ID="Label1" runat="server" Text="Confirmar registro de empleado/a" meta:resourcekey="Label1Resource1"></asp:Label></h3>
    <br />
    <div class="form-group row">
        <asp:Label ID="Label2" runat="server" for="email" CssClass="col-sm-2 col-form-label" style="text-align: initial;" Text="Email" meta:resourcekey="Label2Resource1"></asp:Label>
        <div class="col-sm-10">
            <asp:TextBox ID="email" runat="server" class="form-control" ReadOnly="True" meta:resourcekey="emailResource1"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <asp:Label ID="Label3" for="clave" CssClass="col-sm-2 col-form-label" style="text-align: initial;" runat="server" Text="Clave de confirmación" meta:resourcekey="Label3Resource1"></asp:Label>
        <div class="col-sm-10">
            <asp:TextBox ID="clave" runat="server" class="form-control" ReadOnly="True" meta:resourcekey="claveResource1"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <asp:Label ID="Label4" for="pass" class="col-sm-2 col-form-label" style="text-align: initial;" runat="server" Text="Contraseña" meta:resourcekey="Label4Resource1"></asp:Label>
        <div class="col-sm-10">
            <asp:TextBox ID="pass" runat="server" class="form-control" meta:resourcekey="passResource1" TextMode="Password"></asp:TextBox>
        </div>
    </div>
    <asp:Button ID="Button1" runat="server" Text="Confirmar registro" class="btn btn-primary" meta:resourcekey="Button1Resource1" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
