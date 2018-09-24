Public Class elegir_tramite
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("~/secretaria/cita_previa.aspx?grado=" + grado.SelectedValue + "&tramite=" + tramite.SelectedValue)
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