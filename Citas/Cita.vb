Imports Citas

Public Class Cita

    Public id As Integer
    Public dia As Date
    Public hora As TimeSpan
    Public idSecretario As String
    Public duracion As String
    Public dni As String

    Public Sub New(ByVal id2 As Integer, ByVal dia2 As Date, ByVal hora2 As TimeSpan, ByVal idSecretario2 As String, ByVal duracion2 As Integer, ByVal dni2 As String)
        id = id2
        dia = dia2
        hora = hora2
        idSecretario = idSecretario2
        duracion = duracion2
        dni = dni2
    End Sub

End Class
