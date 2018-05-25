using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace App.Controllers
{
    public class kLineController : Controller
    {
        //
        // GET: /kLine/
        private Binmatrnrecord_BLL bll { get; set; }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetBinmatrnrecordData(string matrnCode)
        {
            var data = bll.GetBinmatrnrecordData(matrnCode);
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetComBox()
        {
            var data = bll.GetComBox();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}