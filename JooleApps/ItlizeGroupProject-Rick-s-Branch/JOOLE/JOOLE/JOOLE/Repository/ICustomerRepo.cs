using JOOLE.Models;

namespace JOOLE.Repository
{
    public interface ICustomerRepo:IGenericRepo<CUSTOMER>
    {
        bool checkUserExists(string uname);
        bool checkUserExists(string uname, string pword);
    }
}