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
    public class SAPRecordController : Controller
    {
        //
        // GET: /SAPRecord/

        private static SAPRecord sAPRecord { get; set; }
        private SAPRecord_BLL bll { get; set; }

        public ActionResult Index()
        {
            sAPRecord = null;
            return View();
        }

        public void SearchWhere(SAPRecord theRfid_tag)
        {
            sAPRecord = theRfid_tag;
        }

        public ActionResult GetTableData(StoreParams storeParams)
        {
            int count = 0;
            storeParams.obj = sAPRecord;
            var data = bll.GetTableData(storeParams, ref count);
            return Content(JsonConvert.SerializeObject(new { data = data, total = count }, Formatting.Indented,
               new IsoDateTimeConverter() { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" }), "application/json");
        }
    }
}