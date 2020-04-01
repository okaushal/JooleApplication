using Joole.DAL;
using JOOLE.Models;
using JOOLE.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JOOLE.DAL
{
    public class SubCategoryRepo : GenericRepo<Subcat>, ISubCategoryRepo
    {
        public SubCategoryRepo(JOOLEEntity context) : base(context)
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

        public IEnumerable<Subcat> GetSubcats(string text, string categoryName)
        {
            return context.Subcats.Where(i => i.sub_catname.Contains(text) && i.CategoryName == categoryName).ToList();
        }

        public List<string> GetSubcatsNames(string startText, string categoryName)
        {
            return context.Subcats.Where(i => i.sub_catname.StartsWith(startText) && i.CategoryName == categoryName).Select(y => y.sub_catname).ToList();
        }
    }
}