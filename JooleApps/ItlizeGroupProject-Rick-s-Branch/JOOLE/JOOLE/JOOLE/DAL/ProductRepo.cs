using JOOLE.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JOOLE.Models;
using Joole.DAL;
using Newtonsoft.Json;

namespace JOOLE.DAL
{
    public class ProductRepo : GenericRepo<Product>, IProductRepo
    {
        public ProductRepo(JOOLEEntity context) : base(context)
        {
        }
        public JOOLEEntity context { get; set; }

        public IEnumerable<Product> getProductBySubcat(string subName)
        {
            ISubCategoryRepo scr = new SubCategoryRepo(new JOOLEEntity());
            return context.Products.Where(m => scr.GetbyID(m.sub_catID).sub_catname == subName);
        }

        public IEnumerable<Product> getProductFromFilter(string subName, int year1 = 1980, int year2 = 2020, string price = null)
        {
            ISubCategoryRepo scr = new SubCategoryRepo(new JOOLEEntity());
            return context.Products.Where(m => scr.GetbyID(m.sub_catID).sub_catname == subName && m.modelyear>year1 && m.modelyear<year2);
        }
        
        
    }

}