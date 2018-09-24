Imports MySql.Data.MySqlClient
Imports Citas

Public Class DataAccess
    Private Shared comm As New MySqlCommand

    Private Shared Function conectar() As MySqlConnection
        Try
            Dim connstring As String = ""
            Dim conexion = New MySqlConnection(connstring)
            conexion.Open()
            Return conexion
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    Private Shared Sub cerrar_conexion(conexion As MySqlConnection)
        conexion.Close()
    End Sub

    Public Shared Function iniciar_sesion(ByVal email As String, ByVal password As String) As String
        Dim st = "select pass, confirmado, tipo from Usuarios where email='" & email & "'"
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        If reader.Read Then
            Dim pass = reader.Item("pass")
            Dim confirmado = reader.Item("confirmado")
            Dim tipo = reader.Item("tipo")
            cerrar_conexion(conn)
            If pass = password Then
                If confirmado Then
                    If tipo.Equals("Secretario") Then
                        Return "Secretario" 'Caso en el que la contraseña es correcta y el usuario ha sido confirmado siendo el tipo Secretario
                    ElseIf tipo.Equals("Alumno") Then
                        Return "Alumno" 'Caso en el que la contraseña es correcta y el usuario ha sido confirmado siendo el tipo Alumno
                    ElseIf tipo.Equals("Admin") Then
                        Return "Admin"
                    End If
                Else
                    Return "Error1" 'Caso en el que la contraseña es correcta pero el usuario no ha sido confirmado
                End If
            End If
        End If
        cerrar_conexion(conn)
        Return "Error2" 'Contraseña incorrecta o no existe usuario
    End Function

    Public Shared Function obtener_posibles_citas(ByVal id_tramite As Integer, ByVal dia As Date) As List(Of Citas.Cita)
        If Not (comprobar_fecha_de_tramite(id_tramite, dia)) Then
            Return Nothing
        End If
        Dim sel = "select duracion from Tareas where Id=" & id_tramite
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(sel, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        Dim duracion As Integer
        Dim disponibles As List(Of Citas.Cita) = New List(Of Citas.Cita)()
        If reader.Read Then
            duracion = reader.Item("duracion")
            cerrar_conexion(conn)
            sel = "select dni from (Usuarios INNER JOIN Edificio ON Usuarios.idEdificio=Edificio.Id) INNER JOIN EdificioTramite ON Edificio.Id=EdificioTramite.idEdificio WHERE EdificioTramite.idTarea=" & id_tramite & " AND Usuarios.email IN (SELECT SecreTramite.email FROM SecreTramite WHERE SecreTramite.tramite='" & id_tramite & "')"
            Dim conexion As MySqlConnection = conectar()
            comm = New MySqlCommand(sel, conexion)
            reader = comm.ExecuteReader()
            Dim i = 0
            Dim posibles As List(Of Citas.Cita) = New List(Of Citas.Cita)()
            Dim dni As String
            Dim conexiones As List(Of MySqlConnection) = New List(Of MySqlConnection)()
            While reader.Read
                dni = reader.Item("dni")
                sel = "select horaInit from Disponibilidad where (idCita IS NULL AND dia='" & dia & "' AND dni='" & dni & "') ORDER BY horaInit ASC"
                conexiones.Add(conectar())
                comm = New MySqlCommand(sel, conexiones.Last())
                Dim reader2 As MySqlDataReader = comm.ExecuteReader()
                While reader2.Read
                    Dim hora As TimeSpan = TimeSpan.Parse(reader2.Item("horaInit"))
                    posibles.Add(New Citas.Cita(i, dia, hora, dni, duracion, ""))
                    i += 1
                End While
                cerrar_conexion(conexiones.Last())
            End While
            If duracion = 15 Then
                disponibles = posibles
            ElseIf duracion = 30 Then
                disponibles = treinta_mins(posibles)
            Else
                disponibles = sesenta_mins(posibles)
            End If
            cerrar_conexion(conexion)
        End If
        cerrar_conexion(conn)
        disponibles = ordenar(disponibles)
        Return disponibles
    End Function

    Private Shared Function comprobar_fecha_de_tramite(id_tramite As Integer, dia As Date) As Boolean
        Dim st = "SELECT desde, hasta FROM DisponibilidadTareas WHERE idTarea=" & id_tramite
        Dim conexion As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conexion)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        While reader.Read
            Dim desde As Date = reader.Item("desde")
            Dim hasta As Date = reader.Item("hasta")
            If desde <= dia AndAlso dia <= hasta Then
                cerrar_conexion(conexion)
                Return True
            End If
        End While
        cerrar_conexion(conexion)
        Return False
    End Function

    Private Shared Function treinta_mins(ByVal posibles As List(Of Cita)) As List(Of Cita)
        Dim disponibles As List(Of Cita) = New List(Of Cita)
        While posibles.Count > 1
            Dim cita As Cita = posibles.Item(0)
            Dim cita2 As Cita = posibles.Item(1)
            Dim horaFin As TimeSpan = cita.hora.Add(TimeSpan.FromMinutes(15))
            If horaFin = cita2.hora Then
                disponibles.Add(cita)
            End If
            posibles.RemoveAt(0)
        End While
        Return disponibles
    End Function

    Private Shared Function sesenta_mins(posibles As List(Of Cita)) As List(Of Cita)
        Dim disponibles As List(Of Cita) = New List(Of Cita)
        While posibles.Count > 3
            Dim cita As Cita = posibles.Item(0)
            Dim cita2 As Cita = posibles.Item(1)
            Dim cita3 As Cita = posibles.Item(3)
            Dim horaFin1 As TimeSpan = cita.hora.Add(TimeSpan.FromMinutes(15))
            Dim horaFin2 As TimeSpan = cita.hora.Add(TimeSpan.FromMinutes(45))
            If horaFin1 = cita2.hora And horaFin2 = cita3.hora Then
                disponibles.Add(cita)
            End If
            posibles.RemoveAt(0)
        End While
        Return disponibles
    End Function


    Private Shared Function ordenar(ByVal lista As List(Of Cita)) As List(Of Cita)
        Dim ordenada As List(Of Cita) = New List(Of Cita)
        Dim menor As Integer
        While Not (lista.Count = 0)
            menor = 0
            Dim citaMenor As Citas.Cita
            Dim citaActual As Citas.Cita
            For i As Integer = 0 To lista.Count - 1
                citaMenor = lista.Item(menor)
                citaActual = lista.Item(i)
                If citaMenor.hora > citaActual.hora Then
                    menor = i
                End If
            Next
            ordenada.Add(lista.Item(menor))
            lista.RemoveAt(menor)
        End While
        Return ordenada
    End Function

    Public Shared Function obtener_cita(ByVal id As Integer, ByVal emailUsuario As String) As Cita
        Dim st = "SELECT Citas.Id, dia, horaInit FROM (Disponibilidad INNER JOIN Citas ON Citas.Id=Disponibilidad.idCita) INNER JOIN Usuarios ON Citas.idUsuario=Usuarios.dni WHERE Citas.Id=" & id & " AND Usuarios.email='" & emailUsuario & "' ORDER BY horaInit ASC"
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        If reader.Read Then
            Dim cita As New Cita(id, Date.Parse(reader.Item("dia")), TimeSpan.Parse(reader.Item("horaInit")), Nothing, Nothing, Nothing)
            cerrar_conexion(conn)
            Return cita
        Else
            cerrar_conexion(conn)
            Return Nothing
        End If
    End Function

    Public Shared Function comprobar_cita(ByVal id As Integer, ByVal email As String) As Boolean
        Dim st = "SELECT Citas.Id FROM Citas INNER JOIN Usuarios ON Citas.idUsuario=Usuarios.dni WHERE Usuarios.email='" & email & "' AND Citas.Id=" & id
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        If reader.Read Then
            cerrar_conexion(conn)
            Return True
        Else
            cerrar_conexion(conn)
            Return False
        End If
    End Function

    Public Shared Function email_alumno_cita(ByVal id As Integer) As String
        Dim st = "SELECT email FROM Citas INNER JOIN Usuarios ON Citas.idUsuario=Usuarios.dni WHERE Citas.Id=" & id
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        If reader.Read Then
            Dim email = reader.Item("email")
            cerrar_conexion(conn)
            Return email
        End If
        cerrar_conexion(conn)
        Return Nothing
    End Function

    Public Shared Function obtener_citas(ByVal emailSecre As String, ByVal dia As Date) As List(Of Cita)
        Dim st = "SELECT Citas.Id AS id, Citas.idUsuario AS idUsuario, Disponibilidad.horaInit AS hora, Usuarios.email AS email, Tareas.duracion AS duracion, Tareas.nombre AS nombre FROM ((Citas INNER JOIN Disponibilidad ON Disponibilidad.idCita=Citas.Id) INNER JOIN Usuarios ON Citas.idUsuario=Usuarios.dni) INNER JOIN Tareas ON Citas.idTarea=Tareas.Id WHERE Disponibilidad.dia='" & dia & "' AND Disponibilidad.dni=(SELECT dni FROM Usuarios WHERE email='" & emailSecre & "') ORDER BY idCita ASC, horaInit ASC"
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        Dim citas = New List(Of Cita)
        While reader.Read
            citas.Add(New Cita(reader.Item("id"), dia, TimeSpan.Parse(reader.Item("hora")), reader.Item("email") & "////" & reader.Item("nombre"), reader.Item("duracion"), reader.Item("idUsuario")))
        End While
        cerrar_conexion(conn)
        citas = ordenar(citas)
        Return citas
    End Function

    Public Shared Function obtener_otras_citas(ByVal emailSecre As String, ByVal dia As Date) As List(Of Cita2)
        Dim st = "SELECT * FROM OtrasCitas WHERE emailSecretario='" & emailSecre & "' AND  dia='" & dia & "'"
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        Dim citas = New List(Of Cita2)
        While reader.Read
            citas.Add(New Cita2(reader.Item("idCita"), dia, TimeSpan.Parse(reader.Item("hora")), reader.Item("emailSecretario"), reader.Item("duracion"), reader.Item("nombreTarea"), reader.Item("emailAlumno"), reader.Item("estado"), ""))
        End While
        cerrar_conexion(conn)
        Return citas
    End Function

    Private Shared Function ordenar(ByVal lista As List(Of Cita2)) As List(Of Cita2)
        Dim ordenada As List(Of Cita2) = New List(Of Cita2)
        Dim menor As Integer
        While Not (lista.Count = 0)
            menor = 0
            Dim citaMenor As Citas.Cita2
            Dim citaActual As Citas.Cita2
            For i As Integer = 0 To lista.Count - 1
                citaMenor = lista.Item(menor)
                citaActual = lista.Item(i)
                If citaMenor.hora > citaActual.hora Then
                    menor = i
                End If
            Next
            ordenada.Add(lista.Item(menor))
            lista.RemoveAt(menor)
        End While
        Return ordenada
    End Function

    Public Shared Function obtener_todas_citas(ByVal dia As Date, ByVal edificio As Integer) As List(Of Cita2)
        Dim conn As MySqlConnection = conectar()
        Try
            Dim st = "SELECT Citas.Id AS id, Disponibilidad.dia AS dia, Disponibilidad.horaInit AS hora, " +
                        "Tareas.nombre AS nombre, Tareas.duracion AS duracion, " +
                        "Alumno.email AS emailAlumno, Alumno.dni AS dniAlumno, Secretario.email AS emailSecretario " +
                        "FROM ((((Citas INNER JOIN Usuarios AS Alumno ON Citas.idUsuario=Alumno.dni) " +
                        "INNER JOIN Disponibilidad ON Citas.Id=Disponibilidad.idCita) " +
                        "INNER JOIN Tareas ON Citas.idTarea=Tareas.Id) " +
                        "INNER JOIN Usuarios AS Secretario ON Disponibilidad.dni=Secretario.dni) " +
                        "WHERE Disponibilidad.dia='" & dia & "' AND Secretario.idEdificio='" & edificio & "' " +
                        "ORDER BY Citas.Id ASC, Disponibilidad.horaInit ASC"
            comm = New MySqlCommand(st, conn)
            Dim reader As MySqlDataReader = comm.ExecuteReader()
            Dim citas = New List(Of Cita2)
            While reader.Read
                citas.Add(New Cita2(reader.Item("id"), dia, TimeSpan.Parse(reader.Item("hora")), reader.Item("emailSecretario"), reader.Item("duracion"), reader.Item("nombre"), reader.Item("emailAlumno"), "", reader.Item("dniAlumno")))
            End While
            cerrar_conexion(conn)
            citas = ordenar(citas)
            Return citas
        Catch ex As Exception
            cerrar_conexion(conn)
            Return Nothing
        End Try
        cerrar_conexion(conn)
        Return Nothing
    End Function

    Public Shared Function obtener_todas_citas(ByVal dia As Date, ByVal edificio As Integer, ByVal tramite As Integer) As List(Of Cita2)
        Dim conn As MySqlConnection = conectar()
        Try
            Dim st = "SELECT Citas.Id AS id, Disponibilidad.dia AS dia, Disponibilidad.horaInit AS hora, " +
                        "Tareas.nombre AS nombre, Tareas.duracion AS duracion, " +
                        "Alumno.email AS emailAlumno, Alumno.dni AS dniAlumno, Secretario.email AS emailSecretario " +
                        "FROM ((((Citas INNER JOIN Usuarios AS Alumno ON Citas.idUsuario=Alumno.dni) " +
                        "INNER JOIN Disponibilidad ON Citas.Id=Disponibilidad.idCita) " +
                        "INNER JOIN Tareas ON Citas.idTarea=Tareas.Id) " +
                        "INNER JOIN Usuarios AS Secretario ON Disponibilidad.dni=Secretario.dni) " +
                        "WHERE Disponibilidad.dia='" & dia & "' AND Secretario.idEdificio='" & edificio & "' " +
                        "AND Tareas.Id='" & tramite & "' " +
                        "ORDER BY Citas.Id ASC, Disponibilidad.horaInit ASC"
            comm = New MySqlCommand(st, conn)
            Dim reader As MySqlDataReader = comm.ExecuteReader()
            Dim citas = New List(Of Cita2)
            While reader.Read
                citas.Add(New Cita2(reader.Item("id"), dia, TimeSpan.Parse(reader.Item("hora")), reader.Item("emailSecretario"), reader.Item("duracion"), reader.Item("nombre"), reader.Item("emailAlumno"), "", reader.Item("dniAlumno")))
            End While
            cerrar_conexion(conn)
            citas = ordenar(citas)
            Return citas
        Catch ex As Exception
            cerrar_conexion(conn)
            Return Nothing
        End Try
        cerrar_conexion(conn)
        Return Nothing
    End Function

    Public Shared Function comprobar_nocita_tramite(ByVal email As String, ByVal idTarea As Integer) As Boolean
        Dim st = "SELECT * FROM Citas WHERE idTarea=" & idTarea & " AND idUsuario=(SELECT dni FROM Usuarios WHERE email='" & email & "')"
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        If reader.Read Then
            cerrar_conexion(conn)
            Return False
        Else
            cerrar_conexion(conn)
            Return True
        End If
    End Function
End Class