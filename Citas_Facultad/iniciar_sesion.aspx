<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAnon.Master" CodeBehind="iniciar_sesion.aspx.vb" Inherits="Citas_Facultad.iniciar_sesion" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <h3>
        <asp:Localize ID="Localize2" runat="server" meta:resourcekey="inicioSesionHeader" Text="Iniciar sesión"></asp:Localize>
    </h3>
    <br />
    <div class="form-group row">
        <label for="staticEmail" class="col-sm-2 col-form-label" style="text-align: initial;">
            <asp:Localize ID="Localize1" runat="server" meta:resourcekey="emailLabel" Text="email"></asp:Localize></label>
        <div class="col-sm-10">
            <asp:TextBox ID="staticEmail" runat="server" class="form-control" placeholder="example@email.com"></asp:TextBox>
            <small id="emailHelp" class="form-text text-muted" style="float: left;">
                <asp:Localize ID="Localize3" runat="server" meta:resourcekey="emailCommentLabel" Text="email"></asp:Localize></small>
        </div>
    </div>
    <div class="form-group row">
        <label for="password" class="col-sm-2 col-form-label" style="text-align: initial;" id="contraseñaLabel" dir="ltr">
            <asp:Localize ID="passwordLabel" runat="server" meta:resourcekey="passwordLabel" Text="Contra"></asp:Localize></label>
        <div class="col-sm-10">
            <asp:TextBox ID="password" runat="server" class="form-control" TextMode="Password" meta:resourcekey="passwordResource1"></asp:TextBox>
        </div>
    </div>
    <asp:Button ID="Button1" runat="server" Text="Enviar" class="btn btn-primary" type="button" meta:resourcekey="Button1Resource1" />
    <br />
    <asp:RegularExpressionValidator Style="visibility: unset; color: red;" ID="RegularExpressionValidator1" runat="server" ErrorMessage="<br/>No es un email válido" ControlToValidate="staticEmail" EnableClientScript="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator Style="visibility: unset; color: red;" ID="RequiredFieldValidator1" runat="server" ErrorMessage="<br/>El campo del email no puede estar vacío" EnableClientScript="False" ControlToValidate="staticEmail" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator Style="visibility: unset; color: red;" ID="RequiredFieldValidator2" runat="server" ErrorMessage="<br/>El campo de la contraseña no puede estar vacío" EnableClientScript="False" ControlToValidate="password" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
    <asp:Label ID="erMsg" Style="visibility: unset; color: red;" runat="server" meta:resourcekey="erMsgResource1"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
    <div class="row">
        <div class="col-1"></div>
        <div class="col-4">
            <asp:HyperLink ID="nuevoRegistro" runat="server" NavigateUrl="~/registro.aspx" meta:resourcekey="nuevoRegistroResource1">Nuevo Registro</asp:HyperLink>
        </div>
        <div class="col-7">
            <asp:HyperLink ID="recuperarContraseña" runat="server" NavigateUrl="~/solicitar_cambio.aspx" meta:resourcekey="recuperarContraseñaResource1">¿Se te ha olvidado la contraseña?</asp:HyperLink>
        </div>
    </div>
</asp:Content>
