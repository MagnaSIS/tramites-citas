Imports System.Security.Cryptography
Imports Citas_Facultad.DataWriter

Public Class registro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If Page.IsValid Then
            If CheckBox1.Checked Then
                Randomize()
                Dim claveRnd As String = CStr(CInt(Rnd() * 9000000) + 1000000)
                Dim pass = password.Text
                Dim mySHA256 As SHA256 = SHA256Managed.Create()
                pass = Convert.ToBase64String(mySHA256.ComputeHash(Encoding.UTF8.GetBytes(pass)))
                Dim ret As String = insertar_usuario(staticEmail.Text, dni.Text, CInt(claveRnd), "Alumno", pass, 0)
                If ret = "1" Then
                    Dim mensaje As String = "Confirma tu registro haciendo click <a href='https://hitzorduak.a2hosted.com/confirmar_registro.aspx?email=" + staticEmail.Text + "&clave=" + claveRnd + "'>aquí</a>."
                    Correo.Correo.enviarEmail(staticEmail.Text, mensaje, "Confirmar registro")
                    Server.Transfer("default.aspx", True)
                Else
                    errorMsg.Text = ret
                End If
            Else
                errorMsg.Text = "<br/>Tienes que aceptar el tratamiento de datos"
            End If

        End If
    End Sub
End Class