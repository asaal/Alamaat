using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cart : System.Web.UI.Page
{
    Shipping cartship;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           BindData();
          // cartship = new Shipping();
           var user = (alamaat_User)Session["alamaat_User"];
            if (null != user)
            {
                loginInfor.Text = user.email + "<br/>Mr " + user.firstname + " " + user.lastname + "<br/>" + user.city + "<br/>" + user.postalcode + ", " + user.province + "<br/>" + user.country + "<br/>" + user.phone;
                tblogin.Visible = false;
                Panellogin.Visible = true;
                lblusername.Text = "Welcome " + user.username;
            }
        }
    }
    protected void BindData()
    {
        // Let's give the data to the GridView and let it work!
        // The GridView will take our cart items one by one and use the properties
        // that we declared as column names (DataFields)
        // ShoppingCart.Instance.AddItem(1);
        // ShoppingCart.Instance.AddItem(2);
        gvShoppingCart.DataSource = ShoppingCart.Instance.Items;
        gvShoppingCart.DataBind();
    }

    protected void gvShoppingCart_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        // If we are binding the footer row, let's add in our total
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[3].Text = "Total Rs: " + ShoppingCart.Instance.GetSubTotal().ToString("N2");
            
           // cartship = new Shipping();
           // decimal Total = Convert.ToDecimal(ShoppingCart.Instance.GetSubTotal());
           // Session["total"] = Total.ToString();
        }
    }
    protected void gvShoppingCart2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        // If we are binding the footer row, let's add in our total
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            decimal ptotal = ShoppingCart.Instance.GetSubTotal();
            int shipTotal = (int)Session["shipTotal"];
             decimal Total = ptotal;
            if(null != shipTotal)
                Total = ptotal + shipTotal;
            e.Row.Cells[3].Text = "<table style='text-align:left'><tr><td>Total:</td><td>Rs."+ShoppingCart.Instance.GetSubTotal().ToString() + "</td></tr>" +
                                    "<tr><td>Shipping(TCS):</td><td>Rs." + shipTotal + "</td></tr>" +
                                    "<tr><td>Total:</td><td>Rs." + Total.ToString()+"</td></tr></table>";
            Session["subtotal"] = ptotal;
           // Session["shipTotal"] = 68;
            Session["total"] = Total;
            //e.Row.Cells[3].Text = "Shipping(TCS): " + 68;
           
           
           // e.Row.Cells[3].Text = "Total: " + Total.ToString("C");
            // cartship = new Shipping();
           // decimal Total = Convert.ToDecimal(ShoppingCart.Instance.GetSubTotal());
           // Session["total"] = Total.ToString();
        }
    }
    /**
     * This is the method that responds to the Remove button's click event
     */
    protected void gvShoppingCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            Guid productId = new Guid((e.CommandArgument).ToString());
            ShoppingCart.Instance.RemoveItem(productId);
        }

        // We now have to re-setup the data so that the GridView doesn't keep
        // displaying the old data
        BindData();
    }
    protected void gvShoppingCart2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            Guid productId = new Guid((e.CommandArgument).ToString());
            ShoppingCart.Instance.RemoveItem(productId);
        }
        gvShoppingCart2.DataSource = ShoppingCart.Instance.Items;
        gvShoppingCart2.DataBind();
    }
    protected void btnUpdateCart_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvShoppingCart.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                // We'll use a try catch block in case something other than a number is typed in
                // If so, we'll just ignore it.
                try
                {
                    // Get the productId from the GridView's datakeys
                    Guid productId = new Guid((gvShoppingCart.DataKeys[row.RowIndex].Value).ToString());
                    // Find the quantity TextBox and retrieve the value
                    int quantity = int.Parse(((TextBox)row.Cells[1].FindControl("txtQuantity")).Text);
                    ShoppingCart.Instance.SetItemQuantity(productId, quantity);
                }
                catch (FormatException) { }
            }
        }

        BindData();
    }
    protected void btnUpdateCart2_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvShoppingCart2.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                // We'll use a try catch block in case something other than a number is typed in
                // If so, we'll just ignore it.
                try
                {
                    // Get the productId from the GridView's datakeys
                    Guid productId = new Guid((gvShoppingCart2.DataKeys[row.RowIndex].Value).ToString());
                    // Find the quantity TextBox and retrieve the value
                    int quantity = int.Parse(((TextBox)row.Cells[1].FindControl("txtQuantity")).Text);
                    ShoppingCart.Instance.SetItemQuantity(productId, quantity);
                }
                catch (FormatException) { }
            }
        }

        gvShoppingCart2.DataSource = ShoppingCart.Instance.Items;
        gvShoppingCart2.DataBind();
    }
    protected void ChkShippingchanged(object sender, EventArgs e)
    {
        //cartship = (Shipping)Session["Shipping"];
       // if (null != cartship)
       // {
            Session["shipTotal"] = 69;
            Session["shipType"] = "TCS";
           // decimal total = Convert.ToDecimal(Session["total"]);
           // Session["FTotal"]  = total + 69;
        //}
    }
    protected void DHLChkShipping(object sender, EventArgs e)
    {
        Session["shipTotal"] = 1364;
        Session["shipType"] = "DHL";
       // decimal total = Convert.ToDecimal(Session["total"]);
       // Session["FTotal"] = total + 1364;
    }
    protected void ConfirmPurchase(object sender, EventArgs e)
    {
        //string ftotal = Session["FTotal"].ToString();
        //lbloutput.Text = "Shopping done thanks Total " + ftotal.ToString();
       // OrderInterface order = new OrderInterface();
        var user = (alamaat_User)Session["alamaat_User"];
        BillInterface bill = (BillInterface)Session["Billing"];
        if (user == null)
        {
            //lbloutput.Text = "* User login or billing address required.";
            //e.Cancel = true;
            if (bill == null)
            {
                lbloutput.Text = "* User login or billing address required.";
                //e.Cancel = true;
                return;
            }
            //return;
        }
       
        if (bill == null)
        {
            lbloutput.Text = "* User login or billing address required.";
            //e.Cancel = true;
            return;
        }
        ShipInterface ship = (ShipInterface)Session["Shipping"];
       // if (ship == null)
       // {
          //  lbloutput.Text = "* User login or billing address required.";
            //e.Cancel = true;
           // return;
       // }
        
        decimal subtotal = (decimal)Session["subtotal"];
        int shipping = (int)Session["shipTotal"];
        decimal total = (decimal)Session["total"];
        string shipType = (string)Session["shipType"];
        Orders ordercontent = new Orders();
        OrderInterface neworder = new OrderInterface();
        neworder.SubTotal = Convert.ToDecimal(subtotal);
        neworder.Total = Convert.ToDecimal(total);
        DateTime datetime = DateTime.Now;
        neworder.OrderNumber = "A" + datetime.Year.ToString() + datetime.Month.ToString() + datetime.Day.ToString() + datetime.Hour.ToString() + datetime.Minute.ToString() + datetime.Second.ToString();
        neworder.Shipment = shipType;
        neworder.Shippingtotal = Convert.ToDecimal(shipping);
        neworder.Billcompany = bill.Billcompany;
        neworder.Billfirstname = bill.Billfirstname;
        neworder.Billlastname = bill.Billlastname;
        neworder.Billmiddlename = bill.Billmiddlename;
        neworder.Billemail = bill.Billemail;
        neworder.BillCountry = bill.BillCountry;
        neworder.BillAddress = bill.BillAddress;
        neworder.BillCity = bill.BillCity;
        neworder.BillPostalcode = bill.BillPostalcode;
        neworder.BillProvince = bill.BillProvince;
        neworder.BillPhone = bill.BillPhone;
        neworder.BillMobilephone = bill.BillMobilephone;
        neworder.Billfax = bill.Billfax;

        neworder.Shipcompany = ship.Shipcompany;
        neworder.Shipfirstname = ship.Shipfirstname;
        neworder.Shiplastname = ship.Shiplastname;
        neworder.Shipmiddlename = ship.Shiplastname;
        neworder.ShipAddress = ship.ShipAddress;
        neworder.ShipCity = ship.ShipCity;
        neworder.ShipPostalcode = ship.ShipPostalcode;
        neworder.ShipProvince = ship.ShipProvince;
        neworder.ShipCountry = ship.ShipCountry;
        neworder.ShipPhone = ship.ShipPhone;
        neworder.ShipMobilephone = ship.ShipMobilephone;
        neworder.Shipfax = ship.Shipfax;

        List<OrderItems> orderitemList = new List<OrderItems>();
        foreach(var item in ShoppingCart.Instance.Items)
        {
             OrderItems  newitem = new OrderItems();
             newitem.ID = Guid.NewGuid();
            newitem.Name = item.Description;
            newitem.Status = "Pending";
            newitem.Price = item.UnitPrice;
            newitem.Quantity = item.Quantity;
            newitem.Discount = 0;
            newitem.Total = item.TotalPrice;
            newitem.Productid = item.ProductId;
            orderitemList.Add(newitem);
        }
        if (ordercontent.InsertOrder(neworder, orderitemList))
        {
            lblorderemail.Text = "Info: Message sent to " + neworder.Billfirstname + " " + neworder.Billlastname + " " + neworder.Billemail;
            lblordershiptype.Text = neworder.Shipment;
            lblordernumber.Text = neworder.OrderNumber;
            lblorderamount.Text = neworder.Total.ToString();
            //Session["Billing"] = null;
           // Session["Shippig"] = null;
            Session["shipTotal"] = null;
            Session["shipType"] = null;
            foreach (var item in orderitemList)
            {
                ShoppingCart.Instance.RemoveItem(item.Productid);
            }
            gvShoppingCart.DataSource = null;
            gvShoppingCart.DataBind();
            gvShoppingCart2.DataSource = null;
            gvShoppingCart2.DataBind();
            clear();
           // ShoppingCart.Instance.Items = null;
            ShippingWizard.Visible = false;
            ConfOrder.Visible = true;
            string Items = string.Empty;
            foreach (var item in orderitemList)
            {
                Items += "<tr><td>" + item.Name + "</td><td>" + item.Quantity + "</td><td>" + item.Price + "</td><td>" + item.Total + "</td></tr>";
            }
            string emailcontent = "<div style='background:#e6e6e6;padding-top:10px;padding-left:10px;padding-bottom:10px'>Hello " + neworder.Billfirstname + " " + neworder.Billlastname + ",<br/><br/>"
                                + "<b>Order Number:</b>&nbsp;&nbsp;&nbsp; " + neworder.OrderNumber + "<br/>"
                                + "<b>Order Total: Rs.</b> &nbsp;&nbsp;&nbsp;" + neworder.Total + "<br/>"
                                + "<b>Order Status:</b>&nbsp;&nbsp;&nbsp; Pending<br/><br/>"
                                + "<table><tr><td style='Width:300px;text-align:center'><b>Bill To</b></td><td style='Width:300px;text-align:center'><b>Ship To</b></td></tr>"
                                + "<tr><td>" + neworder.Billemail + "<br/>" + neworder.Billfirstname + " " + neworder.Billlastname
                                +"<br/>"+neworder.BillAddress
                                + "<br/>" + neworder.BillCity + ", " + neworder.BillProvince + "<br/>" + neworder.BillCountry
                                + "<br/>" + neworder.BillPostalcode + "<br/>" + neworder.BillPhone + "</td>"
                                + "<td>" + neworder.Shipfirstname + " " + neworder.Shiplastname
                                + "<br/>" + neworder.ShipAddress 
                                + "<br/>" + neworder.ShipCity  + ", " + neworder.ShipProvince + "<br/>" + neworder.ShipCountry
                                + "<br/>" + neworder.ShipPostalcode
                                + "<br/>"+neworder.ShipPhone + "</td></tr></table><br/>"
                                + "<table><tr style='width:100%'><td style='width:250px'><b>Product Name<b/></td><td style='width:150px'><b>Quantity</b></td>"
                                + "<td style='width:150px'><b>Unit Price</b></td><td ><b>Total</b></td></tr>" 
                                +"<tr><td colspan='4'>&nbsp;</td></tr>"+
                                Items
                                + "<tr><td colspan='4'>&nbsp;</td></tr>" 
                                + "<tr><td style='width:250px'></td><td style='width:150px'></td><td style='width:150px'><b>Sub Total:</b> <td><td>" + neworder.SubTotal + "</td></tr>"
                                 + "<tr><td style='width:250px'></td><td style='width:150px'></td><td style='width:150px'><b>Shipping: </b><td><td>" + neworder.Shippingtotal + "</td></tr>"
                                  + "<tr><td style='width:250px'></td><td></td><td style='width:150px'><b>Total:</b> <td><td>" + neworder.Total + "</td></tr></table><br/>"
                                + "Thank you for purchasing at Alamaat." + "<br/><b>Alamaat</b></div>";

            //MailMessage mail = new MailMessage();

            //mail.From = new MailAddress("admin@alamaat.biz", "Administrator");
            //mail.To.Add(new MailAddress("qau.asad@gmail.com"));
            //mail.Bcc.Add(new MailAddress("qau.asad@gmail.com"));

            //set the content
            string subject = "Alamaat Order " + neworder.OrderNumber + "total Rs. " + neworder.Total;

           // AlternateView view = AlternateView.CreateAlternateViewFromString(emailcontent, null, "text/html");
           // mail.AlternateViews.Add(view);

            //send the message
            //SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net"); //specify the mail server address
            //SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            //smtp.Send(mail);
            SendEmail("qau.asad@gmail.com",subject,emailcontent);
            //MailMessage message = new MailMessage();
            //message.Subject = subject;
            //message.Body = emailcontent;
            //message.To.Add("qau.asad@gmail.com");
            //message.From = new MailAddress("qau.asad@gmail.com");
            //message.IsBodyHtml = true;
            //var smtp = new System.Net.Mail.SmtpClient();
            //{
            //    smtp.Host = "smtp.gmail.com";
            //    smtp.Port = 587;
            //    smtp.EnableSsl = true;
            //    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            //    smtp.Credentials = new System.Net.NetworkCredential("qau.asad@gmail.com", "nazarh504");
            //    smtp.Timeout = 20000;
            //}
            //// Passing values to smtp object
            //smtp.Send(message);

        }

    }
   

    protected void ShippingWizard_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (ShippingWizard.ActiveStepIndex == 0)
        {
            if (ShoppingCart.Instance.Items.Count == 0)
            {
                wizardError.Text = "* There is nothing is your shopping cart.";
                e.Cancel = true;
                return;
            }
            //var user = (User)Session["User"];
            //if (user == null)
            //{
            //    wizardError.Text = "* User login or billing address required.";
            //    e.Cancel = true; 
            //}
        }
        else if (ShippingWizard.ActiveStepIndex == 1)
        {
            bool shipping = false;
            if (radioTCS.Checked == true)
                shipping = true;
            else if (radioDHL.Checked == true)
                shipping = true;
            if (shipping)
            {
                gvShoppingCart2.DataSource = ShoppingCart.Instance.Items;
                gvShoppingCart2.DataBind();
                //var user = (User)Session["User"];
                //if (user != null)
                //{
                //    lblshipTo.Text = user.email + "<br/>Mr " + user.firstname + " " + user.lastname + "<br/>" + user.city + "<br/>" + user.postalcode + ", " + user.province + "<br/>" + user.country + "<br/>" + user.phone;
                //    lblBillTo.Text = user.email + "<br/>Mr " + user.firstname + " " + user.lastname + "<br/>" + user.city + "<br/>" + user.postalcode + ", " + user.province + "<br/>" + user.country + "<br/>" + user.phone;
                //}
            }
            else
            {
                lblShipError.Text = "Please select the shipping method.";
                e.Cancel = true;
                return;
            }
        }
    }
    protected void Billingaddress_Click(object sender, EventArgs e)
    {
        tblogin.Visible = false;
         RegPanel.Visible = true;
        gvShoppingCart.Visible = false;
        Panellogin.Visible = false;
        Edittable.Visible = false;

        var user = (alamaat_User)Session["alamaat_User"];
         if (null != user)
         {
             rdCancel.Visible = false;
             rdGuest.Visible = false;
             rdRegister.Visible = false;
             btnbillsave.Visible = true;
             btnbillcancel.Visible = true;
             //panelAccount.Visible = false;
             tbfirstname.Text = user.firstname;
             tblastname.Text = user.lastname;
             tbaddress1.Text = user.address;
             tbcity.Text = user.city;
             tbSEmail.Text = user.email;
             tbcountry.Text = user.country;
             tbPcode.Text = user.postalcode;
             tbphone.Text = user.phone;
             tbMobilephone.Text = user.mobilephone;
             tbfax.Text = user.fax;
         }
         else
         {
             panelAccount.Visible = false;
             PanelBill.Visible = false;
             btnbillsave.Visible = false;
             btnbillcancel.Visible = false;
         }
    }
    protected void Shippingaddress_Click(object sender, EventArgs e)
    {
        tblogin.Visible = false;
        RegPanel.Visible = false;
        gvShoppingCart.Visible = false;
        ShippingPanel.Visible = true;
        Panellogin.Visible = false;
        Edittable.Visible = false;
        panelAccount.Visible = false;
    }
    protected void RegistrationCancel(object sender, EventArgs e)
    {
        //tblogin.Visible = true;
        //gvShoppingCart.Visible = true;
        //RegPanel.Visible = false;
        //ShippingPanel.Visible = false;
        //Panellogin.Visible = true;
        //Edittable.Visible = true;
        //panelAccount.Visible = true;
        cancel();
        rdRegister.Visible = true;
        rdGuest.Visible = true;
        rdCancel.Visible = true;
        btnregister.Visible = false;
    }
    private void cancel()
    {
        var user = (alamaat_User)Session["alamaat_User"];
        if(user == null)
            tblogin.Visible = true;
        else
            Panellogin.Visible = true;
        gvShoppingCart.Visible = true;
        RegPanel.Visible = false;
        ShippingPanel.Visible = false;
        Edittable.Visible = true;
        panelAccount.Visible = true;
    }
    protected void loginClick(object sender, EventArgs e)
    {
        lbllogin.Text = "";
        UserContent Ucontent = new UserContent();
        var user = Ucontent.GetbyUsername(tbloginname.Text);
        if (user != null)
        {
            if (user.password == tbloginpassword.Text)
            {
                if (user.active == true)
                {
                    lblusername.Text = "Welcome " + user.username;
                    tblogin.Visible = false;
                    Panellogin.Visible = true;
                    
                    tbloginname.Text = "";
                    Session["alamaat_User"] = user;
                    //billing interface
                    BillInterface bill = new BillInterface();
                    bill.Billemail = user.email;
                    bill.Billfirstname = user.firstname;
                    bill.Billlastname = user.lastname;
                    bill.Billcompany = user.companyname;
                    bill.BillAddress = user.address;
                    bill.BillCity = user.city;
                    bill.BillPostalcode = user.postalcode;
                    bill.BillProvince = user.province;
                    bill.BillCountry = user.country;
                    bill.BillPhone = user.phone;
                    bill.BillMobilephone = user.mobilephone;
                    bill.Billfax = user.fax;
                    Session["Billing"] = bill;
                    //Shipping interface
                    ShipInterface ship = new ShipInterface();
                    ship.Shipemail = user.email;
                    ship.Shipfirstname = user.firstname;
                    ship.Shiplastname = user.lastname;
                    ship.ShipAddress = user.address;
                    ship.ShipCity = user.city;
                    ship.ShipPostalcode = user.postalcode;
                    ship.ShipProvince = user.province;
                    ship.ShipCountry = user.country;
                    ship.ShipPhone = user.phone;
                    ship.ShipMobilephone = user.mobilephone;
                    ship.Shipfax = user.fax;
                    Session["Shipping"] = ship;
                    loginInfor.Text = user.email + "<br/>Mr " + user.firstname + " " + user.lastname + "<br/>" + user.address + "<br/>" + user.city + ", " + user.province + "<br/>" + user.country + "<br/>" + user.postalcode + "<br/>" + user.phone;
                    //lblshipaddress.Text = user.email + "<br/>Mr " + user.firstname + " " + user.lastname + "<br/>" + user.city + "<br/>" + user.postalcode + ", " + user.province + "<br/>" + user.country + "<br/>" + user.phone;
                }
                else
                {
                    lbllogin.Text = "User account is invalid.";
                    return;
                }
            }
            else
            {
                lbllogin.Text = "Username or password is incorrect.";
                return;
            }
        }
        else
        {
            lbllogin.Text = "Username or password is incorrect.";
            return;
        }
    }
    protected void EditBillclick(object sender, EventArgs e)
    {
        //alamaat_User user = (alamaat_User)Session["User"];
        
        BillInterface order = new BillInterface();
        order.Billcompany = tbcompany.Text;
        order.Billfirstname = tbfirstname.Text;
        order.Billlastname = tblastname.Text;
        order.Billmiddlename = tbmName.Text;
        order.Billemail = tbSEmail.Text;
        order.BillAddress = tbaddress1.Text;
        order.BillCity = tbcity.Text;
        order.BillProvince = tbprovince.Text;
        order.BillPostalcode = tbPcode.Text;
        order.BillCountry = tbcountry.Text;
        order.BillPhone = tbphone.Text;
        order.BillMobilephone = tbMobilephone.Text;
        order.Billfax = tbfax.Text;
        Session["Billing"] = order;
        loginInfor.Text = order.Billemail + "<br/>Mr " + order.Billfirstname + " " + order.Billlastname + "<br/>" + order.BillAddress + "<br/>" + order.BillCity + ", " + order.BillProvince + "<br/>" + order.BillCountry + "<br/>" + order.BillPostalcode + "<br/>" + order.BillPhone;
        cancel();

    }
    protected void EditShippinClick(object sender, EventArgs e)
    {
        ShipInterface order = new ShipInterface();
        order.Shipcompany = tbScompany.Text;
        order.Shipfirstname = tbSfirstname.Text;
        order.Shiplastname = tbSlastname.Text;
        order.Shipmiddlename = tbSmName.Text;
        order.Shipemail = tbSSEmail.Text;
        order.ShipAddress = tbSaddress1.Text;
        order.ShipCity = tbScity.Text;
        order.ShipProvince = tbSprovince.Text;
        order.ShipPostalcode = tbSPcode.Text;
        order.ShipCountry = tbScountry.Text;
        order.ShipPhone = tbSphone.Text;
        order.ShipMobilephone = tbSmpohone.Text;
        order.Shipfax = tbSfax.Text;
        Session["Shipping"] = order;
        lblshipInfo.Text = order.Shipemail + "<br/>Mr " + order.Shipfirstname + " " + order.Shiplastname + "<br/>" + order.ShipAddress + "<br/>" + order.ShipCity + ", " + order.ShipProvince + "<br/>" + order.ShipCountry + "<br/>" + order.ShipPostalcode + "<br/>" + order.ShipPhone;
        cancel();
    }
    protected void LogoutClick(object sender, EventArgs e)
    {
        Session["alamaat_User"] = null;
        Session["Billing"] = null;
        Session["Shipping"] = null;
        loginInfor.Text = "";
        lblusername.Text = "";
        tblogin.Visible = true;
        Panellogin.Visible = false;
        clear();
    }
    private void clear()
    {
        tbfirstname.Text = string.Empty;
        tblastname.Text = string.Empty;
        tbaddress1.Text = string.Empty;
        tbcity.Text = string.Empty;
        tbSEmail.Text = string.Empty;
        tbcountry.Text = string.Empty;
        tbPcode.Text = string.Empty;
        tbphone.Text = string.Empty;
        tbMobilephone.Text = string.Empty;
        tbfax.Text = string.Empty;
    }
    protected void RegisterUser(object sender, EventArgs e)
    {
        UserContent usercontent = new UserContent();
        if (UserName.Text == string.Empty)
        {
            rfvusername.Text = "*Required";
            UserName.Focus();
             if (Password.Text == string.Empty)
                rfvpassword.Text = "*Required";
            return;
        }
        if (Password.Text == string.Empty)
        {
            rfvpassword.Text = "*Required";
            Password.Focus();
            return;
        }
        alamaat_User _user = usercontent.GetbyUsername(UserName.Text);
        if (null != _user)
        {
            lblError.Text = "Username is not available.";
            UserName.Focus();
            return;
        }
        alamaat_User useremail = usercontent.GetuserByEmail(tbSEmail.Text);
        if (null != useremail)
        {
            lblError.Text = "A user is already registered with this email address. Please try another email address.";
            tbSEmail.Focus();
            return;
        }
        UserInterface newuser = new UserInterface();
        newuser.ID = Guid.NewGuid();
        newuser.FirstName = tbfirstname.Text;
        newuser.LastName = tblastname.Text;
        newuser.MiddleName = tbmName.Text;
        newuser.UserName = UserName.Text;
        newuser.Password = Password.Text;
        newuser.Email = tbSEmail.Text;
        newuser.City = tbcity.Text;
        newuser.Address = tbaddress1.Text;
        newuser.Province = tbprovince.Text;
        newuser.Country = tbcountry.Text;
        newuser.PCode = tbPcode.Text;
        newuser.Phone = tbphone.Text;
        newuser.MobilePhone = tbMobilephone.Text;
        newuser.Fax = tbfax.Text;
        if (usercontent.InsertUser(newuser))
        {
            cancel();
            rdCancel.Visible = true;
            rdRegister.Visible = true;
            rdGuest.Visible = true;
            btnregister.Visible = false;
            string Emailcontent = "Hello "+newuser.UserName+","
                                 +"<br/><br/><b>Username:</b>&nbsp;&nbsp;&nbsp;"+newuser.UserName
                                 +"<br/><br/>Thank you for registering at Alamaat. Your account is created and must be activated before you can use it."
                                 +"<br/>To activate the account click on the following link or copy-paste it in your browser:"
                                 +"<br/><br/>www.alamaat.biz/activation.aspx?id="+newuser.ID
                                 +"<br/><br/>After activation you may login to http://www.alamaat.biz/ using the following username and the password you entered during registration:";
            if (SendEmail(newuser.Email, "Alamaat Account Details for " + newuser.UserName, Emailcontent))
            {
                lbllogin.Text = "An email has been sent to you to activate your account.";
                return;
            }
            else
            {
                lbllogin.Text = "Failed to send activation email. please contact admin at admin@alamaat.biz or (+92)-333-5113213211.";
                return;
            }
        }

    }
    protected void Guestclick(object sender, EventArgs e)
    {
        BillInterface order = new BillInterface();
        order.Billcompany = tbcompany.Text;
        order.Billfirstname = tbfirstname.Text;
        order.Billlastname = tblastname.Text;
        order.Billmiddlename = tbmName.Text;
        order.Billemail = tbSEmail.Text;
        order.BillAddress = tbaddress1.Text;
        order.BillCity = tbcity.Text;
        order.BillProvince = tbprovince.Text;
        order.BillPostalcode = tbPcode.Text;
        order.BillCountry = tbcountry.Text;
        order.BillPhone = tbphone.Text;
        order.BillMobilephone = tbMobilephone.Text;
        order.Billfax = tbfax.Text;
        Session["Billing"] = order;
        loginInfor.Text = order.Billemail + "<br/>Mr " + order.Billfirstname + " " + order.Billlastname + "<br/>" + order.BillAddress + "<br/>" + order.BillCity + "<br/>" + order.BillPostalcode + ", " + order.BillProvince + "<br/>" + order.BillCountry + "<br/>" + order.BillPhone;
        cancel();
    }
    private bool SendEmail(string to,string subject,string emailcontent)
    {
        try
        {
            MailMessage message = new MailMessage();
            message.Subject = subject;
            message.Body = emailcontent;
            message.To.Add(to);
            message.Bcc.Add("abdullahmuhammad@gmail.com");
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
    protected void rdRegisterChecked(object sender, EventArgs e)
    {
        if (rdRegister.Checked == true)
        {
            regisrationPanel.Visible = true;
            btnregister.Visible = true;
            btnbillcancel.Visible = true;
            rdRegister.Visible = false;
            rdGuest.Visible =false;
            panelAccount.Visible = true;
            PanelBill.Visible = true;
            rdRegister.Checked = false;
            rdCancel.Visible = false;

        }
        else if (rdGuest.Checked == true)
        {
            regisrationPanel.Visible = false;
            btnbillsave.Visible = true;
            btnbillcancel.Visible = true;
            rdRegister.Visible = false;
            rdGuest.Visible = false;
            panelAccount.Visible = false;
            PanelBill.Visible = true;
            rdGuest.Checked = false;
            rdCancel.Visible = false;
        }
    }
}
public class Shipping
{
    public decimal Total { get; set; }
    public decimal FinalTotal { get; set; }
    public decimal shipping { get; set; }
    public string shippingType { get; set; }
}
public class ShippingAddress
{

}