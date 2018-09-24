Imports System.Globalization
Imports System.Security.Cryptography
Imports System.Threading
Imports Citas_Facultad.DataAccess

Public Class iniciar_sesion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If Not Page.IsValid Then
            If Not RegularExpressionValidator1.IsValid Or Not RequiredFieldValidator1.IsValid Then
                staticEmail.Attributes("class") = "form-control is-invalid"
            Else
                staticEmail.Attributes("class") = "form-control"
            End If
            If Not RequiredFieldValidator2.IsValid Then
                password.Attributes("class") = "form-control is-invalid"
            Else
                password.Attributes("class") = "form-control"
            End If
        Else
            Dim pass = password.Text
            Dim mySHA256 As SHA256 = SHA256Managed.Create()
            pass = Convert.ToBase64String(mySHA256.ComputeHash(Encoding.UTF8.GetBytes(pass)))
            Dim resp As String = Citas_Facultad.DataAccess.iniciar_sesion(staticEmail.Text, pass)
            If resp.Equals("Secretario") Then
                System.Web.Security.FormsAuthentication.SetAuthCookie("secretario", False)
                Session("usuario") = staticEmail.Text
                Response.Redirect("~/secretaria/")
            ElseIf resp.Equals("Alumno") Then
                System.Web.Security.FormsAuthentication.SetAuthCookie("alumno", False)
                Session("usuario") = staticEmail.Text
                Response.Redirect("~/usuario/")
            ElseIf resp.Equals("Admin") Then
                System.Web.Security.FormsAuthentication.SetAuthCookie("admin", False)
                Session("usuario") = staticEmail.Text
                Response.Redirect("~/admin/")
            ElseIf resp.Equals("Error1") Then
                erMsg.Text = "El usuario no ha sido confirmado"
            ElseIf resp.Equals("Error2") Then
                erMsg.Text = "Usuario o contraseña incorrecto"
            End If
        End If
    End Sub
End Class