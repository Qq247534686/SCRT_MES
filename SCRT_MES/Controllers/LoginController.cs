using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Model;

namespace App.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/
        private UserInfo_BLL bll { get; set; }

        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="username">用户名</param>
        /// <param name="passwd">密码</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult CheckLogin(UserInfo userInfo)
        {
            bool flag = false;
            var nowUserInfo = bll.GetUserInfo(userInfo);
            if (nowUserInfo != null)
            {
                Session["UserInfo"] = nowUserInfo;
                flag = true;
            }
            return Json(new { success = true, isPass = flag });
        }
    }
}