<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAdmin.Master" CodeBehind="añadir_empleado.aspx.vb" Inherits="Citas_Facultad.añadir_empleado" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
        <h3>
            <asp:Label ID="Label1" runat="server" Text="Registro de empleado/a" meta:resourcekey="Label1Resource1"></asp:Label></h3>
    <br />
    <div class="form-group row">
        <label for="staticEmail" class="col-sm-2 col-form-label" style="text-align: initial;">
            <asp:Label ID="Label2" runat="server" Text="Email" meta:resourcekey="Label2Resource1"></asp:Label></label>
        <div class="col-sm-10">
            <asp:TextBox ID="staticEmail" runat="server" class="form-control" placeholder="example@email.com" meta:resourcekey="staticEmailResource1"></asp:TextBox>
            <small id="emailHelp" class="form-text text-muted" style="float: left;">
                <asp:Label ID="Label3" runat="server" Text="El email no tiene por que ser de la UPV." meta:resourcekey="Label3Resource1"></asp:Label></small>
        </div>
    </div>
    <div class="form-group row">
        <label for="dni" class="col-sm-2 col-form-label" style="text-align: initial;">
            <asp:Label ID="Label4" runat="server" Text="DNI" meta:resourcekey="Label4Resource1"></asp:Label></label>
        <div class="col-sm-10">
            <asp:TextBox ID="dni" runat="server" class="form-control" meta:resourcekey="dniResource1"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <label for="edificio" class="col-sm-2 col-form-label" style="text-align: initial;">
            <asp:Label ID="Label5" runat="server" Text="Grado" meta:resourcekey="Label5Resource1"></asp:Label></label>
        <div class="col-sm-10">
            <asp:DropDownList ID="edificio" runat="server" CssClass="form-control" meta:resourcekey="edificioResource1">
                <asp:ListItem Value="1" meta:resourcekey="ListItemResource1">Edificio I</asp:ListItem>
                <asp:ListItem Value="2" meta:resourcekey="ListItemResource2">Edificio II</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <asp:Button ID="Button1" runat="server" Text="Enviar" class="btn btn-primary" meta:resourcekey="Button1Resource1" />
    <br />
    <asp:RegularExpressionValidator Style="visibility: unset; color: red;" ID="RegularExpressionValidator1" runat="server" ErrorMessage="<br/>No es un email válido" ControlToValidate="staticEmail" EnableClientScript="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator Style="visibility: unset; color: red;" ID="RequiredFieldValidator1" runat="server" ErrorMessage="<br/>El campo del email no puede estar vacío" EnableClientScript="False" ControlToValidate="staticEmail" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator Style="visibility: unset; color: red;" ID="RequiredFieldValidator3" runat="server" ErrorMessage="<br/>El campo del DNI no puede estar vacío" ControlToValidate="dni" EnableClientScript="False" meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator Style="visibility: unset; color: red;" ID="RegularExpressionValidator2" runat="server" ErrorMessage="<br/>El DNI no es válido" ValidationExpression="([A-Za-z]\d{7}[A-Za-z])|(\d{8}[A-Za-z])" ControlToValidate="dni" EnableClientScript="False" meta:resourcekey="RegularExpressionValidator2Resource1"></asp:RegularExpressionValidator>
    <asp:Label ID="errorMsg" Style="visibility: unset; color: red;" runat="server" meta:resourcekey="errorMsgResource1"></asp:Label>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
