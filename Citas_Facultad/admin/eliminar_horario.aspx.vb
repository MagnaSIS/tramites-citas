Public Class eliminar_horario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Private Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        'Hay que cambiar el eliminar actual, cambiar el texto de seleccionar por eliminar y aquí eliminar comprobando
        'que no haya ninguna cita que solape con la disponibilidad
        'Además habría que pedir confirmación para eliminar
    End Sub

    Private Sub empleados_SelectedIndexChanged(sender As Object, e As EventArgs) Handles empleados.SelectedIndexChanged
        GridView1.DataBind()
    End Sub
End Class