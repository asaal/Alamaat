using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void EditClick(object sender, CommandEventArgs e)
    { }
    protected void DeleteClick(object sender, CommandEventArgs e)
    {
       // lbloutput.Text = "";
        Guid id = new Guid((e.CommandArgument).ToString());
    }
    protected void SendClick(object sender, CommandEventArgs e)
    {
        Guid id = new Guid((e.CommandArgument).ToString());
        UserContent uContent = new UserContent();
        UserInterface user = uContent.GetuserById(id);
        if (null != user)
        {
            string emailcontent = "Hello " + user.UserName + ","
                                     + "<br/><br/><b>Username:</b>&nbsp;&nbsp;&nbsp;" + user.UserName
                                     + "<br/><br/>Thank you for registering at Alamaat. Your account is created and must be activated before you can use it."
                                     + "<br/>To activate the account click on the following link or copy-paste it in your browser:"
                                     + "<br/>www.alamaat.biz/activation.aspx?id=" + user.ID
                                     + "<br/>After activation you may login to http://www.alamaat.biz/ using the following username and the password you entered during registration:";
            SendEmail(user.Email, "Alamaat Account Details for " + user.UserName, emailcontent);
            
        }
    }
    private bool SendEmail(string to, string subject, string emailcontent)
    {
        try
        {
            MailMessage message = new MailMessage();
            message.Subject = subject;
            message.Body = emailcontent;
            message.To.Add("qau.asad@gmail.com");
            message.From = new MailAddress("qau.asad@gmail.com");
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