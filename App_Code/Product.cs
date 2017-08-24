using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/**
 * The Product class
 * 
 * This is just to simulate some way of accessing data about  our products
 */
public class Product
{
    private alamaatDBDataContext _objMyLq = new alamaatDBDataContext();
	public Guid Id { get; set; }
	public decimal Price { get; set; }
	public string Description { get; set; }
    public decimal shipping { get; set; }
    public decimal Total { get; set; }
    public decimal FinalTotal { get; set; }
	public Product(Guid id)
	{
        this.Id = id;
        var item = _objMyLq.alamaat_products.Where(p => p.id == id).FirstOrDefault();
        if (null != item)
        {
            this.Id = item.id;
            this.Description = item.productname;
            this.Price = Convert.ToDecimal(item.price);
        }
        //switch (id)
        //{
        //    case 1:
        //        this.Price = 19.95m;
        //        this.Description = "Shoes";
        //        break;
        //    case 2:
        //        this.Price = 9.95m;
        //        this.Description = "Shirt";
        //        break;
        //    case 3:
        //        this.Price = 14.95m;
        //        this.Description = "Pants";
        //        break;
        //}
	}

}
