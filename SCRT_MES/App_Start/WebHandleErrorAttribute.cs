using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Utilities;

namespace App.App_Start
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：App
     *文件名：  WebHandleErrorAttribute
     *版本号：  V1.0.0.0
     *唯一标识：ac8842d7-cad8-44c9-9ab0-0339f1b2d598
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/7 星期二 下午 4:40:35

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/7 星期二 下午 4:40:35
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class WebHandleErrorAttribute : HandleErrorAttribute
    {
        public override void OnException(ExceptionContext filterContext)
        {
            //1.获取异常对象
            Exception ex = filterContext.Exception;
            //2.记录异常日志
            LogHelper.Error("请求页面报错", ex);
            //3.重定向友好页面
            filterContext.Result = new RedirectResult("~/error.html");
            //filterContext.HttpContext.Response.Write("<script>alert('请先登录');window.location.href='/Login/Index';</script>");
            //4.标记异常已经处理完毕
            filterContext.ExceptionHandled = true;
            base.OnException(filterContext);
        }
    }
}