using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SendEmail(object sender, EventArgs e)
    {
        if (SendEmail("qau.asad@gmail.com", tbemail.Text, tbsubject.Text, tbmsg.Text))
        {
            lblout.Text = "Message Sent.";
            tbname.Text = string.Empty;
            tbemail.Text = string.Empty;
            tbsubject.Text = string.Empty;
            tbmsg.Text = string.Empty;
            chkcopy.Checked = false;
        }
        else
            lblout.Text = "Failed to send message.";
    }
    private bool SendEmail(string to,string from, string subject, string emailcontent)
    {
        try
        {
            MailMessage message = new MailMessage();
            
            message.Subject = subject+" ("+tbname.Text+")";
            message.Body = emailcontent;
            message.To.Add(to);
            if(chkcopy.Checked == true)
                message.Bcc.Add(from);
            message.From = new MailAddress("admin@alamaat.biz","Web Administrator");
            message.IsBodyHtml = true;
            var smtp = new System.Net.Mail.SmtpClient();
            {
                //smtp.Host = "relay-hosting.secureserver.net";
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new System.Net.NetworkCredential("qau.asad", "nazarh504");
                smtp.Timeout = 20000;
            }
            // Passing values to smtp object
            smtp.Send(message);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
}