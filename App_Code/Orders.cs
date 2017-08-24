using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Orders
/// </summary>
public class Orders
{
    private alamaatDBDataContext objMyLq = new alamaatDBDataContext();

    public alamaat_Order GetOrderbyid(string id)
    {
        alamaat_Order order = objMyLq.alamaat_Orders.Where(ku => ku.id.ToString().Equals(id)).FirstOrDefault();
        return order;
    }
   

    public bool InsertOrder(OrderInterface order,List<OrderItems> Items)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {

                alamaat_Order neworder = new alamaat_Order();
                neworder.id = Guid.NewGuid();
                DateTime date = DateTime.Now;
                //neworder.order_number = "A" + date.ToShortDateString() + date.ToShortTimeString();
                neworder.order_number = order.OrderNumber;
                neworder.subtotal = order.SubTotal;
                neworder.discount = order.Discount;
                neworder.tax = order.Tax;
                neworder.total = order.Total;
                neworder.orderstatus = "Pending";
                neworder.created = DateTime.Now;
                neworder.lastmodified = DateTime.Now;
                neworder.shipment = order.Shipment;
                neworder.shippingtotal = order.Total;
                neworder.lastedit = order.Lastedit;
                neworder.shipfirstname = order.Shipfirstname;
                neworder.shiplastname = order.Shiplastname;
                neworder.shipmiddlename = order.Shipmiddlename;
                neworder.shipcompanyname = order.Shipcompany;
                neworder.shipaddress = order.ShipAddress;
                neworder.shippostalcode = order.ShipPostalcode;
                neworder.shipcity = order.ShipCity;
                neworder.shipcountry = order.ShipCountry;
                neworder.shipphone = order.ShipPhone;
                neworder.shipmobilephone = order.ShipMobilephone;
                neworder.shipfax = order.Shipfax;

                neworder.billfirstname = order.Billfirstname;
                neworder.billlastname = order.Billlastname;
                neworder.billmiddlename = order.Billmiddlename;
                neworder.billemail = order.Billemail;
                neworder.billcompanyname = order.Billcompany;
                neworder.billaddress = order.BillAddress;
                neworder.billpostalcode = order.BillPostalcode;
                neworder.billcity = order.BillCity;
                neworder.billcountry = order.BillCountry;
                neworder.billphone = order.BillPhone;
                neworder.billmobilephone = order.BillMobilephone;
                neworder.billfax = order.Billfax;

                objMyLq.alamaat_Orders.InsertOnSubmit(neworder);

                foreach (var item in Items)
                {
                    Order_product ordItem = new Order_product();
                    ordItem.id = item.ID;
                    ordItem.order_id = neworder.id;
                    ordItem.name = item.Name;
                    ordItem.status = "Pending";
                    ordItem.price = item.Price;
                    ordItem.quantity = item.Quantity;
                    ordItem.discount = item.Discount;
                    ordItem.total = item.Total;
                    ordItem.product_id = item.Productid;
                    objMyLq.Order_products.InsertOnSubmit(ordItem);
                }
                objMyLq.SubmitChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }

    public bool UpdateOrderStatus(alamaat_Order order)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                var objcontent = objMyLq.alamaat_Orders.FirstOrDefault(p => p.id == order.id);
                objcontent.orderstatus = order.orderstatus;
                objMyLq.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
    public bool UpdateUser(UserInterface user)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                var objcontent = objMyLq.alamaat_Users.Single(p => p.username == user.UserName);
                objcontent.firstname = user.FirstName;
                objcontent.lastname = user.LastName;
                objcontent.username = user.UserName;
                objcontent.email = user.Email;
                objcontent.registerDate = DateTime.Now;
                // objNewcontent.block = false;
                objcontent.address = user.Address;
                objcontent.city = user.City;
                objcontent.province = user.Province;
                objcontent.country = user.Country;
                objcontent.postalcode = user.PCode;
                objcontent.phone = user.Phone;
                objcontent.mobilephone = user.MobilePhone;
                objcontent.fax = user.Fax;
                objMyLq.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
    public bool DeleteUser(UserInterface _objcontent)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                var objcontent = objMyLq.alamaat_Users.Single(p => p.username == _objcontent.UserName);
                // objcontent.Active = false;
                // objcontent.SyncDate = DateTime.Now;
                objMyLq.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}
