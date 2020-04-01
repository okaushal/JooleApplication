using JOOLE.Models;
using System.Collections.Generic;



namespace JOOLE.Repository
{
    public interface IProjectRepo:IGenericRepo<PROJECT>
    {
        JOOLEEntity context { get; set; }
        IEnumerable<PROJECT> getProjectsBySameCustomer(int customerID);
    }
}