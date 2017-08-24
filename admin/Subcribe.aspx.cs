using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;


public partial class Account_Subcribe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ImageUpload.UploadedComplete += new EventHandler<AjaxControlToolkit.AsyncFileUploadEventArgs>(FileUploadedCompleted);
    }
    protected void FileUploadedCompleted(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        try
        {
            Byte[] imgByte = null;
            if (ImageUpload.HasFile && ImageUpload.PostedFile != null)
            {
                HttpPostedFile File = ImageUpload.PostedFile;

                imgByte = new Byte[File.ContentLength];

                string uploadedFileName = Path.GetFileName(ImageUpload.FileName);
                ImageUpload.SaveAs(Server.MapPath("~/temp/") + uploadedFileName);
                if (Image1.ImageUrl == "") 
                    Image1.ImageUrl = "~/temp/" + uploadedFileName;
                else if (Image2.ImageUrl == "") 
                    Image2.ImageUrl = "~/temp/" + uploadedFileName;
                if (Image3.ImageUrl == "") 
                    Image3.ImageUrl = "~/temp/" + uploadedFileName;
                else
                    Image4.ImageUrl = "~/temp/" + uploadedFileName;

                //Image1.ImageUrl = byteArrayToImage(imgByte);

            }
        }
        catch { }
    }
    protected void SendEmail(object sender, EventArgs e)
    {
        try
        {
            MailMessage message = new MailMessage();
            message.Subject = tbsubject.Text;
            message.Body = tbmsg.Text;
            message.To.Add("qau.asad@gmail.com");

            if (Image1.ImageUrl != string.Empty && Image1.ImageUrl != null)
            {
                Attachment attachFile = new Attachment(Image1.ImageUrl);
                message.Attachments.Add(attachFile);
            }
            var smtp = new System.Net.Mail.SmtpClient();
            {
                //smtp.Host = "relay-hosting.secureserver.net";
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new System.Net.NetworkCredential("qau.asad", "nazarh504");
                smtp.Timeout = 20000;
            }
            // Passing values to smtp object
            smtp.Send(message);
        }
        catch (Exception Ex)
        {
        }

    }
    protected void UploadImage(object sender, EventArgs e)
    {
        try
        {
            Byte[] imgByte = null;
            if (ImageUpload.HasFile && ImageUpload.PostedFile != null)
            {
                HttpPostedFile File = ImageUpload.PostedFile;

                imgByte = new Byte[File.ContentLength];

                string uploadedFileName = Path.GetFileName(ImageUpload.FileName);
                ImageUpload.SaveAs(Server.MapPath("~/temp/") + uploadedFileName);
                if (Image1.ImageUrl == "")
                    Image1.ImageUrl = "~/temp/" + uploadedFileName;
                else if (Image2.ImageUrl == "")
                    Image2.ImageUrl = "~/temp/" + uploadedFileName;
                else if (Image3.ImageUrl == "")
                    Image3.ImageUrl = "~/temp/" + uploadedFileName;
                else
                    Image4.ImageUrl = "~/temp/" + uploadedFileName;

              //  ImageClass item = new ImageClass();
               // item.Name = uploadedFileName;
                
                
                //Image1.ImageUrl = byteArrayToImage(imgByte);

            }
        }
        catch (Exception ex) { }
    }
    protected void RemoveImage1(object sender, EventArgs e)
    {
        Image1.ImageUrl = "";
        //ImageClass.Filepath.Remove();
    }
        public Image byteArrayToImage(byte[] imgBytes)
        {
            using (MemoryStream imgStream = new MemoryStream(imgBytes))
            {
                return Image.FromStream(imgStream);
            }
        }
    
}
public static class ImageClass
{
    private static string file;
    public static string Filepath
    {
        get { return file; }
        set { file = value; }
    }
    private static Stream filecontent;
    public static Stream Content
    {
        get { return filecontent; }
        set { filecontent = value; }
    }
    private static string name;
    public static string Name
    {
        get { return name; }
        set { name = value; }
    }
    private static List<string> list;
    public static List<string> ImageList
    {
        get { return list; }
        set { list = value; }
    }
}
