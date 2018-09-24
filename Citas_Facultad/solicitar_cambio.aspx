<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAnon.Master" CodeBehind="solicitar_cambio.aspx.vb" Inherits="Citas_Facultad.solicitar_cambio" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <div class="form-group row">
        <label for="email" class="col-sm-2 col-form-label" style="text-align: initial;">Email</label>
        <div class="col-sm-10">
            <asp:TextBox ID="email" runat="server" class="form-control" meta:resourcekey="emailResource1"></asp:TextBox>
        </div>
    </div>
    <asp:Button ID="Button1" runat="server" Text="Solicitar cambio de contraseña" class="btn btn-primary" meta:resourcekey="Button1Resource1" />
    <br />
    <asp:Label ID="msg" runat="server" Text=""></asp:Label>
    <asp:RegularExpressionValidator Style="visibility: unset; color: red;" ID="RegularExpressionValidator1" runat="server" ErrorMessage="<br/>No es un email válido" ControlToValidate="email" EnableClientScript="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator Style="visibility: unset; color: red;" ID="RequiredFieldValidator1" runat="server" ErrorMessage="<br/>El campo del email no puede estar vacío" EnableClientScript="False" ControlToValidate="email" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
