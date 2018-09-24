Public Class Cita2
    Public id As Integer
    Public dia As Date
    Public hora As TimeSpan
    Public emailSecretario As String
    Public duracion As Integer
    Public tramite As String
    Public emailAlumno As String
    Public estado As String
    Public dni As String

    Public Sub New(ByVal id2 As Integer, ByVal dia2 As Date, ByVal hora2 As TimeSpan, ByVal emailSecretario2 As String, ByVal duracion2 As Integer, ByVal tramite2 As String, ByVal emailAlumno2 As String, ByVal estado2 As String, ByVal dni2 As String)
        id = id2
        dia = dia2
        hora = hora2
        emailSecretario = emailSecretario2
        duracion = duracion2
        tramite = tramite2
        emailAlumno = emailAlumno2
        estado = estado2
        dni = dni2
    End Sub
End Class
