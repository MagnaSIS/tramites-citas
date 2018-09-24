<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="aviso_legal.aspx.vb" Inherits="Citas_Facultad.aviso_legal" meta:resourcekey="PageResource1" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Citas - Facultad HEFA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Content/bootstrap.min.css" rel="stylesheet">
    <link href="Content/jumbotron-header.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header class="header">
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                    <asp:LinkButton ID="logo" runat="server" class="navbar-brand" OnClientClick="JavaScript:window.history.back(1);return false;" meta:resourcekey="logoResource1">Facultad HEFA</asp:LinkButton>
                    <asp:DropDownList ID="ddlLanguage" runat="server"
                        OnSelectedIndexChanged="ddlLanguage_SelectedIndexChanged"
                        AutoPostBack="True" meta:resourcekey="ddlLanguageResource1">
                        <asp:ListItem Text="Español" Value="es-ES" meta:resourcekey="ListItemResource1" />
                        <asp:ListItem Text="Euskara" Value="eu-ES" meta:resourcekey="ListItemResource2" />
                    </asp:DropDownList>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <asp:LinkButton ID="LinkButton1" runat="server" class="nav-link" OnClientClick="JavaScript:window.history.back(1);return false;" meta:resourcekey="LinkButton1Resource1">Volver</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <main role="main">
                <div class="jumbotron">
                    <div style="text-align: left;">
                        <h3>
                            <asp:Label ID="Label1" runat="server" Text="Avisos legales" meta:resourcekey="Label1Resource1"></asp:Label>
                        </h3>
                        <asp:Label ID="parrafo1" runat="server" Text="" meta:resourcekey="parrafo1Resource1"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="parrafo2" runat="server" Text="" meta:resourcekey="parrafo2Resource1"></asp:Label>
                    </div>
                </div>
            </main>
        </div>
    </form>
    <script src="Scripts/jquery-3.3.1.slim.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
