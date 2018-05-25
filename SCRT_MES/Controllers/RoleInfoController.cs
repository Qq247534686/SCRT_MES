using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Model;

namespace App.Controllers
{
    public class RoleInfoController : Controller
    {
        //
        // GET: /RoleInfo/
        private RoleInfo_BLL bll { get; set; }

        public static RoleInfo roleInfo { get; set; }

        public ActionResult Index()
        {
            roleInfo = null;
            return View();
        }

        public void SearchWhere(RoleInfo data)
        {
            roleInfo = data;
        }

        public ActionResult GetTableData(StoreParams storeParams)
        {
            int count = 0;
            storeParams.obj = roleInfo;
            var data = bll.GetTableData(storeParams, ref count);
            return Json(new { data = data, total = count }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetAllRolesData(StoreParams storeParams)
        {
            int count = 0;
            var data = bll.GetAllRolesData(storeParams, ref count);
            return Json(new { data = data, total = count }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult DeleteMethod(string idArray)
        {
            MessageShow msg = bll.DeleteMethod(idArray);
            return Json(new { success = msg.success, message = msg.message }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult EditSaveMethod(RoleInfo data)
        {
            MessageShow msg = bll.EditSaveMethod(data);
            return Json(new { success = msg.success, message = msg.message }, JsonRequestBehavior.AllowGet);
        }
    }
}