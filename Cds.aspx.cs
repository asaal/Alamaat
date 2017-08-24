using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cds : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AddtoCart(object sender, CommandEventArgs e)
    {
        Guid id = new Guid((e.CommandArgument).ToString());
        ShoppingCart.Instance.AddItem(id);
        Response.Redirect("cart.aspx");
    }
}