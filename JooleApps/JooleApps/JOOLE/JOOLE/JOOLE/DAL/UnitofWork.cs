using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JOOLE.Repository;
using JOOLE.Models;
using JOOLE.DAL;

namespace JOOLE.DAL
{
    public class UnitofWork : IUnitofWork
    {
        private readonly JOOLEEntity _context;

        public UnitofWork(JOOLEEntity context)
        {
            _context = context;
            Customers = new CustomerRepo(_context);
            Products = new ProductRepo(_context);
        }

        public ICustomerRepo Customers { get; private set; }
        public IProductRepo Products { get; private set; }

        public int Complete()
        {
            return _context.SaveChanges();
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}