Imports System.Globalization
Imports System.Threading
Imports System.Web.SessionState

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al iniciar la aplicación
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al iniciar la sesión
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al comienzo de cada solicitud
        Dim cookie As HttpCookie
        cookie = Request.Cookies("language")
        If Not cookie Is Nothing Then
            Thread.CurrentThread.CurrentUICulture = New CultureInfo(cookie.Value)
            Thread.CurrentThread.CurrentCulture = New CultureInfo(cookie.Value)
        Else
            Thread.CurrentThread.CurrentUICulture = New CultureInfo("es-ES")
            Thread.CurrentThread.CurrentCulture = New CultureInfo("es-ES")
        End If
    End Sub


    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al intentar autenticar el uso
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando se produce un error
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando finaliza la sesión
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando finaliza la aplicación
    End Sub

End Class