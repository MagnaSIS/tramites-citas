Imports Citas_Facultad.DataWriter

Public Class añadir_tramite
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If Page.IsValid Then
            Dim resp = insertar_tramite(nombre.Text, duracion.SelectedValue, edificio.SelectedValue)
            Try
                Dim id = CInt(resp)
                Response.Redirect("añadir_disp_tramite.aspx?id=" & id)
            Catch ex As Exception
                msg.Text = resp
            End Try
        End If
    End Sub
End Class