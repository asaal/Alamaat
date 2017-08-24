using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for alamaatProducts
/// </summary>
public class books
{
    private alamaatDBDataContext objMyLq = new alamaatDBDataContext();

    public alamaat_product Getbyname(string name)
    {
        alamaat_product item = objMyLq.alamaat_products.Where(ku => ku.productname.Equals(name)).FirstOrDefault();

        return item;
    }
    public alamaat_product GetproductById(Guid id)
    {
        alamaat_product item = objMyLq.alamaat_products.Where(ku => ku.id.Equals(id)).FirstOrDefault();
        if (item != null)
        {
            return item;
        }
        else
            return null;
    }
    public List<alamaat_product> GetAllProduct()
    {
        List<alamaat_product> items = objMyLq.alamaat_products.ToList();
        return items;
    }




    public bool InsertItem(bookinterface item)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {

                alamaat_product newitem = new alamaat_product();
                newitem.id = Guid.NewGuid();
                newitem.productname = item.Name;
                newitem.category = item.Category;
                newitem.originalprice = item.OriginalPrice;
                newitem.details = item.Details;
                newitem.rating = item.Rating;
                newitem.created = DateTime.Now;
                newitem.lastmodified = DateTime.Now;
                newitem.fileid = item.Imageid;
                newitem.discount = item.Discount;
                newitem.price = item.Price;
                objMyLq.alamaat_products.InsertOnSubmit(newitem);
                objMyLq.SubmitChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
    public bool UpdateItem(bookinterface item)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                var objcontent = objMyLq.alamaat_products.Where(p => p.id == item.ID).FirstOrDefault();
                if (null != objcontent)
                {
                    objcontent.productname = item.Name;
                    objcontent.category = item.Category;
                    objcontent.originalprice = item.OriginalPrice;
                    objcontent.discount = item.Discount;
                    objcontent.price = item.Price;
                    objcontent.details = item.Details;
                    objcontent.rating = item.Rating;
                    objcontent.lastmodified = DateTime.Now;
                    objcontent.fileid = item.Imageid;

                    objMyLq.SubmitChanges();
                    return true;
                }
                return false;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }

    public bool DeleteItem(Guid id)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                var objcontent = objMyLq.alamaat_products.SingleOrDefault(p => p.id == id);
                if (objcontent != null)
                {
                    var objfile = objMyLq.FileMasters.SingleOrDefault(p => p.id == objcontent.fileid);
                    if (objfile != null)
                    {
                        List<ProductThumb> thumbs = objMyLq.ProductThumbs.Where(t => t.fileid == objfile.id).ToList();
                        foreach (ProductThumb thumb in thumbs)
                        {
                            objMyLq.ProductThumbs.DeleteOnSubmit(thumb);
                        }
                        objMyLq.FileMasters.DeleteOnSubmit(objfile);
                    }
                    objMyLq.alamaat_products.DeleteOnSubmit(objcontent);
                    objMyLq.SubmitChanges();
                    return true;
                }

                return false;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }

    public bool DeleteThumb(Guid id)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                var objcontent = objMyLq.ProductThumbs.SingleOrDefault(p => p.id == id);
                if (objcontent != null)
                {                   
                    objMyLq.ProductThumbs.DeleteOnSubmit(objcontent);
                    objMyLq.SubmitChanges();
                    return true;
                }

                return false;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
    public ProductThumb Getimage(Guid id)
    {
        using (objMyLq = new alamaatDBDataContext())
        {
            try
            {
                var objcontent = objMyLq.ProductThumbs.SingleOrDefault(p => p.id == id);
                if (objcontent != null)
                {
                   
                    return objcontent;
                }

                return null;
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}
public class bookinterface
{
    private Guid id;
    public Guid ID
    {
        get { return id; }
        set { id = value; }
    }
    private string name;
    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    private Guid category;
    public Guid Category
    {
        get { return category; }
        set { category = value; }
    }
    private decimal price;
    public decimal Price
    {
        get { return price; }
        set { price = value; }             
    }
    private int discount;
    public int Discount
    {
        get { return discount; }
        set { discount = value; }
    }
    private decimal originalprice;
    public decimal OriginalPrice
    {
        get { return originalprice; }
        set { originalprice = value; }
    }
    private string details;
    public string Details
    {
        get { return details; }
        set { details = value; }
    }
    private int rating;
    public int Rating
    {
        get { return rating; }
        set { rating = value; }
    }
    private Guid imageid;
    public Guid Imageid
    {
        get { return imageid; }
        set { imageid = value; }
    }

}