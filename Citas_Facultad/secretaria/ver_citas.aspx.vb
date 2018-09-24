Imports System.Threading
Imports Citas_Facultad.DataAccess

Public Class ver_citas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        GridView1.CssClass = "invisible"
        GridView1.CssClass = "invisible"
        If Not Calendar1.SelectedDate < Date.Today Then
            populate_gridview()
            populate_gridview2()
        Else
            populate_gridview2()
        End If
    End Sub


    Private Sub populate_gridview()
        GridView1.CssClass = ""
        Try
            Dim lista_citas = obtener_citas(Session("usuario"), Calendar1.SelectedDate)
            Dim i = 0
            Dim citas As New DataTable("Citas")
            Dim lastId = -1
            citas.Columns.Add("Código", GetType(Integer))
            citas.Columns.Add("Trámite", GetType(String))
            citas.Columns.Add("Duración", GetType(Integer))
            citas.Columns.Add("Día", GetType(String))
            citas.Columns.Add("Hora", GetType(String))
            citas.Columns.Add("Email alumno/a", GetType(String))
            citas.Columns.Add("DNI alumno/a", GetType(String))
            While i < lista_citas.Count
                Dim drv = lista_citas.Item(i)
                If Not lastId = drv.id Then
                    Dim emailYTramite = drv.idSecretario
                    Dim list() = emailYTramite.Split("////")
                    Dim tableRow = citas.NewRow()
                    tableRow("Código") = drv.id
                    tableRow("Trámite") = list(4)
                    tableRow("Duración") = drv.duracion
                    tableRow("Día") = drv.dia.ToString("dd/MM/yyyy")
                    tableRow("Hora") = drv.hora.ToString("hh\:mm")
                    tableRow("Email alumno/a") = list(0)
                    tableRow("DNI alumno/a") = drv.dni
                    citas.Rows.Add(tableRow)
                    lastId = drv.id
                End If
                i += 1
            End While
            GridView1.DataSource = citas
            GridView1.DataBind()
        Catch ex As Exception
        End Try
    End Sub

    Private Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        GridView1.CssClass = "invisible"
        GridView1.CssClass = "invisible"
        If Not Calendar1.SelectedDate < Date.Today Then
            populate_gridview()
            populate_gridview2()
        Else
            populate_gridview2()
        End If
    End Sub

    Private Sub populate_gridview2()
        GridView2.CssClass = ""
        Try
            Dim lista_citas = obtener_otras_citas(Session("usuario"), Calendar1.SelectedDate)
            Dim i = 0
            Dim citas As New DataTable("Citas")
            Dim lastId = -1
            citas.Columns.Add("Código", GetType(Integer))
            citas.Columns.Add("Trámite", GetType(String))
            citas.Columns.Add("Duración", GetType(Integer))
            citas.Columns.Add("Día", GetType(String))
            citas.Columns.Add("Hora", GetType(String))
            citas.Columns.Add("Email alumno/a", GetType(String))
            citas.Columns.Add("Motivo", GetType(String))
            If lista_citas.Count = 0 Then
                Label3.Text = ""
            Else
                Label3.Text = "Otras citas"
            End If
            While i < lista_citas.Count
                Dim drv = lista_citas.Item(i)
                If Not lastId = drv.id Then
                    Dim tableRow = citas.NewRow()
                    tableRow("Código") = drv.id
                    tableRow("Trámite") = drv.tramite
                    tableRow("Duración") = drv.duracion
                    tableRow("Día") = drv.dia.ToString("dd/MM/yyyy")
                    tableRow("Hora") = drv.hora.ToString("hh\:mm")
                    tableRow("Email alumno/a") = drv.emailAlumno
                    tableRow("Motivo") = drv.estado
                    citas.Rows.Add(tableRow)
                    lastId = drv.id
                End If
                i += 1
            End While
            GridView2.DataSource = citas
            GridView2.DataBind()
        Catch ex As Exception
        End Try
    End Sub

    Private Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Panel1.CssClass = ""
    End Sub

    Private Sub btnSi_Click(sender As Object, e As EventArgs) Handles btnSi.Click
        Dim codigo = GridView1.SelectedRow.Cells(1).Text
        Dim emailUsuario = email_alumno_cita(codigo)
        msg.Text = Citas_Facultad.DataWriter.cancelar_cita_previa(codigo, 4, Thread.CurrentThread.CurrentCulture.Name)
        Dim mensaje As String = "Lamentablemente, hemos tenido que cancelar tu cita del día " & GridView1.SelectedRow.Cells(4).Text & " a la hora " & GridView1.SelectedRow.Cells(5).Text
        Correo.Correo.enviarEmail(emailUsuario, mensaje, "Cancelación de cita")
        Panel1.CssClass = "invisible"
        populate_gridview()
        populate_gridview2()
    End Sub

    Private Sub btnNo_Click(sender As Object, e As EventArgs) Handles btnNo.Click
        Panel1.CssClass = "invisible"
        msg.Text = ""
    End Sub
End Class