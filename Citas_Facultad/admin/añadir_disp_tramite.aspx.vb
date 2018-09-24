Imports System.Threading
Imports Citas_Facultad.DataWriter

Public Class añadir_disp_tramite
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.QueryString.Count = 1 Then
            Server.Transfer("default.aspx", True)
        End If
        Dim dv As DataView = SqlDataSource1.Select(DataSourceSelectArguments.Empty)
        Dim drv = dv.Item(0)
        nombre.Text = drv.Item("nombre").ToString()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If (Calendar1.SelectedDate = Nothing Or Calendar2.SelectedDate = Nothing) Then
            If (Thread.CurrentThread.CurrentCulture.Name.Equals("es-ES")) Then
                msg.Text = "No has seleccionado los días de inicio y fin en el calendario"
            Else
                msg.Text = "Ez dituzu hasiera eta bukaera egunak aukeratun egutegian"
            End If
        Else
            Dim desde As Date = Calendar1.SelectedDate
            Dim hasta As Date = Calendar2.SelectedDate
            Dim resp = insertar_disponibilidad_tramite(Request.QueryString("id"), desde, hasta, Thread.CurrentThread.CurrentCulture.Name)
            If resp = "1" Then
                If (Thread.CurrentThread.CurrentCulture.Name.Equals("es-ES")) Then
                    msg.Text = "Disponibilidad insertada correctamente"
                Else
                    msg.Text = "Erabilgarritasuna sortu da"
                End If
            Else
                msg.Text = resp
            End If
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("añadir_secre_tramite.aspx?id=" & Request.QueryString("id"))
    End Sub
End Class