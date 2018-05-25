using BLL;
using Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace App.Controllers
{
    public class PullTransportationController : Controller
    {
        //
        // GET: /PullTransportation/

        private static Fromtorecord operation { get; set; }
        private PullTransportation_BLL bll { get; set; }

        public ActionResult Index()
        {
            operation = null;
            return View();
        }

        public void SearchWhere(Fromtorecord theOperation)
        {
            operation = theOperation;
        }

        public ActionResult GetTableData(StoreParams storeParams)
        {
            int count = 0;
            storeParams.obj = operation;
            var data = bll.GetTableData(storeParams, ref count);
            // return Json(new { data = data, total = count }, JsonRequestBehavior.AllowGet);
            return Content(JsonConvert.SerializeObject(new { data = data, total = count }, Formatting.Indented,
              new IsoDateTimeConverter() { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" }), "application/json");
        }

        public ActionResult DeleteRecord()
        {
            MessageShow msg = bll.DeleteRecord();
            return Json(new { success = msg.success, message = msg.message }, JsonRequestBehavior.AllowGet);
        }
    }
}