Imports System.Security.Cryptography
Imports Citas_Facultad.DataWriter

Public Class confirmar_empleado
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString.Count = 2 Then
            email.Text = Request.QueryString("email")
            clave.Text = Request.QueryString("clave")
        Else
            Server.Transfer("default.aspx", True)
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim passw = pass.Text
        Dim mySHA256 As SHA256 = SHA256Managed.Create()
        passw = Convert.ToBase64String(mySHA256.ComputeHash(Encoding.UTF8.GetBytes(passw)))
        Dim resp As Boolean = Citas_Facultad.DataWriter.confirmar_empleado(email.Text, clave.Text, passw)
        If resp Then
            Server.Transfer("iniciar_sesion.aspx", True)
        Else
            Server.Transfer("default.aspx", True)
        End If
    End Sub
End Class