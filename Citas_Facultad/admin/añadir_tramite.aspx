<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MaestraAdmin.Master" CodeBehind="añadir_tramite.aspx.vb" Inherits="Citas_Facultad.añadir_tramite" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="jumbotron" runat="server">
    <h3>
        <asp:Label ID="Label1" runat="server" Text="Insertar trámite" meta:resourcekey="Label1Resource1"></asp:Label></h3>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="text-align: left;">
                <div class="form-group">
                    <label for="nombre">
                        <asp:Label ID="Label2" runat="server" Text="Nombre del trámite" meta:resourcekey="Label2Resource1"></asp:Label></label>
                    <asp:TextBox ID="nombre" runat="server" CssClass="form-control" meta:resourcekey="nombreResource1"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="duracion">
                        <asp:Label ID="Label3" runat="server" Text="Duración del trámite" meta:resourcekey="Label3Resource1"></asp:Label></label>
                    <asp:DropDownList ID="duracion" runat="server" CssClass="form-control" AutoPostBack="True" meta:resourcekey="duracionResource1">
                        <asp:ListItem Value="15" meta:resourcekey="ListItemResource1">15 minutos</asp:ListItem>
                        <asp:ListItem Value="30" meta:resourcekey="ListItemResource2">30 minutos</asp:ListItem>
                        <asp:ListItem Value="60" meta:resourcekey="ListItemResource3">60 minutos</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="edificio">
                        <asp:Label ID="Label4" runat="server" Text="Edificio" meta:resourcekey="Label4Resource1"></asp:Label></label>
                    <asp:DropDownList ID="edificio" runat="server" CssClass="form-control" meta:resourcekey="edificioResource1">
                        <asp:ListItem Value="1" meta:resourcekey="ListItemResource4">Edificio I</asp:ListItem>
                        <asp:ListItem Value="2" meta:resourcekey="ListItemResource5">Edificio II</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Insertar trámite" meta:resourcekey="Button1Resource1" />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" Text="El nombre es obligatorio" ControlToValidate="nombre" EnableClientScript="False" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" Text="La duración es obligatoria" ControlToValidate="duracion" EnableClientScript="False" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
            <asp:Label ID="msg" runat="server" meta:resourcekey="msgResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
