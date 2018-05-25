using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace App.Controllers
{
    public class NewChartViewController : Controller
    {
        //
        // GET: /NewChartView/
        private NewChartView_BLL bll { get; set; }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetBinStock()
        {
            List<NewChartView> data = bll.GetBinStock();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}