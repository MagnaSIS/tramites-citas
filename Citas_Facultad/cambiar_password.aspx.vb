Imports System.Security.Cryptography
Imports Citas_Facultad.DataWriter

Public Class cambiar_password
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
        If Page.IsValid Then
            Dim pass = pass1.Text
            Dim mySHA256 As SHA256 = SHA256Managed.Create()
            pass = Convert.ToBase64String(mySHA256.ComputeHash(Encoding.UTF8.GetBytes(pass)))
            If Citas_Facultad.DataWriter.cambiar_password(email.Text, clave.Text, pass) Then
                Response.Write("<script language='javascript'> alert('Modificación correcta'); </script>")
            Else
            End If
            Response.Redirect("~/")
        End If
    End Sub

End Class