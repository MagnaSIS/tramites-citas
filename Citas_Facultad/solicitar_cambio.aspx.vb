Imports Citas_Facultad.DataWriter

Public Class solicitar_cambio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If Page.IsValid Then
            Randomize()
            Dim claveRnd = CStr(CInt(Rnd() * 9000000) + 1000000)
            Dim mensaje As String = "Se ha solicitado un cambio de contraseña<br/>Cámbiala haciendo clik <a href='https://hitzorduak.a2hosted.com/cambiar_password.aspx?email=" + email.Text + "&clave=" + claveRnd + "'>aquí</a>."
            If Citas_Facultad.DataWriter.solicitar_cambio(email.Text, CInt(claveRnd)) Then
                msg.Text = "Ha sido enviado un correo con la clave para cambiar la contraseña"
                Correo.Correo.enviarEmail(email.Text, mensaje, "Cambio de contraseña")
            Else
                msg.Text = "No se ha encontrado el usuario"
            End If
        End If
    End Sub
End Class