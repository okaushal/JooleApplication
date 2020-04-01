using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using JOOLE.Models;
using JOOLE.DAL;
using JOOLE.Repository;
using JOOLE.ModelsDTO;
using AutoMapper;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System.Globalization;
using System.Security;
using System.Security.Claims;
using System.IO;

namespace JOOLE.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        

        private ICustomerRepo _repository;
        public LoginController() 
        {
            this._repository = new CustomerRepo(new JOOLEEntity());
        }
        public LoginController(ICustomerRepo repo)
        {
            _repository = repo;
        }
        public ActionResult Welcome()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LOGIN(CUSTOMER customer)
        {
            if (ModelState.IsValid)
            {
                if (_repository.checkUserExists(customer.USERNAME, customer.PASSWORD))
                {
                    return RedirectToAction("ProductSummary", "Product", customer);
                }
                else
                {
                    ViewBag.warning = "User Not Exist!";
                    return View("Login");
                }
            }
            
            return HttpNotFound();

        }

        public ActionResult SignUp()
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult SignUp(CustomerDTO customer)
        {
            if (ModelState.IsValid)
            {
                if (_repository.checkUserExists(customer.USERNAME))
                {
                    ViewBag.message = "User Already Exists!";
                    return View();
                }

                using (var unitofwork = new UnitofWork(new JOOLEEntity()))
                {

                    //Will Save Image to DB and Images Folder
                    string fileName = Path.GetFileNameWithoutExtension(customer.ImageFile.FileName);
                    string extension = Path.GetExtension(customer.ImageFile.FileName);
                    fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                    customer.PICTURE = "~/Images/" + fileName;
                    fileName = Path.Combine(Server.MapPath("~/Images/"), fileName);
                    customer.ImageFile.SaveAs(fileName);

                    //Will Map CustomerDTO to Customer
                    var config = new MapperConfiguration(cfg => { cfg.CreateMap<CustomerDTO, CUSTOMER>(); });

                    IMapper iMapper = config.CreateMapper();
                    var source = new CustomerDTO();
                    var destination = iMapper.Map<CustomerDTO, CUSTOMER>(customer);

                    CUSTOMER c = destination;

                    unitofwork.Customers.Add(c);
                    //en.CUSTOMERs.Add(destination);
                    //en.SaveChanges();
                    unitofwork.Complete();
                }

                return RedirectToAction("ProductSummary", "Product", customer);


            }
            return HttpNotFound();
        }

        public ActionResult Display(string uname)
        {
            CUSTOMER c = new CUSTOMER();

            using (var unitofwork = new UnitofWork(new JOOLEEntity()))
            {
                c = unitofwork.Customers.Find(x => x.USERNAME == uname).FirstOrDefault();
                //c = db.CUSTOMERs.Where(x => x.USERNAME == uname).FirstOrDefault();
            }

            return View(c);
        }
    }
}