using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Model;
using App;

namespace App.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        private Home_BLL bll { get; set; }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetUserName()
        {
            MessageShow msg = new MessageShow();
            var userInfo = Session["UserInfo"] as UserInfo;
            if (userInfo != null)
            {
                msg.message = userInfo.UserName;
                msg.id = userInfo.Id;
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// 获得菜单
        /// </summary>
        /// <returns></returns>
        public JsonResult GetMenu()
        {
            List<SystemMenu> menu = new List<SystemMenu>();
            menu = bll.GetNavTreeByUserID(Session["UserInfo"] as UserInfo);
            return Json(menu, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetAllMenu()
        {
            List<SystemMenu> menu = new List<SystemMenu>();
            menu = bll.GetNavTreeByUserID();
            return Json(menu, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// 退出
        /// </summary>
        /// <returns></returns>
        public ActionResult SignOut()
        {
            MessageShow msg = new MessageShow();
            Session.Remove("UserInfo");
            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }
    }
}