# Trámites citas
Proyecto de MagnaSIS en el que se implementa un servicio para manejar trámites de citas. Ha sido programado usando **Visual Studio 2017**.

Otros idiomas/Other languages: [Inglés/English](README.en.md)

## Base de datos
Este proyecto está preparado para trabajar con una base de datos MySQL. Tanto los métodos de las dos clases, como los accesos mediante los SqlDataSource. Habría que editar las dos clases de acceso a base de datos así como el archivo *Web.config* de la raíz de *Citas_Facultad* y escribir el string de conexión.
Para que esto funcione, se han usado **MySQL for Visual Studio 1.2.8** y **MySQL Connector Net 6.9.12**. Es posible que, si se usa una versión diferente, no funcione correctamente.

## Traducciones
Las traducciones se han hecho utilizando **ResX Manager**. Con esta herramienta se crean unos archivos de traducción, archivos que no se incluyen en el proyecto subido por contener contenido propietario de otra empresa. La traducción estaba pensada en castellano y en euskera. Cada vez que se añade una traduccion, hay que borrar algunos atributos que aparecen en la etiqueta superior. Estos atributos tienen *auto* como valor.

## Envío de correos electrónicos
Para que el envío de correos electrónicos funcione, hay que editar el archivo *Correo.vb* y añadir una dirección de correo, modificar el asunto (si se quiere) y escribir la contraseña. El *smtp* utilizado es el de Google, pero se puede cambiar y utilizar otra cuenta.
### Enlaces en correos electrónicos
Muchos correos contienen un enlace (el correo de confirmación, por ejemplo). Habría que cambiar todos los enlaces en los mensajes de los correos por los nuevos enlaces. Para encontrar dónde hacer estos cambios, podemos utilizar la herramienta de búsqueda de Visua Studio y buscar dónde se usa el método *enviarEmail*.

## Otros
Dentro de cada archivo acabado en *\*.Master*, podemos cambiar el título de la página, así como el título que aparece en la pestaña del navegador. Hay que cambiarlo en dos sitios, en las cuatro páginas que hay.

La página del Aviso Legal queda vacía.
