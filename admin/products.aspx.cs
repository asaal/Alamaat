using Facebook;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            _subRebind();//reset page,call private subrutine
    }
    protected void subCheckCommand(object sender, RepeaterCommandEventArgs e)
    {
        //switch (e.CommandName)
        //{
        //    case "DoInsert": //if command was insert
        //        _subExecuteInsert(e);
        //        break;
        //    case "DoUpdate": //if command was update
        //        _subExecuteUpdate(e);
        //        break;
        //    case "DoDelete": //if command was Delete
        //        _subExecuteDelete(e);
        //        break;
        //}
    }

    private void _subExecuteInsert(RepeaterCommandEventArgs e)
    {

      //  TextBox txtName = (TextBox)e.Item.FindControl("tbname");
      //  TextBox txtDes = (TextBox)e.Item.FindControl("tbdetails");
      //  TextBox txtimg = (TextBox)e.Item.FindControl("tbimg");
      //  TextBox rating = (TextBox)e.Item.FindControl("tbrating");
      //  TextBox price = (TextBox)e.Item.FindControl("tbprice");
      //  //set all values within the class for paramters
      //  books bookcontent = new books();
      //  bookinterface objMp = new bookinterface();
      //  objMp.Name = txtName.Text.ToString();
      //  objMp.Details = txtDes.Text.ToString();
      //  objMp.Rating = Convert.ToInt16(rating.Text);
      //  objMp.Price = Convert.ToDecimal(price.Text);
      ////  objMp.Imageid = 1;
      //  bookcontent.InsertItem(objMp);
      //  _subRebind();
    }

    private void _subExecuteUpdate(RepeaterCommandEventArgs e)
    {
       // //get all field data
       // TextBox txtName = (TextBox)e.Item.FindControl("tbName");
       // TextBox txtDes = (TextBox)e.Item.FindControl("tbdetails");
       // TextBox txtprice = (TextBox)e.Item.FindControl("tbprice");
       // TextBox txturl = (TextBox)e.Item.FindControl("tbcaytegory");
       // HiddenField hdf = (HiddenField)e.Item.FindControl("hdf_proID");
       // //set all values within class for parameters
       // bookinterface objMp = new bookinterface();
       // //objMp.ID = Int16.Parse(hdf.Value.ToString());
       // //objMp.Name = txtName.Text.ToString();
       //// objMp.Details = txtDes.Text.ToString();
       // //objMp.Price = Convert.ToDecimal(txtprice.Text);
       // //objMp.Category = 1;

       // //objMp.updateproduct();
       // //_subRebind();

    }

    private void _subExecuteDelete(RepeaterCommandEventArgs e)
    {
    //    HiddenField hdf = (HiddenField)e.Item.FindControl("hdf_proID");
    //    books objmp = new books();
    //    objmp.DeleteItem(new Guid(hdf.Value));
    //    _subRebind();
    }

    private void _subRebind()
    {
        //books objmp = new books();
        //rpt_main.DataSource = objmp.GetAllProduct();
        //rpt_main.DataBind();
    }

    //Image Added
    protected void ImageUpload(object sender, EventArgs e)
    {
        try
        {
            lblimg.Text = "";
            //AsyncUploadStrings img = (FileUpload)imgupload;
            Byte[] imgByte = null;
            if (imgupload.HasFile && imgupload.PostedFile != null)
            {
                HttpPostedFile File = imgupload.PostedFile;
                imgByte = new Byte[File.ContentLength];
                File.InputStream.Read(imgByte, 0, File.ContentLength);

                if (Doc2SQLServer(File.FileName, imgByte, imgByte.Length, File.ContentType))
                {
                    //lbl_status.Text = "Image uploaded successfully.";

                    //imag_upload.Visible = true;
                   // lbl_status.Visible = false;
                }
                else
                {
                 //  imag_upload.Visible = false;
                   lblimg.Text = "Image uploaded Failed.";
                }
            }
            else
            {
                lblimg.Text = "Please choose Image(.jpg,.bmp,.gif)";
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected bool Doc2SQLServer(string title, byte[] Content, int Length, String imgType)
    {
        SqlConnection connection = null;
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["alamaatConnectionString"].ConnectionString;
            connection = new SqlConnection(conn);

            connection.Open();
            string sql = "Insert Into FileMaster(id,type,filename,filecontent,description,value,created,active) Values(@id,@type,@filename,@filecontent,@description,@value,@created,@active) SELECT @id";
            SqlCommand cmd = new SqlCommand(sql, connection);
            cmd.Parameters.AddWithValue("@id", Guid.NewGuid());
            cmd.Parameters.AddWithValue("@type", imgType);
            cmd.Parameters.AddWithValue("@filename", title);
            cmd.Parameters.AddWithValue("@filecontent", Content);
            cmd.Parameters.AddWithValue("@description", title);
            cmd.Parameters.AddWithValue("@value", Length);
            cmd.Parameters.AddWithValue("@created", DateTime.Now);
            cmd.Parameters.AddWithValue("@active", true);
           
            Guid id = Guid.Empty;
            id = (Guid)(cmd.ExecuteScalar());
            ImgId.Value = id.ToString();
            Img.ImageUrl = "~/ShowImage2.ashx?id=" + id;
            return true;
        }
        catch (Exception e)
        {
            return false;
        }
        finally
        {
            connection.Close();
        }

    }
    protected void Saved_Product(object sender, EventArgs e)
    {
        books bookcontent = new books();
        if (ProductId.Value != null && ProductId.Value != string.Empty)
        {
            alamaat_product item = bookcontent.GetproductById(new Guid(ProductId.Value.ToString()));
            if (null != item)
            {
                bookinterface newitem = new bookinterface();
                newitem.ID = item.id;
                newitem.Name = tbname.Text;
                newitem.Category = new Guid(ComboCategory.SelectedValue.ToString());
                newitem.OriginalPrice = Convert.ToDecimal(tbprice.Text);
                newitem.Discount = Convert.ToInt16(tbdiscount.Text);
                newitem.Price = Convert.ToDecimal(tbSaleprice.Text);
                newitem.Details = tbdetails.Text;
                newitem.Imageid = new Guid(ImgId.Value.ToString());

                if (bookcontent.UpdateItem(newitem))
                {
                    lbloutput.Text = "Item Updated Successfully.";
                    clear();
                }
            }
        }
        else
        {
            bookinterface newitem = new bookinterface();
            newitem.Name = tbname.Text;
            newitem.Category = new Guid(ComboCategory.SelectedValue.ToString());
            newitem.OriginalPrice = Convert.ToDecimal(tbprice.Text);
            newitem.Discount = Convert.ToInt16(tbdiscount.Text);
            newitem.Price = Convert.ToDecimal(tbSaleprice.Text);
            newitem.Details = tbdetails.Text;
            newitem.Imageid = new Guid(ImgId.Value.ToString());


            if (bookcontent.InsertItem(newitem))
            {
                lbloutput.Text = "Item Saved Successfully.";
                clear();
            }
        }
    }
    private void clear()
    {
        DataList1.DataSource = null;
        DataList1.DataBind();
        tbname.Text = "";
        tbprice.Text = "";
        tbdetails.Text = ""; tbSaleprice.Text = string.Empty;
        ImgId.Value = ""; tbdiscount.Text = "0";
        Img.ImageUrl = ""; ProductId.Value = string.Empty;
        RadGrid2.DataBind();
    }
     protected void Upload(object sender, EventArgs e)
    {
        try
        {
            lblimg.Text = "";
           // if (ImgId.Value == string.Empty || ImgId == null)
           // {
               // lblimg.Text = "Mian image is required.";
               // return;
           // }
            lblimg.Text = "";
            //AsyncUploadStrings img = (FileUpload)imgupload;
            Byte[] imgByte = null;
            if (ThumbUpload.HasFile && ThumbUpload.PostedFile != null)
            {
                HttpPostedFile File = ThumbUpload.PostedFile;
                imgByte = new Byte[File.ContentLength];
                File.InputStream.Read(imgByte, 0, File.ContentLength);

                if (Thumb2SQLServer(ImgId.Value,File.FileName, imgByte, imgByte.Length, File.ContentType))
                {
                    Thumb ImageThumb= new Thumb();
                    List<ProductThumb> list=ImageThumb.GetListbyid(ImgId.Value);
                    DataList1.DataSource = list;
                    DataList1.DataBind();
                    //lbl_status.Text = "Image uploaded successfully.";

                    //imag_upload.Visible = true;
                   // lbl_status.Visible = false;
                }
                else
                {
                 //  imag_upload.Visible = false
                   lblimg.Text = "Image uploaded Failed.";
                }
            }
            else
            {
                lblimg.Text = "Please choose Image(.jpg,.bmp,.gif)";
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected bool Thumb2SQLServer(string pid,string title, byte[] Content, int Length, String imgType)
    {
        SqlConnection connection = null;
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["alamaatConnectionString"].ConnectionString;
            connection = new SqlConnection(conn);

            connection.Open();
            string sql = "Insert Into ProductThumb(id,fileid,type,filename,filecontent,description,value,created,active) Values(@id,@fileid,@type,@filename,@filecontent,@description,@value,@created,@active) SELECT @id";
            SqlCommand cmd = new SqlCommand(sql, connection);
            cmd.Parameters.AddWithValue("@id", Guid.NewGuid());
            cmd.Parameters.AddWithValue("@fileid", new Guid(pid));
            cmd.Parameters.AddWithValue("@type", imgType);
            cmd.Parameters.AddWithValue("@filename", title);
            cmd.Parameters.AddWithValue("@filecontent", Content);
            cmd.Parameters.AddWithValue("@description", title);
            cmd.Parameters.AddWithValue("@value", Length);
            cmd.Parameters.AddWithValue("@created", DateTime.Now);
            cmd.Parameters.AddWithValue("@active", true);
           
            Guid id = Guid.Empty;
            id = (Guid)(cmd.ExecuteScalar());
            //ImgId.Value = id.ToString();
            //Img.ImageUrl = "~/ShowThumb.ashx?id=" + id;

            return true;
        }
        catch (Exception e)
        {
            return false;
        }
        finally
        {
            connection.Close();
        }

    }
    protected void RemoveThumbnails(object sender, CommandEventArgs e)
    {
        Guid id = new Guid((e.CommandArgument).ToString());
        books bookcontent = new books();
        if (bookcontent.DeleteThumb(id))
        {
            Thumb ImageThumb = new Thumb();
            List<ProductThumb> list = ImageThumb.GetListbyid(ImgId.Value);
            DataList1.DataSource = list;
            DataList1.DataBind();
        }
    }
    
    
    protected void Calculateprice(object sender, EventArgs e)
    {
        if (tbprice.Text != string.Empty && tbdiscount.Text != string.Empty)
        {
            int price = Convert.ToInt16(tbprice.Text);
            int discount = Convert.ToInt16(tbdiscount.Text);
            decimal value = (price * discount)/100;
            decimal result = price - value;
            tbSaleprice.Text = result.ToString();
        }
    }
    protected void EditClick(object sender, CommandEventArgs e)
    {
        lbloutput.Text = "";
        Guid id = new Guid((e.CommandArgument).ToString());
        books bookcontent = new books();
        alamaat_product item = bookcontent.GetproductById(id);
        if (null != item)
        {
            ProductId.Value = id.ToString();
            tbname.Text = item.productname;
            if (item.originalprice != null)
                tbprice.Text = item.originalprice.ToString();
            else
                tbprice.Text = item.price.ToString();
            ComboCategory.SelectedValue = item.category.ToString();
            tbdetails.Text = item.details;
            if (item.fileid != null)
            {
                ImgId.Value = item.fileid.ToString();
                Img.ImageUrl = "~/ShowImage2.ashx?id=" + item.fileid;
                Thumb ImageThumb = new Thumb();
                List<ProductThumb> list = ImageThumb.GetListbyid(ImgId.Value);
                DataList1.DataSource = list;
                DataList1.DataBind();
            }
            if (item.discount != null)
                tbdiscount.Text = item.discount.ToString();
            else
                tbdiscount.Text = "0";

            
            tbSaleprice.Text = item.price.ToString();
            tbname.Focus();

        }
    }
    protected void DeleteClick(object sender, CommandEventArgs e)
    {
        lbloutput.Text = "";
        Guid id = new Guid((e.CommandArgument).ToString());
        books bookcontent = new books();
        if(bookcontent.DeleteItem(id))
        {
            clear();
        }
    }
    protected void shareimage(object sender, CommandEventArgs e)
    {
        string access_token = "CAAHONAd8rBMBABwYnEWZCO0Qq5giElUOYxm4rQUBZB0RCsbyHdafWCkJkP5HR44drYE2PwuZC9kmVOc4LNBpfXyec9AQm5TqFKdsfrV4nzN0LL9PjY8OU4MZBKBqiWILTvzLgxr5ri3d7DyXaJrjiCSLgUaNeaGdusGQQNKydkL74yDNFwuVrww87YmRZCmaKLLHa05pgqQZDZD";
        var client = new FacebookClient(access_token);

       // var myAccounts = client.Get("/me/accounts");
        books bookcontent = new books();
        ProductThumb thumb = bookcontent.Getimage(new Guid("BC90654F-B2EE-4421-8886-C9FD854403B8"));
        dynamic parameters = new ExpandoObject();
        parameters.message = "November 2013 Edition";
        parameters.link = "http://alamaat.biz/Item.aspx";
        parameters.picture = "http://alamaat.biz/Images/books/foi2.jpg";
        parameters.name = "Fehm-O-Idrak";
        parameters.caption = "Fehm-O-Idrak";
        parameters.access_token = access_token;
        //446533181408238 is my fan page
        client.Post("/669471026419805/feed", parameters);
    }
}