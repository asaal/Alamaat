using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class subscribe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SubcriberClick(object sender, EventArgs e)
    {
        lblout.Text = "";
        SubscriberContent newsub = new SubscriberContent();
        alamaat_subscriber user = newsub.Getuserbyemail(tbemail.Text);
        if (user != null)
        {
            if (user.active)
            {
                lblout.Text = "Email already exist.";
                return;
            }
        }
        SubscriberInterface newitem = new SubscriberInterface();
        newitem.ID = Guid.NewGuid();
        newitem.Email = tbemail.Text;
        newitem.Active = false;
        if (newsub.InsertSubscriber(newitem))
        {
            if (SendEmail(tbemail.Text, newitem.ID.ToString()))
                lblout.Text = "please verify your email account by clicking the activation link that has been send to your email.";
            tbemail.Text = "";
        }
    }
    private bool SendEmail(string to, string id)
    {
        try
        {
            MailMessage message = new MailMessage();
            message.Subject = "Alamaat.biz Email Verification";
            string content = "<br/>To Complete the subscription process, click on the following link or copy-paste it in your browser<br/>" +
                             "http://www.alamaat.biz/activation.aspx?sid=" + id + "<br/><br/>www.alamaat.biz";
            message.Body = content;
            message.To.Add(to);
            message.From = new MailAddress("admin@alamaat.biz", "alamaat.biz");
            message.IsBodyHtml = true;
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new System.Net.NetworkCredential("qau.asad@gmail.com", "nazarh504");
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