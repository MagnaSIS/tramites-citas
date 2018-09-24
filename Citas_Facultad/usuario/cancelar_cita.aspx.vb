Imports System.Threading
Imports Citas_Facultad.DataAccess

Public Class cancelar_cita
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub btnSi_Click(sender As Object, e As EventArgs) Handles btnSi.Click
        msg.Text = Citas_Facultad.DataWriter.cancelar_cita_previa(codigo.Text, 1, Thread.CurrentThread.CurrentCulture.Name)
        Dim mensaje As String = "Confirmamos que se ha cancelado tu cita del día " & dia.Text & " a la hora " & hora.Text
        Correo.Correo.enviarEmail(Session("usuario"), mensaje, "Cancelación de cita")
        Panel1.CssClass = "invisible"
        Panel2.CssClass = "invisible"
    End Sub

    Private Sub btnNo_Click(sender As Object, e As EventArgs) Handles btnNo.Click
        Panel1.CssClass = "invisible"
        Panel2.CssClass = "invisible"
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim cita As Citas.Cita = obtener_cita(tbCodigo.Text, Session("usuario"))
        If cita Is Nothing Then
            Panel1.CssClass = "invisible"
            Panel2.CssClass = "invisible"
            msg.Text = "No se ha encontrado ninguna cita con ese código asociada a tu usuario"
        Else
            msg.Text = ""
            Panel1.CssClass = ""
            Panel2.CssClass = ""
            codigo.Text = cita.id
            dia.Text = cita.dia
            hora.Text = cita.hora.ToString("hh\:mm")
        End If
    End Sub
End Class