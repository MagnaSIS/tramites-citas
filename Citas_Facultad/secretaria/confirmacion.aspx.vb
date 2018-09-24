Imports System.Threading
Imports Citas_Facultad.DataAccess

Public Class confirmacion1
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Request.QueryString.Count = 1) Then
            Try
                Dim dv As DataView = SqlDataSource1.Select(DataSourceSelectArguments.Empty)
                Dim drv = dv.Item(0)
                Dim correcto As Boolean = comprobar_cita(Request.QueryString("cita"), Request.QueryString("alumno"))
                If correcto Then
                    codigo.Text = Request.QueryString("cita")
                    dia.Text = drv.Item("dia").ToString()
                    hora.Text = drv.Item("hora").ToString()
                    duracion.Text = drv.Item("duracion").ToString()
                    edificio.Text = drv.Item("edificio").ToString()
                    tramite.Text = drv.Item("tramite").ToString()
                    direccion.Text = drv.Item("direccion").ToString()
                Else
                    Response.Redirect("default.aspx")
                End If
            Catch ex As Exception
                Response.Redirect("default.aspx")
            End Try
        Else
            Response.Redirect("default.aspx")
        End If
    End Sub

    Private Sub btnSi_Click(sender As Object, e As EventArgs) Handles btnSi.Click
        msg.Text = Citas_Facultad.DataWriter.cancelar_cita_previa(Request.QueryString("cita"), 1, Thread.CurrentThread.CurrentCulture.Name)
        Dim mensaje As String = "Confirmamos que se ha cancelado tu cita del día " & dia.Text & " a la hora " & hora.Text
        Correo.Correo.enviarEmail(Request.QueryString("alumno"), mensaje, "Cancelación de cita")
        Panel1.CssClass = "invisible"
        Panel2.CssClass = "invisible"
        Button1.CssClass = "invisible"
    End Sub

    Private Sub btnNo_Click(sender As Object, e As EventArgs) Handles btnNo.Click
        Panel1.CssClass = "invisible"
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Panel1.CssClass = ""
    End Sub
End Class