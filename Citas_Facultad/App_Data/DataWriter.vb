Imports MySql.Data.MySqlClient

Public Class DataWriter
    Private Shared comm As New MySqlCommand

    Private Shared Function conectar() As MySqlConnection
        Try
            Dim connstring As String = "s"
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

    Public Shared Function insertar_usuario(ByVal email As String, ByVal dni As String, ByVal numconfir As Integer, ByVal tipo As String, ByVal pass As String, ByVal edificio As Integer) As String
        Dim st As String
        If edificio = 0 Then
            st = "insert into Usuarios (email, dni, numconfir, confirmado, tipo, pass) values ('" & email & "', '" & dni & "', '" & numconfir & "', '0', '" & tipo & "', '" & pass & "')"
        Else
            st = "insert into Usuarios (email, dni, numconfir, confirmado, tipo, pass, idEdificio) values ('" & email & "', '" & dni & "', '" & numconfir & "', '0', '" & tipo & "', '" & pass & "', " & edificio & ")"
        End If
        Dim numregs As Integer
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Try
            numregs = comm.ExecuteNonQuery()
        Catch ex As Exception
            cerrar_conexion(conn)
            Return ex.Message
        End Try
        cerrar_conexion(conn)
        Return (CStr(numregs))
    End Function

    Public Shared Function confirmar_usuario(ByVal email As String, ByVal num As Integer) As Boolean
        Dim st = "select numconfir from Usuarios where email='" & email & "'"
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        If reader.Read Then
            Dim numconfir = reader.Item("numconfir")
            reader.Close()
            If numconfir.Equals(num) Then
                Dim update = "update Usuarios set confirmado='1', numconfir='0' where email='" & email & "'"
                Dim conexion As MySqlConnection = conectar()
                comm = New MySqlCommand(update, conexion)
                Dim ret = comm.ExecuteNonQuery()
                If ret = 1 Then
                    cerrar_conexion(conexion)
                    cerrar_conexion(conn)
                    Return True
                End If
                cerrar_conexion(conexion)
            End If
        Else
            reader.Close()
        End If
        cerrar_conexion(conn)
        Return False
    End Function

    Public Shared Function solicitar_cambio(ByVal email As String, ByVal clave As Integer) As Boolean
        Dim st = "select email from Usuarios where email='" & email & "'"
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        If reader.Read Then
            Dim update = "update Usuarios set numconfir='" & clave & "' where email='" & email & "'"
            Dim conexion As MySqlConnection = conectar()
            comm = New MySqlCommand(update, conexion)
            Dim ret = comm.ExecuteNonQuery()
            If ret = 1 Then
                cerrar_conexion(conexion)
                cerrar_conexion(conn)
                Return True
            End If
            cerrar_conexion(conexion)
        End If
        cerrar_conexion(conn)
        Return False
    End Function

    Public Shared Function cambiar_password(ByVal email As String, ByVal clave As Integer, ByVal password As String) As Boolean
        If Not clave = 0 Then
            Dim st = "select numconfir from Usuarios where email='" & email & "'"
            Dim conn As MySqlConnection = conectar()
            comm = New MySqlCommand(st, conn)
            Dim reader As MySqlDataReader = comm.ExecuteReader()
            If reader.Read Then
                Dim num = reader.Item("numconfir")
                If num.Equals(clave) Then
                    Dim update = "update Usuarios set pass='" & password & "', numconfir=0, confirmado='1' where email='" & email & "'"
                    Dim conexion As MySqlConnection = conectar()
                    comm = New MySqlCommand(update, conexion)
                    Dim ret = comm.ExecuteNonQuery()
                    If ret = 1 Then
                        cerrar_conexion(conexion)
                        cerrar_conexion(conn)
                        Return True
                    End If
                End If
            End If
            cerrar_conexion(conn)
            Return False
        End If
        Return False
    End Function

    Public Shared Function confirmar_empleado(ByVal email As String, ByVal num As Integer, ByVal pass As String) As Boolean
        Dim st = "select numconfir from Usuarios where email='" & email & "'"
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        If reader.Read Then
            Dim numconfir = reader.Item("numconfir")
            If numconfir.Equals(num) Then
                Dim update = "update Usuarios set confirmado='1', numconfir='0', pass='" & pass & "' where email='" & email & "'"
                Dim conexion As MySqlConnection = conectar()
                comm = New MySqlCommand(update, conexion)
                Dim ret = comm.ExecuteNonQuery()
                If ret = 1 Then
                    cerrar_conexion(conexion)
                    cerrar_conexion(conn)
                    Return True
                End If
                cerrar_conexion(conexion)
            End If
        End If
        cerrar_conexion(conn)
        Return False
    End Function

    Public Shared Function insertar_disponibilidad(ByVal dni_empleado As String, ByVal dia As Date, ByVal horaInit As TimeSpan, ByVal horaFin As TimeSpan, ByVal lang As String) As String
        If (horaInit > horaFin) Then
            If (lang.Equals("es-ES")) Then
                Return "La hora inicial es después de la hora final"
            Else
                Return "Bukaera ordua hasierakoa baino lehenago da"
            End If
        End If
        Dim sel = "select horaInit from Disponibilidad where dni='" & dni_empleado & "' and dia='" & dia & "'"
        Dim numregs As Integer
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(sel, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()

        Dim horas As List(Of TimeSpan) = New List(Of TimeSpan)()

        While (reader.Read)
            Dim horaInitComp As TimeSpan = TimeSpan.Parse(reader.Item("horaInit"))
            horas.Add(horaInitComp)
        End While
        cerrar_conexion(conn)
        Dim st As String
        While horaInit < horaFin
            If Not (horas.Contains(horaInit)) Then
                st = "insert into Disponibilidad (dni, dia, horaInit) values ('" & dni_empleado & "', '" & dia & "', '" & horaInit.ToString("hh\:mm") & "')"
                Dim conexion As MySqlConnection = conectar()
                comm = New MySqlCommand(st, conexion)
                Try
                    numregs = comm.ExecuteNonQuery()
                Catch ex As Exception
                    cerrar_conexion(conexion)
                    Return ex.Message
                End Try
                cerrar_conexion(conexion)
            End If
            horaInit = horaInit.Add(TimeSpan.FromMinutes(15))
        End While
        Return numregs
    End Function

    Public Shared Function insertar_tramite(ByVal nombre As String, ByVal duracion As Integer, ByVal edificio As Integer) As String
        Dim st = "insert into Tareas (nombre, duracion) values ('" & nombre & "', '" & duracion & "'); SELECT LAST_INSERT_ID() AS Id;"
        Dim id As Integer
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Try
            Dim reader As MySqlDataReader = comm.ExecuteReader()
            If (reader.Read) Then
                id = reader.Item("Id")
                Dim st2 = "insert into EdificioTramite (idEdificio, idTarea) values (" & edificio & ", " & id & ")"
                Dim conexion As MySqlConnection = conectar()
                comm = New MySqlCommand(st2, conexion)
                Try
                    comm.ExecuteNonQuery()
                Catch ex As Exception
                    cerrar_conexion(conexion)
                    cerrar_conexion(conn)
                    Return ex.Message
                End Try
                cerrar_conexion(conexion)
            End If
        Catch ex As Exception
            cerrar_conexion(conn)
            Return ex.Message
        End Try
        cerrar_conexion(conn)
        Return (CStr(id))
    End Function

    Public Shared Function insertar_disponibilidad_tramite(ByVal id_tramite As Integer, ByVal desde As Date, ByVal hasta As Date, ByVal lang As String) As String
        If (desde > hasta) Then
            If (lang.Equals("es-ES")) Then
                Return "El día inicial es después del día final"
            Else
                Return "Azkeneko eguna hasierakoa baino lehenago da"
            End If
        End If
        Dim sel = "select desde, hasta from DisponibilidadTareas where idTarea='" & id_tramite & "'"
        Dim st = "insert into DisponibilidadTareas (idTarea, desde, hasta) values ('" & id_tramite & "', '" & desde & "', '" & hasta & "')"
        Dim numregs As Integer
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(sel, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        Dim correcto As Boolean = True

        While (reader.Read And correcto)
            Dim desdeComp As Date = Date.Parse(reader.Item("desde"))
            Dim hastaComp As Date = Date.Parse(reader.Item("hasta"))
            If (Not (desde < desdeComp AndAlso hasta <= desdeComp) AndAlso Not (desde >= hastaComp)) Then
                correcto = False
            End If
        End While
        cerrar_conexion(conn)
        If correcto Then
            Dim conexion As MySqlConnection = conectar()
            comm = New MySqlCommand(st, conexion)
            Try
                numregs = comm.ExecuteNonQuery()
                cerrar_conexion(conexion)
            Catch ex As Exception
                cerrar_conexion(conexion)
                Return ex.Message
            End Try
            Return numregs
        Else
            If (lang.Equals("es-ES")) Then
                Return "Las fechas elegidas solapan con alguna ya existente"
            Else
                Return "Aukeratutako egunak beste data batzuekin gainjartzen dira"
            End If
        End If
    End Function

    Public Shared Function insertar_cita(ByVal dia As Date, ByVal hora As TimeSpan, ByVal idTarea As Integer, ByVal dniSecretario As String, ByVal emailAlumno As String, ByVal duracion As Integer) As String
        Dim st = "INSERT INTO Citas (idTarea, idUsuario) VALUES (" & idTarea & ", (SELECT dni FROM Usuarios WHERE email='" & emailAlumno & "')); SELECT LAST_INSERT_ID() AS Id"
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim id = 0
        Try
            Dim reader As MySqlDataReader = comm.ExecuteReader()
            If reader.Read Then
                id = reader.Item("Id")
                If (duracion = 15) Then
                    st = "UPDATE Disponibilidad SET idCita=" & id & " WHERE dni='" & dniSecretario & "' AND dia='" & dia & "' AND horaInit='" & hora.ToString("hh\:mm") & "'"
                ElseIf duracion = 30 Then
                    st = "UPDATE Disponibilidad SET idCita=" & id & " WHERE dni='" & dniSecretario & "' AND dia='" & dia & "' AND (horaInit='" & hora.ToString("hh\:mm") & "' OR horaInit='" & hora.Add(TimeSpan.FromMinutes(15)).ToString("hh\:mm") & "')"
                Else
                    st = "UPDATE Disponibilidad SET idCita=" & id & " WHERE dni='" & dniSecretario & "' AND dia='" & dia & "' AND (horaInit='" & hora.ToString("hh\:mm") & "' OR horaInit='" & hora.Add(TimeSpan.FromMinutes(15)).ToString("hh\:mm") & "' OR horaInit='" & hora.Add(TimeSpan.FromMinutes(30)).ToString("hh\:mm") & "' OR horaInit='" & hora.Add(TimeSpan.FromMinutes(45)).ToString("hh\:mm") & "')"
                End If
                Dim conexion As MySqlConnection = conectar()
                comm = New MySqlCommand(st, conexion)
                Dim nregs
                Try
                    nregs = comm.ExecuteNonQuery()
                    cerrar_conexion(conexion)
                Catch ex As Exception
                    cerrar_conexion(conexion)
                    cerrar_conexion(conn)
                    Return ex.Message
                End Try
            End If
        Catch ex As Exception
            cerrar_conexion(conn)
            Return ex.Message
        End Try
        cerrar_conexion(conn)
        Return id
    End Function

    Public Shared Function eliminar_disp_tramite(ByVal id As Integer, ByVal lang As String) As String
        Dim st = "SELECT desde, hasta, idTarea FROM DisponibilidadTareas WHERE Id=" & id
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        If reader.Read Then
            Dim desde As Date = Date.Parse(reader.Item("desde"))
            Dim hasta As Date = Date.Parse(reader.Item("hasta"))
            Dim idTarea As Integer = reader.Item("idTarea")
            st = "SELECT dia FROM Disponibilidad INNER JOIN Citas ON Disponibilidad.idCita=Citas.Id WHERE idTarea=" & idTarea
            Dim conexion As MySqlConnection = conectar()
            comm = New MySqlCommand(st, conexion)
            Dim reader2 As MySqlDataReader = comm.ExecuteReader()
            While reader2.Read
                Dim dia As Date = Date.Parse(reader2.Item("dia"))
                If desde <= dia AndAlso dia <= hasta Then
                    cerrar_conexion(conexion)
                    cerrar_conexion(conn)
                    Return "No se ha podido eliminar porque hay al menos una cita del trámite en estas fechas"
                End If
            End While
            cerrar_conexion(conexion)
            st = "DELETE FROM DisponibilidadTareas WHERE Id=" & id
            Dim conexion2 As MySqlConnection = conectar()
            comm = New MySqlCommand(st, conexion2)
            Try
                comm.ExecuteNonQuery()
                cerrar_conexion(conexion2)
            Catch ex As Exception
                cerrar_conexion(conexion2)
                cerrar_conexion(conn)
                Return ex.Message
            End Try
        End If
        cerrar_conexion(conn)
        If (lang.Equals("es-ES")) Then
            Return "Eliminado con éxito"
        Else
            Return "Arrakastarekin ezabatuta"
        End If
    End Function

    Private Shared Sub pasar_a_otros(ByVal id As Integer, ByVal estado As Integer)
        Dim st = "SELECT Disponibilidad.dia AS dia, Disponibilidad.horaInit AS hora, " +
            "Tareas.nombre AS nombre, Tareas.duracion AS duracion, " +
            "Alumno.email AS emailAlumno, Secretario.email AS emailSecretario " +
            "FROM ((((Citas INNER JOIN Usuarios AS Alumno ON Citas.idUsuario=Alumno.dni) " +
            "INNER JOIN Disponibilidad ON Citas.Id=Disponibilidad.idCita) " +
            "INNER JOIN Tareas ON Citas.idTarea=Tareas.Id) " +
            "INNER JOIN Usuarios AS Secretario ON Disponibilidad.dni=Secretario.dni) " +
            "WHERE Citas.Id=" & id & " ORDER BY Disponibilidad.horaInit ASC"
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        If reader.Read Then
            Dim msgestado As String
            If estado = 1 Then
                msgestado = "Cancelada por alumno/a-Ikasleak ezeztatuta"
            ElseIf estado = 2 Then
                msgestado = "Cancelada por administrador-Administratzaileak ezeztatuta"
            ElseIf estado = 3 Then
                msgestado = "Finalizada-Bukatuta"
            ElseIf estado = 4 Then
                msgestado = "Cancelada por secretario/a-Idazkariak ezeztatuta"
            Else
                msgestado = "Alumno/a no presentado/a-Ikaslea ez aurkeztua"
            End If
            st = "INSERT INTO OtrasCitas VALUES ('" & id & "', '" & reader.Item("nombre") & "', " & reader.Item("duracion") & ", '" & reader.Item("dia") & "', '" & reader.Item("hora") & "', '" & reader.Item("emailSecretario") & "', '" & reader.Item("emailAlumno") & "', '" & msgestado & "')"
            Dim conexion As MySqlConnection = conectar()
            comm = New MySqlCommand(st, conexion)
            Try
                comm.ExecuteNonQuery()
                cerrar_conexion(conexion)
            Catch ex As Exception
                cerrar_conexion(conexion)
                cerrar_conexion(conn)
            End Try
        End If
        cerrar_conexion(conn)
    End Sub

    Public Shared Function cancelar_cita_previa(ByVal id As Integer, ByVal quien As Integer, ByVal lang As String) As String
        pasar_a_otros(id, quien)
        Dim st = "SELECT Id FROM Disponibilidad WHERE idCita=" & id
        Dim conexion3 As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conexion3)
        Dim reader As MySqlDataReader = comm.ExecuteReader()
        Dim conexion As MySqlConnection = conectar()
        Try
            While reader.Read
                st = "UPDATE Disponibilidad SET idCita=NULL WHERE Id=" & reader.Item("Id")
                comm = New MySqlCommand(st, conexion)
                comm.ExecuteNonQuery()
                cerrar_conexion(conexion)
            End While
            cerrar_conexion(conexion3)
            st = "DELETE FROM Citas WHERE Id=" & id
            Dim conexion2 As MySqlConnection = conectar()
            comm = New MySqlCommand(st, conexion2)
            Try
                Dim i = comm.ExecuteNonQuery()
                cerrar_conexion(conexion2)
                If (lang.Equals("es-ES")) Then
                    Return "La cita ha sido eliminada con éxito"
                Else
                    Return "Hitzordua arrakastarekin ezabatu da"
                End If
            Catch ex As Exception
                cerrar_conexion(conexion2)
                Return ex.Message
            End Try
        Catch ex As Exception
            cerrar_conexion(conexion3)
            cerrar_conexion(conexion)
            Return ex.Message
        End Try
    End Function

    Public Shared Sub actualizar_bd()
        eliminar_citas_pasadas()
        eliminar_disponibilidad_pasada()
        eliminar_disponibilidad_tramite_pasada()
    End Sub

    Private Shared Sub eliminar_citas_pasadas()
        Dim conexion As MySqlConnection = conectar()
        Try
            Dim st = "SELECT DISTINCT idCita, dia FROM Disponibilidad WHERE idCita IS NOT NULL"
            comm = New MySqlCommand(st, conexion)
            Dim reader As MySqlDataReader = comm.ExecuteReader()
            While reader.Read
                Dim dia = reader.Item("dia")
                If dia < Date.Today Then
                    cancelar_cita_previa(reader.Item("idCita"), 3, "es-ES")
                End If
            End While
            cerrar_conexion(conexion)
        Catch ex As Exception
            cerrar_conexion(conexion)
        End Try
    End Sub

    Private Shared Sub eliminar_disponibilidad_pasada()
        Dim conexion2 As MySqlConnection = conectar()
        Try
            Dim st = "SELECT DISTINCT dia FROM Disponibilidad"
            comm = New MySqlCommand(st, conexion2)
            Dim reader As MySqlDataReader = comm.ExecuteReader()
            While reader.Read
                Dim dia = reader.Item("dia")
                If dia < Date.Today Then
                    st = "DELETE FROM Disponibilidad WHERE dia='" & dia & "'"
                    Dim conexion As MySqlConnection = conectar()
                    comm = New MySqlCommand(st, conexion)
                    Try
                        comm.ExecuteNonQuery()
                        cerrar_conexion(conexion)
                    Catch ex As Exception
                        cerrar_conexion(conexion)
                    End Try
                End If
            End While
            cerrar_conexion(conexion2)
        Catch ex As Exception
            cerrar_conexion(conexion2)
        End Try
    End Sub

    Private Shared Sub eliminar_disponibilidad_tramite_pasada()
        Dim conexion2 As MySqlConnection = conectar()
        Try
            Dim st = "SELECT DISTINCT hasta FROM DisponibilidadTareas"
            comm = New MySqlCommand(st, conexion2)
            Dim reader As MySqlDataReader = comm.ExecuteReader()
            While reader.Read
                Dim dia = reader.Item("hasta")
                If dia < Date.Today Then
                    st = "DELETE FROM DisponibilidadTareas WHERE hasta='" & dia & "'"
                    Dim conexion As MySqlConnection = conectar()
                    comm = New MySqlCommand(st, conexion)
                    Try
                        comm.ExecuteNonQuery()
                        cerrar_conexion(conexion)
                    Catch ex As Exception
                        cerrar_conexion(conexion)
                    End Try
                End If
            End While
            cerrar_conexion(conexion2)
        Catch ex As Exception
            cerrar_conexion(conexion2)
        End Try
    End Sub

    Public Shared Sub borrar_base_de_datos()
        Dim st = "DELETE FROM Disponibilidad"
        Dim st2 = "DELETE FROM DisponibilidadTareas" 'No borro los trámites
        Dim st3 = "DELETE FROM Citas"
        Dim st4 = "DELETE FROM OtrasCitas"
        Dim conexion As MySqlConnection = conectar()
        Dim conexion2 As MySqlConnection = conectar()
        Dim conexion3 As MySqlConnection = conectar()
        Dim conexion4 As MySqlConnection = conectar()
        Try
            comm = New MySqlCommand(st, conexion4)
            comm.ExecuteNonQuery()
            comm = New MySqlCommand(st2, conexion)
            comm.ExecuteNonQuery()
            comm = New MySqlCommand(st3, conexion2)
            comm.ExecuteNonQuery()
            comm = New MySqlCommand(st4, conexion3)
            comm.ExecuteNonQuery()
        Catch ex As Exception
        End Try
        cerrar_conexion(conexion)
        cerrar_conexion(conexion2)
        cerrar_conexion(conexion3)
        cerrar_conexion(conexion4)
    End Sub

    Public Shared Function eliminar_tramite(ByVal codigo As String, ByVal lang As String) As String
        actualizar_bd()
        Try
            Dim st = "SELECT Id FROM DisponibilidadTareas WHERE idTarea='" & codigo & "'"
            Dim conn As MySqlConnection = conectar()
            comm = New MySqlCommand(st, conn)
            Dim reader As MySqlDataReader = comm.ExecuteReader()
            If Not reader.Read Then
                cerrar_conexion(conn)
                st = "DELETE FROM SecreTramite WHERE tramite='" & codigo & "'"
                Dim conexion As MySqlConnection = conectar()
                comm = New MySqlCommand(st, conexion)
                Try
                    comm.ExecuteNonQuery()
                    cerrar_conexion(conexion)
                    st = "DELETE FROM EdificioTramite WHERE idTarea='" & codigo & "'"
                    Dim conexion2 As MySqlConnection = conectar()
                    comm = New MySqlCommand(st, conexion2)
                    Try
                        comm.ExecuteNonQuery()
                        cerrar_conexion(conexion2)
                        st = "DELETE FROM Tareas WHERE Id='" & codigo & "'"
                        Dim conexion3 As MySqlConnection = conectar()
                        comm = New MySqlCommand(st, conexion3)
                        Try
                            comm.ExecuteNonQuery()
                            cerrar_conexion(conexion3)
                            If (lang.Equals("es-ES")) Then
                                Return "El trámite se ha borrado correctamente"
                            Else
                                Return "Tramitea ondo ezabatu da"
                            End If
                        Catch ex As Exception
                            cerrar_conexion(conexion3)
                            Return ex.Message
                        End Try
                    Catch ex As Exception
                        cerrar_conexion(conexion2)
                        Return ex.Message
                    End Try
                Catch ex As Exception
                    cerrar_conexion(conexion)
                    Return ex.Message
                End Try
            Else
                If (lang.Equals("es-ES")) Then
                    Return "Este trámite no se puede eliminar porque tiene disponibilidades"
                Else
                    Return "Tramite hau ezin da ezabatu erabilgarritasunak dituelako"
                End If
            End If
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function

    Public Shared Function agregar_secre_tramite(ByVal email As String, ByVal tramite As Integer) As Integer
        Dim st = "INSERT INTO SecreTramite (email, tramite) VALUES ('" & email & "','" & tramite & "')"
        Dim conn As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conn)
        Dim numregs
        Try
            numregs = comm.ExecuteNonQuery()
        Catch ex As Exception
            cerrar_conexion(conn)
            Return 0
        End Try
        cerrar_conexion(conn)
        Return numregs
    End Function

    Public Shared Function eliminar_secre_tramite(ByVal email As String, ByVal tramite As Integer) As Integer
        Dim st = "DELETE FROM SecreTramite WHERE email='" & email & "' AND tramite='" & tramite & "'"
        Dim conexion As MySqlConnection = conectar()
        comm = New MySqlCommand(st, conexion)
        Dim numregs
        Try
            numregs = comm.ExecuteNonQuery()
            cerrar_conexion(conexion)
        Catch ex As Exception
            cerrar_conexion(conexion)
            Return 0
        End Try
        Return numregs
    End Function
End Class