# Procedure appointments
MagnaSIS's project in which is implemented a service to manage procedure appointments. It has been programmed using **Visual Studio 2017**.

Other languages/Otros idiomas: [Spanish/Español](README.md)

## Database
This project is ready to work with MySQL databases. The methods of both classes and the accesses using SqlDataSource's. You should both database access classes as well as the *Web.config* file, in the root of *Citas_Facultad* and write the connection string.
To have this working, we used **MySQL for Visual Studio 1.2.8** and **MySQL Connector Net 6.9.12**. If you use a different version, it might not work properly.

## Translations
Translations have been made using **ResX Manager**. With this tool translation files are created, files that we don't include in the uploaded project because they contain proprietary content of another company. The translations were made in spanish and basque originally. Every time a translation is added, you have to delete some attributes that appear in the first tag of the files. This attributes value is *auto*.

## Email sending
To have the email sending working, you have to edit the *Correo.vb* file and add an email address, change the subject (if you want to) and write the password. The *smtp* used is Google's, but it can be changed and use another account.
### Links on emails
A lot of emails containt links (user confirmation email, for example). You should change all of the link on the email messages and write the new links. To find where to make this changes, we can use Visual Studio's search tool and search for the usage of the *enviarEmail* method.

## Others
Inside of every file ending like *\*.Master*, we can change the title of the page, and the title that appears in the tab of the browser. You have to change it twice in for pages.

The Legal Advice page is empty.
