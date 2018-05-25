using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.AspNet.SignalR;
using Spring.Web.Mvc;

namespace App
{
    // 注意: 有关启用 IIS6 或 IIS7 经典模式的说明，
    // 请访问 http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : SpringMvcApplication
    {
        //System.Web.HttpApplication
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterApp.log4netStart();
            //RegisterApp.RegisterWebApi(GlobalConfiguration.Configuration);
            RegisterApp.RegisterGlobalFilters(GlobalFilters.Filters);//注册过滤器
            RegisterApp.RegisterRoutes(RouteTable.Routes);//注册路由
            //RegisterApp.RegisterQuartz();
        }
    }
}