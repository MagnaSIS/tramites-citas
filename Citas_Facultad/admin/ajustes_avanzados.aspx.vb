Imports System.Threading
Imports Citas_Facultad.DataWriter

Public Class ajustes_avanzados
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        actualizar_bd()
        If (Thread.CurrentThread.CurrentCulture.Name.Equals("es-ES")) Then
            msg.Text = "La base de datos ha sido actualizada"
        Else
            msg.Text = "Datu basea eguneratu egin da"
        End If
    End Sub

    Private Sub btnSi_Click(sender As Object, e As EventArgs) Handles btnSi.Click
        borrar_base_de_datos()
        Panel1.CssClass = "invisible"
        If (Thread.CurrentThread.CurrentCulture.Name.Equals("es-ES")) Then
            msg.Text = "Se ha borrado la base de datos"
        Else
            msg.Text = "Datu basea ezabatu egin da"
        End If
    End Sub

    Private Sub btnNo_Click(sender As Object, e As EventArgs) Handles btnNo.Click
        Panel1.CssClass = "invisible"
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        msg.Text = ""
        Panel1.CssClass = ""
    End Sub

    Private Sub btnImprimir_Click(sender As Object, e As EventArgs) Handles btnImprimir.Click
        actualizar_bd()
        Response.Redirect("imprimir_historial.aspx")
    End Sub
End Class