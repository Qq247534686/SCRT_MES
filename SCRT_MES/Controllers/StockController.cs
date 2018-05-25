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
    public class StockController : Controller
    {
        //
        // GET: /Stock/

        private static PlantStockBin obj { get; set; }
        private static string inputPlantId { get; set; }
        private Stock_BLL bll { get; set; }

        public ActionResult Index()
        {
            inputPlantId = null;
            obj = null;
            return View();
        }

        public void SearchWherePlant(string plantId)
        {
            inputPlantId = plantId;
        }

        public void SearchWhere(PlantStockBin searchInfo)
        {
            obj = searchInfo;
        }

        public ActionResult GetTableData(StoreParams storeParams)
        {
            int count = 0;
            storeParams.obj = obj;
            var data = bll.GetTableData(storeParams, ref count);
            return Content(JsonConvert.SerializeObject(new { data = data, total = count }, Formatting.Indented,
               new IsoDateTimeConverter() { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" }), "application/json");
        }

        public ActionResult DeleteMethod(string idArray)
        {
            MessageShow msg = bll.DeleteMethod(idArray);
            return Json(new { success = msg.success, message = msg.message }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult EditSaveMethod(PlantStockBin editSaveInfo)
        {
            MessageShow msg = bll.EditSaveMethod(editSaveInfo);
            return Json(new { success = msg.success, message = msg.message }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetComBoxDataPlant()
        {
            var data = bll.GetComBoxDataPlant();
            return Json(new { data = data, total = data.Count }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetComBoxDataStock()
        {
            var data = bll.GetComBoxDataStock(inputPlantId);
            return Json(new { data = data, total = data.Count }, JsonRequestBehavior.AllowGet);
        }
    }
}