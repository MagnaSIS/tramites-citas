<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAnon.Master" CodeBehind="confirmar_registro.aspx.vb" Inherits="Citas_Facultad.confirmar_registro"  meta:resourcekey="PageResource1"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <h3><asp:Localize ID="Localize1" runat="server" meta:resourcekey="ConfirmarRegistroLabel" Text="Confirmar Registro"/></h3>
    <br />
    <div class="form-group row">
        <label for="email" class="col-sm-2 col-form-label" style="text-align: initial;">Email</label>
        <div class="col-sm-10">
            <asp:TextBox ID="email" runat="server" class="form-control" ReadOnly="True" meta:resourcekey="emailResource1"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <label for="clave" class="col-sm-2 col-form-label" style="text-align: initial;"><asp:Localize ID="Localize3" runat="server" meta:resourcekey="claveConfirmacionLabel" Text="Clave de confirmación"/></label>
        <div class="col-sm-10">
            <asp:TextBox ID="clave" runat="server" class="form-control" ReadOnly="True" meta:resourcekey="claveResource1"></asp:TextBox>
        </div>
    </div>
    <asp:Button ID="Button1" runat="server" Text="Confirmar registro" class="btn btn-primary" meta:resourcekey="Button1Resource1" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
