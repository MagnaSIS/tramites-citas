Imports System.Threading
Imports Citas_Facultad.DataAccess

Public Class gestionar_citas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        populate_gridview()
    End Sub

    Private Sub populate_gridview()
        Try
            Dim dv As List(Of Citas.Cita2)
            If CheckBox1.Checked Then
                dv = obtener_todas_citas(Calendar1.SelectedDate, DropDownList1.SelectedValue, DropDownList2.SelectedValue)
            Else
                dv = obtener_todas_citas(Calendar1.SelectedDate, DropDownList1.SelectedValue)
            End If
            Dim i = 0
            Dim citas As New DataTable("Citas")
            Dim lastId = -1
            If (Thread.CurrentThread.CurrentCulture.Name.Equals("es-ES")) Then
                citas.Columns.Add("Código", GetType(Integer))
                citas.Columns.Add("Trámite", GetType(String))
                citas.Columns.Add("Duración", GetType(Integer))
                citas.Columns.Add("Día", GetType(String))
                citas.Columns.Add("Hora", GetType(String))
                citas.Columns.Add("Email secretario/a", GetType(String))
                citas.Columns.Add("Email alumno/a", GetType(String))
                citas.Columns.Add("DNI alumno/a", GetType(String))
                While i < dv.Count
                    Dim drv = dv.Item(i)
                    If Not lastId = drv.id Then
                        Dim tableRow = citas.NewRow()
                        tableRow("Código") = drv.id
                        tableRow("Trámite") = drv.tramite
                        tableRow("Duración") = drv.duracion
                        tableRow("Día") = drv.dia.ToString("dd/MM/yyyy")
                        tableRow("Hora") = drv.hora.ToString("hh\:mm")
                        tableRow("Email secretario/a") = drv.emailSecretario
                        tableRow("Email alumno/a") = drv.emailAlumno
                        tableRow("DNI alumno/a") = drv.dni
                        citas.Rows.Add(tableRow)
                        lastId = drv.id
                    End If
                    i += 1
                End While
            Else
                citas.Columns.Add("Kodea", GetType(Integer))
                citas.Columns.Add("Tramitea", GetType(String))
                citas.Columns.Add("Iraupena", GetType(Integer))
                citas.Columns.Add("Eguna", GetType(String))
                citas.Columns.Add("Ordua", GetType(String))
                citas.Columns.Add("Idazkariaren emaila", GetType(String))
                citas.Columns.Add("Ikaslearen emaila", GetType(String))
                citas.Columns.Add("Ikaslearen NANa", GetType(String))
                While i < dv.Count
                    Dim drv = dv.Item(i)
                    If Not lastId = drv.id Then
                        Dim tableRow = citas.NewRow()
                        tableRow("Kodea") = drv.id
                        tableRow("Tramitea") = drv.tramite
                        tableRow("Iraupena") = drv.duracion
                        tableRow("Eguna") = drv.dia.ToString("dd/MM/yyyy")
                        tableRow("Ordua") = drv.hora.ToString("hh\:mm")
                        tableRow("Idazkariaren emaila") = drv.emailSecretario
                        tableRow("Ikaslearen emaila") = drv.emailAlumno
                        tableRow("Ikaslearen NANa") = drv.dni
                        citas.Rows.Add(tableRow)
                        lastId = drv.id
                    End If
                    i += 1
                End While
            End If
            GridView1.DataSource = citas
            GridView1.DataBind()
        Catch ex As Exception
        End Try
    End Sub

    Private Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Panel1.CssClass = ""
    End Sub

    Private Sub btnSi_Click(sender As Object, e As EventArgs) Handles btnSi.Click
        Dim codigo = GridView1.SelectedRow.Cells(1).Text
        Dim emailUsuario = email_alumno_cita(codigo)
        msg.Text = Citas_Facultad.DataWriter.cancelar_cita_previa(codigo, 2, Thread.CurrentThread.CurrentCulture.Name)
        Dim mensaje As String = "Lamentablemente, hemos tenido que cancelar tu cita del día " & GridView1.SelectedRow.Cells(4).Text & " a la hora " & GridView1.SelectedRow.Cells(5).Text
        Correo.Correo.enviarEmail(emailUsuario, mensaje, "Cancelación de cita")
        Panel1.CssClass = "invisible"
        populate_gridview()
    End Sub

    Private Sub btnNo_Click(sender As Object, e As EventArgs) Handles btnNo.Click
        Panel1.CssClass = "invisible"
        msg.Text = ""
    End Sub

    Private Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        populate_gridview()
    End Sub

    Private Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        populate_gridview()
    End Sub

    Private Sub DropDownList2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList2.SelectedIndexChanged
        populate_gridview()
    End Sub

    Private Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged
        populate_gridview()
    End Sub
End Class