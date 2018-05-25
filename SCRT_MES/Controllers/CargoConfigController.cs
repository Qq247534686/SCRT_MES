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
    public class CargoConfigController : Controller
    {
        //
        // GET: /CargoConfig/

        private static CargoConfig cargoConfig { get; set; }
        private CargoConfig_BLL bll { get; set; }
        public static string plantTo { get; set; }
        public static string stockTo { get; set; }
        public static string binTo { get; set; }
        public static string plantFrom { get; set; }
        public static string stockFrom { get; set; }
        public static string binFrom { get; set; }

        public ActionResult Index()
        {
            plantTo = null;
            stockTo = null;
            binTo = null;
            plantFrom = null;
            stockFrom = null;
            binFrom = null;
            cargoConfig = null;
            return View();
        }

        public void SearchWhere(CargoConfig obj)
        {
            cargoConfig = obj;
        }

        public ActionResult GetTableData(StoreParams storeParams)
        {
            int count = 0;
            storeParams.obj = cargoConfig;
            var data = bll.GetTableData(storeParams, ref count);
            return Content(JsonConvert.SerializeObject(new { data = data, total = count }, Formatting.Indented,
               new IsoDateTimeConverter() { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" }), "application/json");
        }

        public ActionResult DeleteMethod(string idArray)
        {
            MessageShow msg = bll.DeleteMethod(idArray);
            return Json(new { success = msg.success, message = msg.message }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult EditSaveMethod(CargoConfig editSaveInfo)
        {
            MessageShow msg = bll.EditSaveMethod(editSaveInfo);
            return Json(new { success = msg.success, message = msg.message }, JsonRequestBehavior.AllowGet);
        }

        public void LockPlantTo(string plantToStr)
        {
            plantTo = plantToStr;
        }

        public void LockStockTo(string stockToStr)
        {
            stockTo = stockToStr;
        }

        public void LockBinTo(string binToStr)
        {
            binTo = binToStr;
        }

        public void LockPlantFrom(string plantFromStr)
        {
            plantFrom = plantFromStr;
        }

        public void LockStockFrom(string stockFromStr)
        {
            stockFrom = stockFromStr;
        }

        public void LockBinFrom(string binFromStr)
        {
            binFrom = binFromStr;
        }

        public ActionResult GetComBoxPlantToData()
        {
            var data = bll.GetComBoxPlantToData();
            return Json(new { data = data, total = data.Count }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetComBoxStockToData()
        {
            var data = bll.GetComBoxStockToData(plantTo);
            return Json(new { data = data, total = data.Count }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetComBoxBinToData()
        {
            var data = bll.GetComBoxBinToData(stockTo);
            return Json(new { data = data, total = data.Count }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetComBoxPlantFromData()
        {
            var data = bll.GetComBoxPlantFromData();
            return Json(new { data = data, total = data.Count }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetComBoxStockFromData()
        {
            var data = bll.GetComBoxStockFromData(plantFrom);
            return Json(new { data = data, total = data.Count }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetComBoxBinFromData()
        {
            var data = bll.GetComBoxBinFromData(stockFrom);
            return Json(new { data = data, total = data.Count }, JsonRequestBehavior.AllowGet);
        }
    }
}