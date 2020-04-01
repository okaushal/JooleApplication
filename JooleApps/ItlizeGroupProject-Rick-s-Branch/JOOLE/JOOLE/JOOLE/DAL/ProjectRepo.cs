using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JOOLE.Models;
using JOOLE.Repository;
using System.Data.Entity;
using Joole.DAL;

namespace JOOLE.DAL
{
    public class ProjectRepo :GenericRepo<PROJECT> , IProjectRepo
    {
        public ProjectRepo(JOOLEEntity context):base(context)
        {
        }
        public JOOLEEntity context { get; set; }
        
        public IEnumerable<PROJECT> getProjectsBySameCustomer(int customerID)
        {
            return context.PROJECTs.Where(p => p.CUSTOMERID == customerID).ToList();

        }



    }
}