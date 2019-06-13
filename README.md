# Formulario_de_Contacto_ASP.NET
Blog: http://cristiantorresalfaro.blogspot.com/2012/07/formulario-de-contacto-con-recaptcha.html

Siempre que desarrollamos una aplicacion <span style="font-weight: bold;">web</span> algo que nunca debe faltar es un <span style="font-weight: bold;">formulario de contacto</span> para que los usuarios que visitan o usan nuestra aplicacion web puedan ponerse en contacto con nosotros.<br />
<br />
Pues bien ahora veremos como hacer un<span style="font-weight: bold;"> formulario de contacto</span> en <span style="font-weight: bold;">asp.net</span> y ademas le agregaremos <a href="http://www.google.com/recaptcha" target="_blank">recaptcha</a>  para evitar<span style="font-weight: bold;"> spam</span>.<br />
<br />
<span style="color: rgb(0 , 204 , 204); font-weight: bold;">Aspectos a considerar</span><br />
<span style="font-weight: bold;">El ejemplo esta desarrollado en visual estudio 2010 con c# y vb.net</span><br />
<span style="font-weight: bold;">Tener una cuenta de correo gmail(que sera donde recibirás los mensajes).</span><br />
<br />
Lo primero sera descargar la <a href="http://code.google.com/p/recaptcha/downloads/list" target="_blank"> librería</a> de<span style="font-weight: bold;"> recaptcha</span> para asp.net (el ejemplo ya incluirá la librería).<br />
<br />
El diseño de nuestro formulario de contacto sera el siguiente(lo pueden personalizar como quieran)<br />
<br />
<center>
<img alt="Diseño" src="https://public.blu.livefilestore.com/y1p0UAWyXaXAE7y-4G8wU3l0Jxi3iKnJ3H6IVSB_oOXwiP0CEtwsEUf8mYbQduGK5El8PTTt_S6vYI-5ZlGlDAXPQ/dise%C3%B1o.jpg?psid=1" /></center>
<br />
<br />
Como pueden observar el formulario tiene <span style="font-weight: bold;">4 textbox</span> que ademas  están validados con los <span style="font-weight: bold;">controles </span>de <span style="font-weight: bold;">validación</span> para que el usuario rellene todos los datos e ingrese un correo valido, también tiene el control  <span style="font-weight: bold;">recaptcha</span>, tenemos un <span style="font-weight: bold;">botón</span> y abajo del botón tenemos un <span style="font-weight: bold;">label</span> que nos servirá para mostrar un mensaje al usuario para que sepa si se envió o no el mensaje.<br />
<br />
Ahora en nuestro <span style="font-weight: bold;">web.config</span> tendremos que agregar lo siguiente.<br />
<pre class="brush: xml"><appsettings>
<add key="To" value="TUCORREO@gmail.com">
</add></appsettings>
<system .net="">
<mailsettings>
 <smtp>
   <network enablessl="true" host="smtp.gmail.com" password="TUPASSWORD" port="587" username="TUCORREO@gmail.com">
 </network></smtp></mailsettings></system></pre>
<br />
Lo que hacemos es agregar los datos de nuestro<span style="font-weight: bold;"> servidor</span> de<span style="font-weight: bold;"> correo</span> en este caso utilizamos <span style="font-weight: bold;">smtp </span>de <span style="font-weight: bold;">gmail</span>, lo que esta en mayúscula lo tienen que remplazar por sus credencias(correo y password) de <span style="font-weight: bold;">gmail</span> lo medas no lo toquen.<br />
<br />
Ahora nos vamos al <span style="font-weight: bold;">código</span> de nuestro formulario y empezamos a programar, creemos los siguientes <span style="font-weight: bold;">métodos</span>.<br />
<pre class="brush: csharp">private void Limpiar()
   {
       txttitulo.Text = "";
       txtnombre.Text = "";
       txtcorreo.Text = "";
       txtmensaje.Text = "";
       lblaviso.Text = "";
   }

   private void Enviar(string titulo, string nombre, string correo, string mensaje)
   {

       if (Page.IsValid)
       {
           string to = ConfigurationManager.AppSettings["To"];
           MailMessage mail = new MailMessage();
           mail.To.Add(new MailAddress(to));
           mail.From = new MailAddress(correo, nombre);
           mail.Subject = titulo + " " + correo;
           mail.Body = mensaje + "\n\n" + nombre + "\n" + correo;

           SmtpClient smtp = new SmtpClient();
           smtp.Send(mail);

           Limpiar();
           lblaviso.Text = "Mensaje Enviado gracias por tomarse el tiempo de escribir...!";
       }
       else
       {          
           lblaviso.Text = "No has escrito correctamente el codigo de verificacion";

       }
   }</pre>
