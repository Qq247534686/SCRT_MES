using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Model;

namespace App.App_Start
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：App
     *文件名：  WebHandleFilterAttribute
     *版本号：  V1.0.0.0
     *唯一标识：88a1df45-884f-4d4b-a152-f1f4c1d3435a
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/7 星期二 下午 5:31:31

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/7 星期二 下午 5:31:31
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class WebHandleFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = filterContext.HttpContext.Session["UserInfo"] as UserInfo;
            string strController = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;
            string strAction = filterContext.ActionDescriptor.ActionName;
            List<string> ControllerArray = new List<string>() { "Login", "ProblemAnalysis", "DataView", "GeneralAssembly", "NewChartView", "kLine", "ChartMainMenu" };
            if (!ControllerArray.Contains(strController))
            {
                if (session == null)
                {
                    filterContext.HttpContext.Response.Write("<script>alert('请先登录');window.location.href='/Login/Index';</script>");
                }
                //else
                //{
                //    if (strController != "Home")
                //    {
                //        string url = string.Format(@"/{0}/{1}", strController, strAction);
                //        if (!(new UserInfo_BLL().HasAccessPermission(session, url)))
                //        {
                //            filterContext.HttpContext.Response.Write("<script>alert('你无权访问此页面');window.location.href='../error.html';</script>");
                //        }
                //    }
                //}
            }

            base.OnActionExecuting(filterContext);
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            base.OnActionExecuted(filterContext);
        }
    }
}