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
    public class InventoryBalanceController : Controller
    {
        //
        // GET: /InventoryBalance/
        private static BinMatrnRecord binMatrnRecord { get; set; }

        private InventoryBalance_BLL bll { get; set; }

        public ActionResult Index()
        {
            binMatrnRecord = null;
            return View();
        }

        public void SearchWhere(BinMatrnRecord searchParameter)
        {
            binMatrnRecord = searchParameter;
        }

        public ActionResult GetTableData(StoreParams storeParams)
        {
            int count = 0;
            storeParams.obj = binMatrnRecord;
            var data = bll.GetTableData(storeParams, ref count);
            // return Json(new { data = data, total = count }, JsonRequestBehavior.AllowGet);
            return Content(JsonConvert.SerializeObject(new { data = data, total = count }, Formatting.Indented,
              new IsoDateTimeConverter() { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" }), "application/json");
        }
    }
}