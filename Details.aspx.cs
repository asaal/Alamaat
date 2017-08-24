using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["id"];
            string page = Request.QueryString["page"];
            btnback.HRef = "../"+page+".aspx";
            if (id != null)
            {

                lblid.Value = id;
                Thumb imgthumb = new Thumb();
                alamaat_product item=imgthumb.Getproductbyid(id);
                if (null != item)
                {
                    btncart.CommandArgument = item.id.ToString();

                    lblName.Text = item.productname;
                    lblprice.Text = "<b>Price Rs. </b>"+item.price.ToString();
                    thumbimage.ImageUrl = "~/ShowImage2.ashx?id=" + item.fileid;
                    imglink.HRef = "~/ShowImage2.ashx?id=" + item.fileid;
                    lblDesc.Text = item.details;
                    List<ProductThumb> list = imgthumb.GetListbyid(item.fileid.ToString());
                    if (list.Count > 0)
                    {
                        //thumbimage.ImageUrl = "~/ShowThumb.ashx?id=" + list[0].id;
                       // imglink.HRef = "~/ShowThumb.ashx?id=" + list[0].id;
                        List<ProductThumb> newlist = new List<ProductThumb>();
                        for(int i=0; i<list.Count;i++)
                        {
                            if (i != 0)
                                newlist.Add(list[i]);
                        }
                        DataList1.DataSource = newlist;
                        DataList1.DataBind();
                    }
                }
            }
        }
    }

    protected void AddtoCart(object sender, CommandEventArgs e)
    {
        Guid id = new Guid((e.CommandArgument).ToString());
        ShoppingCart.Instance.AddItem(id);
        Response.Redirect("cart.aspx");
    }
    protected void Back(object sender, EventArgs e)
    {
        Response.Redirect("newarrival.aspx");
    }
}