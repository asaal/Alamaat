using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            alamaat_User user = (alamaat_User)Session["alamaat_User"];
            if (user != null)
            {
                UserName.Text = user.username; UserName.Enabled = false;
                tbfirstname.Text = user.firstname;
                tblastname.Text = user.lastname;
                tbmiddlename.Text = user.middlename;
                Email.Text = user.email;
                tbaddress.Text = user.address;
                tbcity.Text = user.city;
                tbpCode.Text = user.postalcode;
                tbcountry.Text = user.country;
                tbprovince.Text = user.province;
                tbphone.Text = user.phone;
                tbMobilephone.Text = user.mobilephone;
                tbfax.Text = user.fax;
                btnregister.Visible = false;
                btnupdate.Visible = true;
            }
        }
    }
    protected void SaveClick(object sender, EventArgs e)
    {
        lblError.Text = ""; lbloutput.Text = "";
        UserContent uContent = new UserContent();
        UserInterface user = new UserInterface();
        alamaat_User _user = uContent.GetbyUsername(UserName.Text);
        if (null != _user)
        {
            lblError.Text = "Username is not available.";
            UserName.Focus();
            return;
        }
        alamaat_User useremail = uContent.GetuserByEmail(Email.Text);
        if (null != useremail)
        {
            lblError.Text = "A user is already registered with this email address. Please try another email address.";
            Email.Focus();
            return;
        }
        user.ID = Guid.NewGuid();
        user.FirstName = tbfirstname.Text;
        user.MiddleName = tbmiddlename.Text;
        user.LastName = tblastname.Text;
        user.UserName =  UserName.Text;
        user.Password = Password.Text;
        user.Email = Email.Text;
        user.Address = tbaddress.Text;
        user.City = tbcity.Text;
        user.Province = tbprovince.Text;
        user.Country = tbcountry.Text;
        user.PCode = tbpCode.Text;
        user.Phone = tbphone.Text;
        user.MobilePhone = tbMobilephone.Text;
        user.Fax = tbfax.Text;
        user.BirthDate = tbbirth.Text;
        if (uContent.InsertUser(user))
        {
            regpanel.Visible = false;
            lbloutput.Visible = true;
            string emailcontent = "Hello "+user.UserName+","
                                 +"<br/><br/><b>Username:</b>&nbsp;&nbsp;&nbsp;"+user.UserName
                                 +"<br/><br/>Thank you for registering at Alamaat. Your account is created and must be activated before you can use it."
                                 +"<br/>To activate the account click on the following link or copy-paste it in your browser:"
                                 +"<br/>www.alamaat.biz/activation.aspx?id="+user.ID
                                 +"<br/>After activation you may login to http://www.alamaat.biz/ using the following username and the password you entered during registration:";
            if (SendEmail(user.Email, "Alamaat Account Details for " + user.UserName, emailcontent))
            {
                lbloutput.Text = "An email has been sent to you to activate your account.";
                return;
            }
            else
            {
                lbloutput.Text = "Failed to send activation email. please contact admin at admin@alamaat.biz or (+92)-333-5113213211.";
                return;
            }
        }

    }
    private bool SendEmail(string to,string subject,string emailcontent)
    {
        try
        {
            MailMessage message = new MailMessage();
            message.Subject = subject;
            message.Body = emailcontent;
            message.To.Add(to);
            message.From = new MailAddress("qau.asad@gmail.com");
            message.IsBodyHtml = true;
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new System.Net.NetworkCredential("youremail", "XXXXXX");
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

    protected void UpdateClick(object sender, EventArgs e)
    {
        alamaat_User user = (alamaat_User)Session["alamaat_user"];
        if (user != null)
        {
            user.firstname = tbfirstname.Text;
            user.middlename = tbmiddlename.Text;
            user.lastname = tblastname.Text;
            //user.UserName = UserName.Text;
            user.password = Password.Text;
            user.email = Email.Text;
            user.address = tbaddress.Text;
            user.city = tbcity.Text;
            user.province = tbprovince.Text;
            user.country = tbcountry.Text;
            user.postalcode = tbpCode.Text;
            user.phone = tbphone.Text;
            user.mobilephone = tbMobilephone.Text;
            user.fax = tbfax.Text;
           // user. = tbbirth.Text;
            UserContent ucontent = new UserContent();
            if (ucontent.UpdateUser(user))
            {
                lbloutput.Text = "Profile updated successfully.";
            }
        }
    }
}
