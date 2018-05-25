using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Model;

namespace App.Controllers
{
    public class UserInfoController : Controller
    {
        //
        // GET: /UserInfo/
        private UserInfo_BLL bll { get; set; }

        public static UserInfo userInfo { get; set; }

        public ActionResult Index()
        {
            userInfo = null;
            return View();
        }

        public void SearchWhere(UserInfo data)
        {
            userInfo = data;
        }

        public ActionResult GetTableData(StoreParams storeParams)
        {
            int count = 0;
            storeParams.obj = userInfo;
            var data = bll.GetTableData(storeParams, ref count);
            return Json(new { data = data, total = count }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteMethod(string idArray)
        {
            MessageShow msg = bll.DeleteMethod(idArray);
            return Json(new { success = msg.success, message = msg.message }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult EditSaveMethod(UserInfo data)
        {
            MessageShow msg = bll.EditSaveMethod(data);
            return Json(new { success = msg.success, message = msg.message }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult SaveUserInfo(UserInfo data)
        {
            bool success = bll.SaveUserInfo(data);
            return Json(new { success = success }, JsonRequestBehavior.AllowGet);
        }
    }
}