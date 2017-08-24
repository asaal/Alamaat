using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Thumb
/// </summary>
public class Thumb
{
    private alamaatDBDataContext objMyLq = new alamaatDBDataContext();

    public List<ProductThumb> GetListbyid(string id)
    {
        //
        List<ProductThumb> list = objMyLq.ProductThumbs.Where(ku => ku.fileid.ToString().Equals(id)).ToList();
        return list;
    }
    public alamaat_product Getproductbyid(string id)
    {
        //
        alamaat_product item = objMyLq.alamaat_products.FirstOrDefault(ku => ku.id.ToString().Equals(id));
        return item;
    }
}