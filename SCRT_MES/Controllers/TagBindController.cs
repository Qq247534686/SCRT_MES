using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace App.Controllers
{
    public class TagBindController : Controller
    {
        //
        // GET: /TagBind/
        private static int tagID;

        private Rfid_bound_BLL bll { get; set; }
        private static Rfid_bound rfid_bound;

        public ActionResult Index()
        {
            tagID = 0;
            rfid_bound = null;
            return View();
        }

        public void SearchWhere(Rfid_bound data)
        {
            rfid_bound = data;
        }

        public void SearchWhereToId(Rfid_bound data)
        {
            rfid_bound = data;
            if (rfid_bound != null && rfid_bound.Tag_id > 0)
            {
                tagID = rfid_bound.Tag_id;
            }
        }

        public ActionResult GetTableDataToId(StoreParams storeParams)
        {
            int count = 0;
            storeParams.obj = rfid_bound;
            var data = new List<Rfid_bound>();
            data = bll.GetTableData(storeParams, tagID, ref count);
            return Content(JsonConvert.SerializeObject(new { data = data == null ? new List<Rfid_bound>() : data, total = count }, Formatting.Indented,
           new IsoDateTimeConverter() { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" }), "application/json");
            // return Json((new { data = data==null?new List<Rfid_bound>():data, total = count }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetTableData(StoreParams storeParams)
        {
            int count = 0;
            storeParams.obj = rfid_bound;
            var data = new List<Rfid_bound>();
            data = bll.GetTableData(storeParams, 0, ref count);
            return Content(JsonConvert.SerializeObject(new { data = data == null ? new List<Rfid_bound>() : data, total = count }, Formatting.Indented,
         new IsoDateTimeConverter() { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" }), "application/json");
            // return Json(new { data = data==null?new List<Rfid_bound>():data, total = count }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteMethod(string idArray)
        {
            MessageShow msg = bll.DeleteMethod(idArray);
            return Json(new { success = msg.success, message = msg.message }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult EditSaveMethod(Rfid_bound data)
        {
            MessageShow msg = bll.EditSaveMethod(data);
            return Json(new { success = msg.success, message = msg.message }, JsonRequestBehavior.AllowGet);
        }
    }
}