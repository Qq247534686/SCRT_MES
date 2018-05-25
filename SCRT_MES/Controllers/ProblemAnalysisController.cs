using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace App.Controllers
{
    public class ProblemAnalysisController : Controller
    {
        //
        // GET: /ProblemAnalysis/
        private ProblemAnalysis_BLL bll { get; set; }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetProblemAnalysis(int count)
        {
            var data = bll.GetProblemAnalysis(count);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}