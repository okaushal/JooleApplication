using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using JOOLE.Models;
using JOOLE.DAL;
using JOOLE.Repository;
using System.Dynamic;
using AutoMapper;
using JOOLE.ModelsDTO;


namespace JOOLE.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        private IProductRepo _repository;
        public dynamic myModel;
        public static List<int> collectedIDs;

        public ProductController()
        {
            this._repository = new ProductRepo(new JOOLEEntity());
            this.myModel = new ExpandoObject();
            collectedIDs = new List<int>();
        }

        public ProductController(IProductRepo pro)
        {
            this._repository = pro;
            this.myModel = new ExpandoObject();
            collectedIDs = new List<int>();


        }
        public ActionResult ProductSummary(IEnumerable<Product> products=null, string subName=null, CUSTOMER customer=null)
        {
            if (customer != null)
            {
                myModel.cust = customer;
            }

            if (products != null)
            {
                myModel.Product = products;
                myModel.Subcat = new SubCategoryRepo(new JOOLEEntity()).GetAll().ToList();
                return View(myModel);

            }
            else if (subName != null)
            {
                myModel.Product = _repository.getProductBySubcat(subName);
                myModel.Subcat = new SubCategoryRepo(new JOOLEEntity()).GetAll().ToList();
                return View(myModel);
            }
            else
            {
                myModel.Product = _repository.GetAll();
                myModel.Subcat = new SubCategoryRepo(new JOOLEEntity()).GetAll().ToList();
                return View(myModel);
            }

        }


        public ActionResult SearchedProducts(string subName, int year1=1980, int year2=2020, string price=null)
        {
            if (subName == null)
            {
                return RedirectToAction("ProductSummary");
            }


            return RedirectToAction("ProductSummary",_repository.getProductFromFilter(subName,year1,year2,price));
        }



        public ActionResult Details(int productID, CUSTOMER customer = null)
        {
            myModel.cust = customer;

            Product pr = _repository.GetbyID(productID);

            var config = new MapperConfiguration(cfg => { cfg.CreateMap<Product, ProductDTO>(); });

            IMapper iMapper = config.CreateMapper();
            var source = new ProductDTO();
            var destination = iMapper.Map<Product, ProductDTO>(pr);
            myModel.destination = destination;

            if (destination.sub_catID == 2)
            {
                return View("Details", myModel);
            }

            else
            {
                return View("Details", myModel);
            }
        }

        public ActionResult compareSelected(int pID, bool check=false)
        {
            collectedIDs.Add(pID);
            return new EmptyResult();
        }

        public ActionResult compareView(CUSTOMER customer=null)
        {
            List<Product> plst = new List<Product>();
            myModel.cust = customer;    
            foreach(var item in collectedIDs)
            {
                plst.Add(_repository.GetbyID(item));
            }
            myModel.compare = plst;
            return View(myModel);
        }



        public ActionResult compareProduct(List<int> ids, CUSTOMER customer=null)
        {
            myModel.cust = customer;
            List<Product> products = new List<Product>();

            foreach (var id in ids)
            {
                products.Add(_repository.GetbyID(id));
            }
            myModel.pro = products;

            return View(myModel);
        }
    }


}