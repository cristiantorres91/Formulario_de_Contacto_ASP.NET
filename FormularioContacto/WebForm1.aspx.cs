using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace FormularioContacto
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void Limpiar()
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
                Response.Write("<script language='JavaScript'>alert('Mensaje Enviado Correctamente...!!!');</script>");
                lblaviso.Text = "Mensaje Enviado gracias por tomarse el tiempo de escribir...!";
            }
            else
            {                
                Response.Write("<script language='JavaScript'>alert('Error no se Pudo Enviar el Mensaje...!!!');</script>");
                lblaviso.Text = "No has escrito correctamente el codigo de verificacion";

            }
        }

        protected void btnenviar_Click(object sender, EventArgs e)
        {
            Enviar(txttitulo.Text,txtnombre.Text,txtcorreo.Text,txtmensaje.Text);
        }
    }
}