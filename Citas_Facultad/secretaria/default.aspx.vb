Imports System.IO
Imports System.Threading
Imports Citas_Facultad.DataAccess

Public Class _default1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        populate_gridview()
    End Sub

    Private Sub populate_gridview()
        Try
            Dim lista_citas = obtener_citas(Session("usuario"), Date.Today)
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

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("imprimir_citas.aspx")
    End Sub

    Private Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim codigo = GridView1.SelectedRow.Cells(1).Text
        Dim emailUsuario = email_alumno_cita(codigo)
        Citas_Facultad.DataWriter.cancelar_cita_previa(codigo, 5, Thread.CurrentThread.CurrentCulture.Name)
        populate_gridview()
    End Sub
End Class