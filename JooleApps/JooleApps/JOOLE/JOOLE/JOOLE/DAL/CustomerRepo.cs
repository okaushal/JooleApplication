using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Joole.DAL;
using JOOLE.Models;
using JOOLE.Repository;

namespace JOOLE.DAL
{
    public class CustomerRepo : GenericRepo<CUSTOMER>, ICustomerRepo
    {
        public CustomerRepo(JOOLEEntity context) : base(context)
        {

        }

        public JOOLEEntity context 
        {
            get
            {
                return _context as JOOLEEntity;
            }
            private set 
            { 
            } 
        }

        public bool checkUserExists(string uname)
        {
            return context.CUSTOMERs.Any(m => m.USERNAME == uname);
        }
        public bool checkUserExists(string uname, string pword)
        {
            return context.CUSTOMERs.Any(m => m.USERNAME == uname && m.PASSWORD == pword);
        }
        
        
    }

}