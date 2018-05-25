using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Quartz;
using Quartz.Impl;
using System.Xml;
using System.Xml.Linq;
using System.Configuration;
using System.Threading;
using System.Web.Http;
using App.App_Start;

namespace App
{
    public class RegisterApp
    {
        /// <summary>
        /// 注册Log4net
        /// </summary>
        internal static void log4netStart()
        {
            log4net.Config.XmlConfigurator.Configure();
        }

        /// <summary>
        /// 注册过滤器
        /// </summary>
        /// <param name="filters"></param>
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new WebHandleFilterAttribute());
            //filters.Add(new WebHandleErrorAttribute());
        }

        /// <summary>
        /// 注册路由
        /// </summary>
        /// <param name="routes"></param>
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.IgnoreRoute("{extnet-root}/{extnet-file}/ext.axd");
            routes.MapRoute(
                "Default", // 路由名称
                "{controller}/{action}/{id}", // 带有参数的 URL
                 new { controller = "Login", action = "Index", id = UrlParameter.Optional }, // 参数默认值
                 namespaces: new string[] { "App.Controllers" }
            );
        }

        /// <summary>
        /// 注册WebAPI
        /// </summary>
        /// <param name="filters"></param>
        public static void RegisterWebApi(HttpConfiguration config)
        {
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }

        /// <summary>
        /// 注册调度器
        /// </summary>
        public static void RegisterQuartz()
        {
            //配置文件创建
            var factory = new StdSchedulerFactory(new System.Collections.Specialized.NameValueCollection()
                {
                    {"quartz.plugin.xml.fileNames","~/Config/quartz_jobs.xml" },
                    {"quartz.plugin.xml.type","Quartz.Plugin.Xml.XMLSchedulingDataProcessorPlugin,Quartz"}
                });
            IScheduler scheduler = factory.GetScheduler();
            scheduler.Start();

            //代码创建
            //1.首先创建一个作业调度池
            //ISchedulerFactory schedf = new StdSchedulerFactory();
            //IScheduler sched = schedf.GetScheduler();
            //2.创建出来一个具体的作业
            //IJobDetail job = JobBuilder.Create<QuartzWorkRecord>().Build();
            //3.创建并配置一个触发器
            //ISimpleTrigger trigger = (ISimpleTrigger)TriggerBuilder.Create().WithSimpleSchedule(x => x.WithIntervalInMinutes(5).WithRepeatCount(int.MaxValue)).Build();
            //4.加入作业调度池中
            //sched.ScheduleJob(job, trigger);
            //5.开始运行
            //sched.Start();
        }

        /// <summary>
        /// 注册串口
        /// </summary>
        internal static void RegisterPort()
        {
            //try
            //{
            //    new PLC_ComBLL().RunPLCStart();
            //}
            //catch(Exception e)
            //{
            //    LogHelper.Error("RegisterPort", e);
            //}
        }
    }
}