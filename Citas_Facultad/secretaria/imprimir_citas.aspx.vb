Imports Citas_Facultad.DataAccess

Public Class imprimir_citas
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
End Class