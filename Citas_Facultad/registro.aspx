<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAnon.Master" CodeBehind="registro.aspx.vb" Inherits="Citas_Facultad.registro" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <h3><asp:Localize ID="Localize4" runat="server" meta:resourcekey="registroLabel" Text="Registro"/></h3>
    <br />
    <div class="form-group row">
        <label for="staticEmail" class="col-sm-2 col-form-label" style="text-align: initial;">Email</label>
        <div class="col-sm-10">
            <asp:TextBox ID="staticEmail" runat="server" class="form-control" placeholder="example@email.com" meta:resourcekey="staticEmailResource1"></asp:TextBox>
            <small id="emailHelp" class="form-text text-muted" style="float: left;"><asp:Localize ID="Localize3" runat="server" meta:resourcekey="emailLabel" Text="El email no tiene por que ser de la UPV."/>
            </small>
        &nbsp;</div>
    </div>
    <div class="form-group row">
        <label for="password" class="col-sm-2 col-form-label" style="text-align: initial;"><asp:Localize ID="Localize1" runat="server" meta:resourcekey="contraseñaLabel" Text="Contraseña"/></label>
        <div class="col-sm-10">
            <asp:TextBox ID="password" runat="server" class="form-control" TextMode="Password" meta:resourcekey="passwordResource1"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <label for="dni" class="col-sm-2 col-form-label" style="text-align: initial;"><asp:Localize ID="Localize2" runat="server" meta:resourcekey="DNILabel" Text="DNI"/></label>
        <div class="col-sm-10">
            <asp:TextBox ID="dni" runat="server" class="form-control" meta:resourcekey="dniResource1"></asp:TextBox>
        </div>
    </div>
    <div class="form-check" style="text-align: left;">
        <asp:CheckBox ID="CheckBox1" runat="server" class="form-check-input" meta:resourcekey="CheckBox1Resource1"/>
        <asp:Label ID="condiciones" CssClass="form-check-label" for="exampleCheck1" runat="server" Text="Acepto el siguiente uso de mis datos: se utilizarán únicamente para asociarme con una cita y para poder enviarme correos para mantenerme actualizado." meta:resourcekey="condicionesResource1"></asp:Label>
    </div>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Enviar" class="btn btn-primary" meta:resourcekey="Button1Resource1" />
    <br />
    <asp:RegularExpressionValidator Style="visibility: unset; color: red;" ID="RegularExpressionValidator1" runat="server" ErrorMessage="<br/>No es un email válido" ControlToValidate="staticEmail" EnableClientScript="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator Style="visibility: unset; color: red;" ID="RequiredFieldValidator1" runat="server" ErrorMessage="<br/>El campo del email no puede estar vacío" EnableClientScript="False" ControlToValidate="staticEmail" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator Style="visibility: unset; color: red;" ID="RequiredFieldValidator2" runat="server" ErrorMessage="<br/>El campo de la contraseña no puede estar vacío" EnableClientScript="False" ControlToValidate="password" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator Style="visibility: unset; color: red;" ID="RequiredFieldValidator3" runat="server" ErrorMessage="<br/>El campo del DNI no puede estar vacío" ControlToValidate="dni" EnableClientScript="False" meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator Style="visibility: unset; color: red;" ID="RegularExpressionValidator2" runat="server" ErrorMessage="<br/>El DNI no es válido" ValidationExpression="([A-Za-z]\d{7}[A-Za-z])|(\d{8}[A-Za-z])" ControlToValidate="dni" EnableClientScript="False" meta:resourcekey="RegularExpressionValidator2Resource1"></asp:RegularExpressionValidator>
    <asp:Label ID="errorMsg" Style="visibility: unset; color: red;" runat="server" meta:resourcekey="errorMsgResource1"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
