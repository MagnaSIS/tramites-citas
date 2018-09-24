Imports System.Threading
Imports Citas_Facultad.DataWriter

Public Class gestionar_horario_dia
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If (Calendar1.SelectedDate = Nothing) Then
            If (Thread.CurrentThread.CurrentCulture.Name.Equals("es-ES")) Then
                msg.Text = "No se ha seleccionado ningún día"
            Else
                msg.Text = "Ez da eguna aukeratu"
            End If
        Else
            msg.Text = ""
            If Page.IsValid Then
                Dim i As String = insertar_disponibilidad(empleados.SelectedValue, Calendar1.SelectedDate, TimeSpan.Parse(horaInit.Text), TimeSpan.Parse(horaFin.Text), Thread.CurrentThread.CurrentCulture.Name)

                If (i = "1") Then
                    If (Thread.CurrentThread.CurrentCulture.Name.Equals("es-ES")) Then
                        msg.Text = "Se ha insertado correctamente"
                    Else
                        msg.Text = "Egokiki sortu da"
                    End If
                Else
                    msg.Text = i
                End If
            End If
        End If
    End Sub

    Private Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        msg.Text = ""
    End Sub
End Class