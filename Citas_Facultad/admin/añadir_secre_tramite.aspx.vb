﻿Imports Citas_Facultad.DataWriter

Public Class añadir_secre_tramite
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.QueryString.Count = 1 Then
            Server.Transfer("default.aspx", True)
        End If
    End Sub

    'Al eliminar
    Private Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim email = GridView1.SelectedRow.Cells(0).Text
        Dim tramite As Integer = CInt(Request.QueryString("id"))
        eliminar_secre_tramite(email, tramite)
        GridView1.SelectedIndex = -1
        GridView1.DataBind()
        GridView2.DataBind()
    End Sub

    'Al agregar
    Private Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged
        Dim email = GridView2.SelectedRow.Cells(0).Text
        Dim tramite As Integer = CInt(Request.QueryString("id"))
        agregar_secre_tramite(email, tramite)
        GridView2.SelectedIndex = -1
        GridView1.DataBind()
        GridView2.DataBind()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("gestionar_tramites.aspx")
    End Sub
End Class