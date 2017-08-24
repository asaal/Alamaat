using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class activation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        string sid = Request.QueryString["sid"];
        if (id != null)
        {
            UserContent usercontent = new UserContent();
            alamaat_User currentuser = usercontent.GetuserById(id);
            if (currentuser != null)
            {
                if (currentuser.block == false)
                {
                    currentuser.active = true;
                    if (usercontent.UpdateUser(currentuser))
                    {
                        lblactivation.Text = "You have successfully activated your account.";
                    }
                }
                else
                    lblactivation.Text = "User account is already activated.";
            }
        }
        else if (sid != null)
        {
            SubscriberContent usercontent = new SubscriberContent();
            alamaat_subscriber user = usercontent.Getuserbyid(sid);
            if (user != null)
            {
                if (user.active == false)
                {
                    user.active = true;
                    if (usercontent.UpdateSubscriber(user))
                    {
                        lblactivation.Text = "You have successfully verified your email.";
                    }
                }
                else
                    lblactivation.Text = "Email is already verified.";
            }
        }
        else
            Response.Redirect("~/Default.aspx");
    }
}