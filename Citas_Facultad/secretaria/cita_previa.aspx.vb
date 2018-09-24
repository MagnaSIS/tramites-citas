Imports Citas
Imports Citas_Facultad.DataAccess

Public Class cita_previa1
    Inherits System.Web.UI.Page

    Dim lista_citas As List(Of Citas.Cita) = New List(Of Citas.Cita)()
    Dim direccion As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Request.QueryString.Count = 2) Then
            Dim dv As DataView = sqlGrado.Select(DataSourceSelectArguments.Empty)
            Dim drv = dv.Item(0)
            grado.Text = drv.Item("nombre").ToString()

            Dim dv2 As DataView = sqlTramite.Select(DataSourceSelectArguments.Empty)
            Dim drv2 = dv2.Item(0)
            tramite.Text = drv2.Item("nombre").ToString()

            Dim dv3 As DataView = sqlEdificio.Select(DataSourceSelectArguments.Empty)
            Dim drv3 = dv3.Item(0)
            edificio.Text = drv3.Item("nombre").ToString()
            direccion = drv3.Item("direccion").ToString()
            If Not Page.IsPostBack Then
                populate_citas_disponibles()
            End If
        Else
            Response.Redirect("default.aspx")
        End If
    End Sub

    Private Sub populate_citas_disponibles()
        Dim dia As Date
        citasDDL.Items.Clear()
        If Calendar1.SelectedDate = Nothing Then
            msg.Text = "No hay un día seleccionado"
        ElseIf Calendar1.SelectedDate < Date.Today Then
            msg.Text = "No se puede pedir una cita para ese día"
        Else
            msg.Text = ""
            dia = Calendar1.SelectedDate
            Dim citas_posibles As List(Of Citas.Cita) = obtener_posibles_citas(Request.QueryString("tramite"), dia)
            Dim i As Integer = 0
            lista_citas.Clear()
            lista_citas = citas_posibles
            Session("lista_citas") = lista_citas
            If citas_posibles Is Nothing Then
                msg.Text = "El trámite no está abierto en esas fechas"
            ElseIf (citas_posibles.Count = 0) Then
                msg.Text = "No hay citas disponibles para ese día"
            Else
                For Each cita As Citas.Cita In citas_posibles
                    Dim tx As String = cita.dia & " - " & cita.hora.ToString("hh\:mm")
                    citasDDL.Items.Insert(i, New ListItem(tx, cita.id))
                    i += 1
                Next
            End If
        End If
    End Sub

    Private Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        populate_citas_disponibles()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If (Calendar1.SelectedDate = Nothing Or citasDDL.Items.Count = 0) Then
            msg.Text = "Comprueaba que has seleccionado todo correctamente"
        Else
            lista_citas = Session("lista_citas")
            Dim cita As Citas.Cita = get_cita(citasDDL.SelectedValue)
            Dim n = Citas_Facultad.DataWriter.insertar_cita(cita.dia, cita.hora, Request.QueryString("tramite"), cita.idSecretario, alumnoDDL.SelectedValue, cita.duracion)
            Try
                Dim id = CInt(n)
                Dim mensaje As String = "Confirmamos el registro de la cita el día " + cita.dia + " a la hora " + cita.hora.ToString("hh\:mm") & ".<br/>" &
                    "La cita será en " & edificio.Text & ", " & direccion & "<br/>" &
                    "El trámite es " & tramite.Text & "<br/>" &
                    "El código de tu cita es: " & id
                Correo.Correo.enviarEmail(alumnoDDL.SelectedValue, mensaje, "Cita previa")
                Response.Redirect("confirmacion.aspx?cita=" & id & "&alumno=" & alumnoDDL.SelectedValue)
            Catch ex As Exception
                msg.Text = n
            End Try
        End If
    End Sub

    Private Function get_cita2(ByVal id As Integer) As Citas.Cita
        Return lista_citas.Item(id)
    End Function

    Private Function get_cita(ByVal id As Integer) As Citas.Cita
        For Each cita As Citas.Cita In lista_citas
            If cita.id = id Then
                Return cita
            End If
        Next
        Return Nothing
    End Function
End Class