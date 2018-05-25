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
    public class TagManageController : Controller
    {
        //
        // GET: /TagManage/
        private static Rfid_tag rfid_tag { get; set; }

        private Rfid_tag_BLL bll { get; set; }

        private static Operation operation { get; set; }
        private Operation_BLL bllOperation { get; set; }

        public ActionResult Index()
        {
            rfid_tag = null;
            operation = null;
            return View();
        }

        public void SearchWhere(Rfid_tag theRfid_tag)
        {
            rfid_tag = theRfid_tag;
        }

        public ActionResult GetTableData(StoreParams storeParams)
        {
            int count = 0;
            storeParams.obj = rfid_tag;
            var data = bll.GetTableData(storeParams, ref count);
            return Content(JsonConvert.SerializeObject(new { data = data, total = count }, Formatting.Indented,
               new IsoDateTimeConverter() { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" }), "application/json");
        }

        public ActionResult DeleteMethod(string idArray)
        {
            MessageShow msg = bll.DeleteMethod(idArray);
            return Json(new { success = msg.success, message = msg.message }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult EditSaveMethod(Rfid_tag theRfid_tag)
        {
            MessageShow msg = bll.EditSaveMethod(theRfid_tag);
            return Json(new { success = msg.success, message = msg.message }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetComBoxDataRfidKey()
        {
            var data = bll.GetComBoxDataRfidKey();
            return Json(new { data = data, total = data.Count }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult EditSaveCogMethod(RfidCollections data)
        {
            data.Code = bll.getCode(data.Code);
            ServerMessage msg = new DataInteraction().DataMethod(data);
            return Json(new { success = true, message = JsonConvert.SerializeObject(msg) }, JsonRequestBehavior.AllowGet);
        }

        public void SearchWhereOperation(Operation searchOperation)
        {
            operation = searchOperation;
        }

        public ActionResult GetTableDataOperation(StoreParams storeParams)
        {
            int count = 0;
            storeParams.obj = operation;
            var data = bllOperation.GetTableData(storeParams, ref count);
            return Content(JsonConvert.SerializeObject(new { data = data, total = count }, Formatting.Indented,
               new IsoDateTimeConverter() { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" }), "application/json");
        }
    }
}