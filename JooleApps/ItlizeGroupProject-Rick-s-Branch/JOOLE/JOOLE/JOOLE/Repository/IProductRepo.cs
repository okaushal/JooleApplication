using JOOLE.DAL;
using JOOLE.Models;
using System;
using System.Collections.Generic;

namespace JOOLE.Repository
{
    public interface IProductRepo:IGenericRepo<Product>
    {
        JOOLEEntity context { get; set; }

        IEnumerable<Product> getProductBySubcat(string subname);

        IEnumerable<Product> getProductFromFilter(string subName, int year1 = 1980, int year2 = 2020, string price = null);

    }
}