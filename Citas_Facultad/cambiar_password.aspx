<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAnon.Master" CodeBehind="cambiar_password.aspx.vb" Inherits="Citas_Facultad.cambiar_password" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <div class="form-group" style="text-align: left;">
        <asp:Label ID="Label1" runat="server" Text="Email" for="email" meta:resourcekey="Label1Resource1"></asp:Label>
        <asp:TextBox ID="email" runat="server" class="form-control" ReadOnly="True" meta:resourcekey="emailResource1"></asp:TextBox>
    </div>
    <div class="form-group" style="text-align: left;">
        <asp:Label ID="Label2" runat="server" Text="Clave de recuperación" for="clave" meta:resourcekey="Label2Resource1"></asp:Label>
        <asp:TextBox ID="clave" runat="server" class="form-control" ReadOnly="True" meta:resourcekey="claveResource1"></asp:TextBox>
    </div>
    <div class="form-group" style="text-align: left;">
        <asp:Label ID="Label3" for="pass1" runat="server" Text="Contraseña nueva" meta:resourcekey="Label3Resource1"></asp:Label>
        <asp:TextBox ID="pass1" runat="server" class="form-control" TextMode="Password" meta:resourcekey="pass1Resource1"></asp:TextBox>
    </div>
    <div class="form-group" style="text-align: left;">
        <asp:Label ID="Label4" runat="server" Text="Repita contraseña" for="pass2" meta:resourcekey="Label4Resource1"></asp:Label>
        <asp:TextBox ID="pass2" runat="server" class="form-control" TextMode="Password" meta:resourcekey="pass2Resource1"></asp:TextBox>
    </div>
    <asp:Button ID="Button1" runat="server" Text="Cambiar contraseña" class="btn btn-primary" meta:resourcekey="Button1Resource1" />
    <br />
    <asp:RequiredFieldValidator Style="visibility: unset; color: red;" ID="RequiredFieldValidator1" runat="server" ErrorMessage="<br/>La contraseña nueva no puede estar vacía" EnableClientScript="False" ControlToValidate="pass1" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator Style="visibility: unset; color: red;" ID="RequiredFieldValidator2" runat="server" ErrorMessage="<br/>Repita la contraseña" EnableClientScript="False" ControlToValidate="pass2" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" EnableClientScript="False" ControlToCompare="pass1" ControlToValidate="pass2" Text="<br/>Las contraseñas no coinciden" meta:resourcekey="CompareValidator1Resource1"></asp:CompareValidator>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
