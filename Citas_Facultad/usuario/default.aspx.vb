Imports Citas_Facultad.DataAccess

Public Class pedir_cita
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim comprobar = comprobar_nocita_tramite(Session("usuario"), tramite.SelectedValue)
        If comprobar Then
            Response.Redirect("~/usuario/cita_previa.aspx?grado=" + grado.SelectedValue + "&tramite=" + tramite.SelectedValue)
        Else
            msg.Text = "Ya tienes una cita para este trámite"
        End If
    End Sub

    Private Sub grado_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grado.SelectedIndexChanged
        msg.Text = ""
        tramite.DataBind()
    End Sub

    Private Sub tramite_SelectedIndexChanged(sender As Object, e As EventArgs) Handles tramite.SelectedIndexChanged
        msg.Text = ""
        GridView1.DataBind()
    End Sub
End Class