using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LoginClick(object sender, EventArgs e)
    {
        lblError.Text = string.Empty;
        UserContent ucontent = new UserContent();
        alamaat_User user =  ucontent.GetbyUsername(UserName.Text);
        if (user != null)
        {
            if (user.password == Password.Text)
            {
                Session["alamaat_User"] = user;
                Response.Redirect("~/registration.aspx");
            }
            else
            {
                lblError.Text = "Username or Password is incorrect.";
                return;
            }
        }
        else
        {
            lblError.Text = "Username or Password is incorrect.";
            return;
        }
    }
}