Imports System.Threading
Imports Citas_Facultad.DataWriter

Public Class gestionar_horario_dias
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If (Calendar1.SelectedDate = Nothing Or Calendar2.SelectedDate = Nothing) Then
            If (Thread.CurrentThread.CurrentCulture.Name.Equals("es-ES")) Then
                msg.Text = "No has seleccionado los días de inicio y fin en el calendario"
            Else
                msg.Text = "Ez dira hasiera eta bukarea egunak aukeratu egutegian"
            End If
        Else
            If (comprobar_campos()) Then
                Dim diaDesde As Date = Calendar1.SelectedDate
                Dim diaHasta As Date = Calendar2.SelectedDate
                If (diaDesde < diaHasta) Then
                    Dim registro As String = ""
                    Dim diaActual = diaDesde
                    diaHasta = diaHasta.AddDays(1) 'esto lo hago para que el horario se añada el día final también
                    While (Not diaActual.Equals(diaHasta))
                        Dim resp = insertar_dia(diaActual)
                        If (Not (resp = "1")) Then
                            registro = registro & resp & "<br/>"
                        End If
                        diaActual = diaActual.AddDays(1)
                    End While
                    If (registro = "") Then
                        If (Thread.CurrentThread.CurrentCulture.Name.Equals("es-ES")) Then
                            msg.Text = "Actualizado correctamente"
                        Else
                            msg.Text = "Egokiki eguneratua"
                        End If
                    Else
                        msg.Text = registro
                    End If
                Else
                    If (Thread.CurrentThread.CurrentCulture.Name.Equals("es-ES")) Then
                        msg.Text = "El día 'desde' es después del 'hasta'"
                    Else
                        msg.Text = "Bukaera eguna hasierakoa baino lehenago da"
                    End If
                End If
            End If
        End If
    End Sub

    Private Function insertar_dia(ByVal dia As Date) As String
        Dim diasemana As DayOfWeek = dia.DayOfWeek
        Dim horaInit As TimeSpan
        Dim horaFin As TimeSpan
        Select Case diasemana
            Case 1 'Lunes
                If (Not (horaInitLunes.Text = "")) Then
                    horaInit = TimeSpan.Parse(horaInitLunes.Text)
                    horaFin = TimeSpan.Parse(horaFinLunes.Text)
                Else
                    Return "1"
                End If
            Case 2 'Martes
                If (Not (horaInitMartes.Text = "")) Then
                    horaInit = TimeSpan.Parse(horaInitMartes.Text)
                    horaFin = TimeSpan.Parse(horaFinMartes.Text)
                Else
                    Return "1"
                End If
            Case 3 'Miércoles
                If (Not (horaInitMiercoles.Text = "")) Then
                    horaInit = TimeSpan.Parse(horaInitMiercoles.Text)
                    horaFin = TimeSpan.Parse(horaFinMiercoles.Text)
                Else
                    Return "1"
                End If
            Case 4 'Jueves
                If (Not (horaInitJueves.Text = "")) Then
                    horaInit = TimeSpan.Parse(horaInitJueves.Text)
                    horaFin = TimeSpan.Parse(horaFinJueves.Text)
                Else
                    Return "1"
                End If
            Case 5 'Viernes
                If (Not (horaInitViernes.Text = "")) Then
                    horaInit = TimeSpan.Parse(horaInitViernes.Text)
                    horaFin = TimeSpan.Parse(horaFinViernes.Text)
                Else
                    Return "1"
                End If
            Case 6 'Sábado
                Return "1"
            Case 0 'Domingo
                Return "1"
        End Select
        Dim reg = insertar_disponibilidad(empleados.SelectedValue, dia, horaInit, horaFin, Thread.CurrentThread.CurrentCulture.Name)
        If (reg = "1") Then
            Return reg
        Else
            Return "Error en día " & dia & ": " & reg
        End If
    End Function

    Private Function comprobar_campos() As Boolean
        If (horaInitLunes.Text = "") Then
            If (Not (horaFinLunes.Text = "")) Then
                msg.Text = "Has puesto hora de fin pero no de inicio en el lunes"
                Return False
            End If
        End If
        If (horaFinLunes.Text = "") Then
            If (Not (horaInitLunes.Text = "")) Then
                msg.Text = "Has puesto hora de inicio pero no de fin en el lunes"
                Return False
            End If
        End If
        If (Not (horaInitLunes.Text = "")) Then
            Dim horaInitLunesTS As TimeSpan = TimeSpan.Parse(horaInitLunes.Text)
            Dim horaFinLunesTS As TimeSpan = TimeSpan.Parse(horaFinLunes.Text)
            If (horaInitLunesTS > horaFinLunesTS) Then
                msg.Text = "La hora inicial del lunes es después de la hora final"
                Return False
            End If
        End If

        If (horaInitMartes.Text = "") Then
            If (Not (horaFinMartes.Text = "")) Then
                msg.Text = "Has puesto hora de fin pero no de inicio en el martes"
                Return False
            End If
        End If
        If (horaFinMartes.Text = "") Then
            If (Not (horaInitMartes.Text = "")) Then
                msg.Text = "Has puesto hora de inicio pero no de fin en el martes"
                Return False
            End If
        End If
        If (Not (horaInitMartes.Text = "")) Then
            Dim horaInitMartesTS As TimeSpan = TimeSpan.Parse(horaInitMartes.Text)
            Dim horaFinMartesTS As TimeSpan = TimeSpan.Parse(horaFinMartes.Text)
            If (horaInitMartesTS > horaFinMartesTS) Then
                msg.Text = "La hora inicial del martes es después de la hora final"
                Return False
            End If
        End If

        If (horaInitMiercoles.Text = "") Then
            If (Not (horaFinMiercoles.Text = "")) Then
                msg.Text = "Has puesto hora de fin pero no de inicio en el miércoles"
                Return False
            End If
        End If
        If (horaFinMiercoles.Text = "") Then
            If (Not (horaInitMiercoles.Text = "")) Then
                msg.Text = "Has puesto hora de inicio pero no de fin en el miércoles"
                Return False
            End If
        End If
        If (Not (horaInitMiercoles.Text = "")) Then
            Dim horaInitMiercolesTS As TimeSpan = TimeSpan.Parse(horaInitMiercoles.Text)
            Dim horaFinMiercolesTS As TimeSpan = TimeSpan.Parse(horaFinMiercoles.Text)
            If (horaInitMiercolesTS > horaFinMiercolesTS) Then
                msg.Text = "La hora inicial del miércoles es después de la hora final"
                Return False
            End If
        End If

        If (horaInitJueves.Text = "") Then
            If (Not (horaFinJueves.Text = "")) Then
                msg.Text = "Has puesto hora de fin pero no de inicio en el jueves"
                Return False
            End If
        End If
        If (horaFinJueves.Text = "") Then
            If (Not (horaInitJueves.Text = "")) Then
                msg.Text = "Has puesto hora de inicio pero no de fin en el jueves"
                Return False
            End If
        End If
        If (Not (horaInitJueves.Text = "")) Then
            Dim horaInitJuevesTS As TimeSpan = TimeSpan.Parse(horaInitJueves.Text)
            Dim horaFinJuevesTS As TimeSpan = TimeSpan.Parse(horaFinJueves.Text)
            If (horaInitJuevesTS > horaFinJuevesTS) Then
                msg.Text = "La hora inicial del jueves es después de la hora final"
                Return False
            End If
        End If

        If (horaInitViernes.Text = "") Then
            If (Not (horaFinViernes.Text = "")) Then
                msg.Text = "Has puesto hora de fin pero no de inicio en el viernes"
                Return False
            End If
        End If
        If (horaFinViernes.Text = "") Then
            If (Not (horaInitViernes.Text = "")) Then
                msg.Text = "Has puesto hora de inicio pero no de fin en el viernes"
                Return False
            End If
        End If
        If (Not (horaInitViernes.Text = "")) Then
            Dim horaInitViernesTS As TimeSpan = TimeSpan.Parse(horaInitViernes.Text)
            Dim horaFinViernesTS As TimeSpan = TimeSpan.Parse(horaFinViernes.Text)
            If (horaInitViernesTS > horaFinViernesTS) Then
                msg.Text = "La hora inicial del viernes es después de la hora final"
                Return False
            End If
        End If

        msg.Text = ""
        Return True
    End Function
End Class