Imports System.Globalization
Imports System.Threading

Public Class MaestraUsuario
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If Not IsPostBack Then
            ddlLanguage.SelectedValue = Thread.CurrentThread.CurrentCulture.Name
        End If
    End Sub

    Protected Sub ddlLanguage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlLanguage.SelectedIndexChanged
        Dim cookie As HttpCookie
        cookie = New HttpCookie("language")
        cookie.Value = ddlLanguage.SelectedValue

        Dim content As String
        content = ddlLanguage.SelectedItem.Value

        Response.Cookies.Add(cookie)

        Thread.CurrentThread.CurrentCulture = New CultureInfo(ddlLanguage.SelectedValue)
        Thread.CurrentThread.CurrentUICulture = New CultureInfo(ddlLanguage.SelectedValue)
        Server.Transfer(Request.Path)
    End Sub

    Private Sub cerrar_sesion_Click(sender As Object, e As EventArgs) Handles cerrar_sesion.Click
        Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("~/default.aspx")
    End Sub
End Class