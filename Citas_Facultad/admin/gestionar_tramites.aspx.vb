Imports System.Threading

Public Class gestionar_tramites
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("añadir_tramite.aspx")
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("modificar_disp_tramites.aspx")
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("modificar_secre_tramite.aspx")
    End Sub

    Private Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Panel1.CssClass = ""
    End Sub

    Private Sub btnSi_Click(sender As Object, e As EventArgs) Handles btnSi.Click
        Dim codigo = GridView1.SelectedRow.Cells(0).Text
        msg.Text = Citas_Facultad.DataWriter.eliminar_tramite(codigo, Thread.CurrentThread.CurrentCulture.Name)
        Panel1.CssClass = "invisible"
        GridView1.DataBind()
    End Sub

    Private Sub btnNo_Click(sender As Object, e As EventArgs) Handles btnNo.Click
        Panel1.CssClass = "invisible"
        msg.Text = ""
    End Sub
End Class