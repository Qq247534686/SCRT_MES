using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Quartz;
using BLL;
using System.Configuration;
using Model;

namespace App.App_Start
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：App
     *文件名：  QuartzWorkRecord
     *版本号：  V1.0.0.0
     *唯一标识：99b8320f-7352-4218-a2f2-1d9a3d1beeb8
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/15 星期三 上午 2:38:16

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/15 星期三 上午 2:38:16
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class QuartzWorkRecord : IJob
    {
        private IHubContext chat = GlobalHost.ConnectionManager.GetHubContext<HubsHelp>();
        private DataView_BLL bll = new DataView_BLL();

        #region 定时统计各个货道下的各个物料的数量

        public void Execute(IJobExecutionContext context)
        {
            bll.InsertData();
        }

        #endregion 定时统计各个货道下的各个物料的数量

        #region 通过集线器往客户端传输数据

        public void pullDailyDataForMaterial()
        {
            var appMP = string.Empty;
            var appZP = string.Empty;
            var dataPull = new List<ChartData>();
            appMP = ConfigurationManager.AppSettings["MkanbanStock"].ToString(); /*毛坯*/
            appZP = ConfigurationManager.AppSettings["FkanbanStock"].ToString(); /*装配*/
            if (!string.IsNullOrEmpty(appMP))
            {
                dataPull = bll.GetMaterialChartData(appMP);
                chat.Clients.All.setPullDailyDataForMaterial(new { data = dataPull });
                dataPull = bll.GetMaterialChartDataWeekly(appMP);
                chat.Clients.All.setMaterialChartDataWeekly(new { data = dataPull });
            }
            if (!string.IsNullOrEmpty(appZP))
            {
                dataPull = bll.GetGeneralAssemblyMatnr(appZP);//日
                chat.Clients.All.setGeneralAssemblyMatnr(new { data = dataPull });
                dataPull = bll.GetGeneralAssemblyMatnrWeek(appZP);//周
                chat.Clients.All.setGeneralAssemblyMatnrWeek(new { data = dataPull });
            }
        }

        #endregion 通过集线器往客户端传输数据
    }
}