public class OrderInterface
{
    private Guid id;
    public Guid ID
    {
        get { return id; }
        set { id = value; }
    }
    private string ordernumber;
    public string OrderNumber
    {
        get { return ordernumber; }
        set { ordernumber = value; }
    }
    private decimal subtotal;
    public decimal SubTotal
    {
        get { return subtotal; }
        set { subtotal = value; }
    }
    private decimal discount;
    public decimal Discount
    {
        get { return discount; }
        set { discount = value; }
    }
    private decimal tax;
    public decimal Tax
    {
        get { return tax; }
        set { tax = value; }
    }
     private decimal total;
    public decimal Total
    {
        get { return total; }
        set { total = value; }
    }
    private string orderstatus;
    public string OrderStatus
    {
        get { return orderstatus; }
        set { orderstatus = value; }
    }
    private decimal shippingtotal;
    public decimal Shippingtotal
    {
        get { return shippingtotal; }
        set { shippingtotal = value; }
    }
    private string shipment;
    public string Shipment
    {
        get { return shipment; }
        set { shipment = value; }
    }
    private string lastedit;
    public string Lastedit
    {
        get { return lastedit; }
        set { lastedit = value; }
    }
    private string shipfirstname;
    public string Shipfirstname
    {
        get { return shipfirstname; }
        set { shipfirstname = value; }
    }
    private string shiplastname;
    public string Shiplastname
    {
        get { return shiplastname; }
        set { shiplastname = value; }
    }
    private string shipmiddlename;
    public string Shipmiddlename
    {
        get { return shipmiddlename; }
        set { shipmiddlename = value; }
    }
    private string shipcompany;
    public string Shipcompany
    {
        get { return shipcompany; }
        set { shipcompany = value; }
    }
    private string shipaddress;
    public string ShipAddress
    {
        get { return shipaddress; }
        set { shipaddress = value; }
    }
    private string shippcode;
    public string ShipPostalcode
    {
        get { return shippcode; }
        set { shippcode = value; }
    }
    private string shipcity;
    public string ShipCity
    {
        get { return shipcity; }
        set { shipcity = value; }
    }
    private string shipprovince;
    public string ShipProvince
    {
        get { return shipprovince; }
        set { shipprovince = value; }
    }
    private string shipcountry;
    public string ShipCountry
    {
        get { return shipcountry; }
        set { shipcountry = value; }
    }
    private string shipphone;
    public string ShipPhone
    {
        get { return shipphone; }
        set { shipphone = value; }
    }
    private string shipmobilephone;
    public string ShipMobilephone
    {
        get { return shipmobilephone; }
        set { shipmobilephone = value; }
    }
    private string shipfax;
    public string Shipfax
    {
        get { return shipfax; }
        set { shipfax = value; }
    }
    private string billfirstname;
    public string Billfirstname
    {
        get { return billfirstname; }
        set { billfirstname = value; }
    }
    private string billlastname;
    public string Billlastname
    {
        get { return billlastname; }
        set { billlastname = value; }
    }
    private string billmiddlename;
    public string Billmiddlename
    {
        get { return billmiddlename; }
        set { billmiddlename = value; }
    }
    private string billemail;
    public string Billemail
    {
        get { return billemail; }
        set { billemail = value; }
    }
    private string billcompany;
    public string Billcompany
    {
        get { return billcompany; }
        set { billcompany = value; }
    }
    private string billaddress;
    public string BillAddress
    {
        get { return billaddress; }
        set { billaddress = value; }
    }
    private string billpcode;
    public string BillPostalcode
    {
        get { return billpcode; }
        set { billpcode = value; }
    }
    private string billcity;
    public string BillCity
    {
        get { return billcity; }
        set { billcity = value; }
    }
    private string billprovince;
    public string BillProvince
    {
        get { return billprovince; }
        set { billprovince = value; }
    }
    private string billcountry;
    public string BillCountry
    {
        get { return billcountry; }
        set { billcountry = value; }
    }
    private string billphone;
    public string BillPhone
    {
        get { return billphone; }
        set { billphone = value; }
    }
    private string billmobilephone;
    public string BillMobilephone
    {
        get { return billmobilephone; }
        set { billmobilephone = value; }
    }
    private string billfax;
    public string Billfax
    {
        get { return billfax; }
        set { billfax = value; }
    }
}
public class OrderItems
{
    private Guid id;
    public Guid ID
    {
        get { return id; }
        set { id = value; }
    }
    private Guid productid;
    public Guid Productid
    {
        get { return productid; }
        set { productid = value; }
    }
    private Guid orderid;
    public Guid OrderID
    {
        get { return orderid; }
        set { orderid = value; }
    }
    private string ordernumber;
    public string Ordernumber
    {
        get { return ordernumber; }
        set { ordernumber = value; }
    }
    private string name;
    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    private string status;
    public string Status
    {
        get { return status; }
        set { status = value; }
    }
    private decimal price;
    public decimal Price
    {
        get { return price; }
        set { price = value; }
    }
    private int quantity;
    public int Quantity
    {
        get { return quantity; }
        set { quantity = value; }
    }
    private decimal discount;
    public decimal Discount
    {
        get { return discount; }
        set { discount = value; }
    }
    private decimal total;
    public decimal Total
    {
        get { return total; }
        set { total = value; }
    }
}

