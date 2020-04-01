using System;
using JOOLE.Repository;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JOOLE.Repository
{
    public interface IUnitofWork : IDisposable
    {
        ICustomerRepo Customers { get; }
        IProductRepo Products { get; }
        int Complete();
    }
}