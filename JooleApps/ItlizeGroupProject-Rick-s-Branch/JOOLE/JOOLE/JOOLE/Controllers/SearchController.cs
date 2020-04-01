using JOOLE.Repository;
using JOOLE.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using JOOLE.Models;

namespace JOOLE.Controllers
{
    
    public class SearchController : Controller
    {
        private ISubCategoryRepo _repository;

        public SearchController()
        {
            this._repository = new SubCategoryRepo(new JOOLEEntity());
        }

        public SearchController(ISubCategoryRepo repo)
        {
            this._repository = repo;
        }

        // GET: Search
        public ActionResult Search()
        {
            return View();
        }

        public JsonResult GetSubcats(string term, string categoryName)
        {
            List<string> subcategories = _repository.GetSubcatsNames(term, categoryName);

            return Json(subcategories, JsonRequestBehavior.AllowGet);
        }
    }
}