<br />
<pre class="brush: vbnet">    Private Sub Limpiar()
   txttitulo.Text = ""
   txtnombre.Text = ""
   txtcorreo.Text = ""
   lblaviso.Text = ""
End Sub
Private Sub Enviar(ByVal titulo As String, ByVal nombre As String, ByVal correo As String, ByVal mensaje As String)
   If (Page.IsValid) Then
       Dim t As String = ConfigurationManager.AppSettings("To")
       Dim mail As New MailMessage()
       mail.To.Add(New MailAddress(t))
       mail.From = New MailAddress(correo, nombre)
       mail.Subject = titulo + " " + correo
       mail.Body = mensaje + vbLf &amp; vbLf + nombre + vbLf + correo

       Dim smtp As New SmtpClient()
       smtp.Send(mail)

       Limpiar()
       lblaviso.Text = "Mensaje Enviado gracias por tomarse el tiempo de escribir...!"
   Else
       lblaviso.Text = "No has escrito correctamente el codigo de verificacion"
   End If
End Sub</pre>
<br />
El primer método<span style="font-weight: bold;"> Limpiar</span> lo único que ara es limpiar los <span style="font-weight: bold;">textbox</span>.<br />
El método <span style="font-weight: bold;">Enviar</span> es el que nos servirá para enviar el mensaje podemos ver que recibe <span style="font-weight: bold;">4 parámetros</span> que son los que necesitamos para que se envié el mensaje, luego comprobamos que la pagina se <span style="font-weight: bold;">valide</span> correctamente y dentro leemos los datos del <span style="font-weight: bold;">web.config</span> y armamos el correo haciendo uso de la clase<span style="font-weight: bold;"> MailMessage</span> y luego enviamos el correo usando la clase <span style="font-weight: bold;">SmtpClient</span> y mostramos los mensajes que el mensaje se envió correctamente, y si la pagina no se valida correctamente mostramos mensajes que no se pudo enviar el correo mensaje.<br />
<br />
Por ultimo dentro del <span style="font-weight: bold;">evento</span> click del <span style="font-weight: bold;">botón</span> hacemos lo siguiente.<br />
<pre class="brush: csharp">Enviar(txttitulo.Text,txtnombre.Text,txtcorreo.Text,txtmensaje.Text);</pre>
<br />
<pre class="brush: vbnet">Enviar(txttitulo.Text, txtnombre.Text, txtcorreo.Text, txtmensaje.Text)</pre>
<br />
Lo único que hacemos es llamar al método <span style="font-weight: bold;">Enviar</span> y le pasamos los datos correspondientes.<br />
<br />
<center>
<img alt="Captura" src="https://public.blu.livefilestore.com/y1pKwuW1a9MICnTg-rQeuaeYoMGz00G_USVIqXWlAuZTxsDtGCP26_yIbHA-OzkJVBaDoLJJoWWt2lpwTlN8u58Dg/captura1.jpg?psid=1" width="550" /><br /><br /><img alt="Captura" src="https://public.blu.livefilestore.com/y1pdCLM-GGFZTB9S2qR7BVVEQgVld17ZBWR4HjaZJr4cMFulgGTkAYNnEGlLWf04Ah9FX-4gd67aCzE2w5Nqpxs4A/captura2.jpg?psid=1" width="550" /></center>
<br />
<br />
<span style="font-weight: bold;">Eso seria todo por ahora espero les sirva a alguien saludos desde El Salvador.</span><br />
<center>