public class BillInterface
{
    private string billemail;
    public string Billemail
    {
        get { return billemail; }
        set { billemail = value; }
    }
    private string billfirstname;
    public string Billfirstname
    {
        get { return billfirstname; }
        set { billfirstname = value; }
    }
    private string billlastname;
    public string Billlastname
    {
        get { return billlastname; }
        set { billlastname = value; }
    }
    private string billmiddlename;
    public string Billmiddlename
    {
        get { return billmiddlename; }
        set { billmiddlename = value; }
    }
    private string billcompany;
    public string Billcompany
    {
        get { return billcompany; }
        set { billcompany = value; }
    }
    private string billaddress;
    public string BillAddress
    {
        get { return billaddress; }
        set { billaddress = value; }
    }
    private string billpcode;
    public string BillPostalcode
    {
        get { return billpcode; }
        set { billpcode = value; }
    }
    private string billcity;
    public string BillCity
    {
        get { return billcity; }
        set { billcity = value; }
    }
    private string billprovince;
    public string BillProvince
    {
        get { return billprovince; }
        set { billprovince = value; }
    }
    private string billcountry;
    public string BillCountry
    {
        get { return billcountry; }
        set { billcountry = value; }
    }
    private string billphone;
    public string BillPhone
    {
        get { return billphone; }
        set { billphone = value; }
    }
    private string billmobilephone;
    public string BillMobilephone
    {
        get { return billmobilephone; }
        set { billmobilephone = value; }
    }
    private string billfax;
    public string Billfax
    {
        get { return billfax; }
        set { billfax = value; }
    }
}
public class ShipInterface
{
    private string shipemail;
    public string Shipemail
    {
        get { return shipemail; }
        set { shipemail = value; }
    }
    private string shipfirstname;
    public string Shipfirstname
    {
        get { return shipfirstname; }
        set { shipfirstname = value; }
    }
    private string shiplastname;
    public string Shiplastname
    {
        get { return shiplastname; }
        set { shiplastname = value; }
    }
    private string shipmiddlename;
    public string Shipmiddlename
    {
        get { return shipmiddlename; }
        set { shipmiddlename = value; }
    }
    private string shipcompany;
    public string Shipcompany
    {
        get { return shipcompany; }
        set { shipcompany = value; }
    }
    private string shipaddress;
    public string ShipAddress
    {
        get { return shipaddress; }
        set { shipaddress = value; }
    }
    private string shippcode;
    public string ShipPostalcode
    {
        get { return shippcode; }
        set { shippcode = value; }
    }
    private string shipcity;
    public string ShipCity
    {
        get { return shipcity; }
        set { shipcity = value; }
    }
    private string shipprovince;
    public string ShipProvince
    {
        get { return shipprovince; }
        set { shipprovince = value; }
    }
    private string shipcountry;
    public string ShipCountry
    {
        get { return shipcountry; }
        set { shipcountry = value; }
    }
    private string shipphone;
    public string ShipPhone
    {
        get { return shipphone; }
        set { shipphone = value; }
    }
    private string shipmobilephone;
    public string ShipMobilephone
    {
        get { return shipmobilephone; }
        set { shipmobilephone = value; }
    }
    private string shipfax;
    public string Shipfax
    {
        get { return shipfax; }
        set { shipfax = value; }
    }
}