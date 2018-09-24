Imports System.Threading
Imports Citas_Facultad.DataWriter

Public Class modificar_disp_tramites
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("añadir_disp_tramite.aspx?id=" & DropDownList1.SelectedValue)
    End Sub

    Private Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        GridView1.DataBind()
        msg.Text = ""
        Panel1.CssClass = "invisible"
    End Sub

    Private Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Panel1.CssClass = ""
        msg.Text = ""
    End Sub

    Private Sub btnSi_Click(sender As Object, e As EventArgs) Handles btnSi.Click
        msg.Text = eliminar_disp_tramite(GridView1.SelectedRow.Cells(0).Text, Thread.CurrentThread.CurrentCulture.Name)
        Panel1.CssClass = "invisible"
        GridView1.DataBind()
    End Sub

    Private Sub btnNo_Click(sender As Object, e As EventArgs) Handles btnNo.Click
        Panel1.CssClass = "invisible"
        GridView1.SelectedIndex = -1
    End Sub
End Class