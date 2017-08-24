using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class admin_Orders : System.Web.UI.Page
{
    Orders ordercontent;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SaveOrders(object sender, EventArgs e)
    {
    }
    protected void EditClick(object sender, CommandEventArgs e)
    {
       // string result = ((DropDownList)OrdersGrid.Rows[OrdersGrid.EditIndex].FindControl("DropDownList1")).SelectedValue.ToString();

       // RadComboBox comboObjectName = (RadComboBox)editItem["ComboStatus"].Controls[0];

        // string Object = comboObjectName.SelectedValue;

       // RadComboBox comboCounterName = (RadComboBox)editItem["lblName"].Controls[0];

        //var ord = OrdersGrid.SelectedItems as Orders;
        //ordercontent = new Orders();
        //string id = e.CommandArgument.ToString();
        //alamaat_Order order = ordercontent.GetOrderbyid(id);
        //if (order != null)
        //{
        //    if (e.CommandName == "email")
        //    {
        //        string status = "";
        //        order.orderstatus = "";
        //        ordercontent.UpdateOrderStatus(order);
        //    }
        //    else
        //    {
        //        order.orderstatus = "d";
        //        ordercontent.UpdateOrderStatus(order);
        //    }
        //}
    }
    protected void UpdateOrder(object sender, GridCommandEventArgs e)
    {

        GridEditableItem editItem = (GridEditableItem)e.Item;

        //RadComboBox comboObjectName = (RadComboBox)editItem["Status"].Controls[0];

       // GridEditManager editMan = editItem.EditManager;

       // GridDropDownListColumnEditor editor = editMan.GetColumnEditor("Status") as GridDropDownListColumnEditor;

        RadComboBox combo = (RadComboBox)editItem.FindControl("ComboStatus");
        if (null != combo)
        {
            CheckBox chkemail = (CheckBox)editItem.FindControl("chkEmail");
            if (null != chkemail)
            {
                var item = combo.SelectedValue;
                ordercontent = new Orders();
               // string id = editItem.KeyValues.Replace('id:\','').Replace("{","").Replace("}","").ToString();
                string id = (e.Item as GridEditFormItem).GetDataKeyValue("id").ToString();
                alamaat_Order order = ordercontent.GetOrderbyid(id);
                if (order != null)
                {
                    if (chkemail.Checked == true)
                    {
                        string status = "";
                        order.orderstatus = combo.SelectedValue.ToString();
                        ordercontent.UpdateOrderStatus(order);
                    }
                    else
                    {
                        order.orderstatus = combo.SelectedValue.ToString();
                        ordercontent.UpdateOrderStatus(order);
                    }
                }
            }
        }

       // string Object = comboObjectName.SelectedValue;

        //RadComboBox comboCounterName = (RadComboBox)editItem["lblName"].ontrols[0];

        //string Counter = comboCounterName.SelectedValue;

    }
    protected void UpdateRow(object sener, CommandEventArgs e)
    {
    }
    protected void RadGrid1_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
    {

    }
}