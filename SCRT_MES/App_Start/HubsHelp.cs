using BLL;
using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace App.App_Start
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：App
     *文件名：  HubsHelp
     *版本号：  V1.0.0.0
     *唯一标识：d5f1ba1a-2a0b-42b9-8626-999b59eece21
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/15 星期三 上午 1:50:33

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/15 星期三 上午 1:50:33
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class HubsHelp : Hub
    {
        private PageData_BLL bll = new PageData_BLL();
        private DataView_BLL dvBll = new DataView_BLL();
        private NewChartView_BLL ncvBll = new NewChartView_BLL();
        private string appZP = ConfigurationManager.AppSettings["FkanbanStock"].ToString(); /*装配*/

        public void GetPullData()
        {
            var dataPull = bll.GetPullData();
            Clients.All.setPullDataTable(new { data = dataPull, total = dataPull.Count });
        }

        public void GetBinStockData()
        {
            var dataStock = bll.GetBinStockData();
            Clients.All.setStockDataTable(new { data = dataStock, total = dataStock.Count });
        }

        public void GetMaterialChartData()
        {
            var dataStock = dvBll.GetMaterialChartData(ConfigurationManager.AppSettings["MkanbanStock"].ToString());
            Clients.All.setPullDailyDataForMaterial(new { data = dataStock });
        }

        public void GetMaterialChartDataWeekly()
        {
            var dataStock = dvBll.GetMaterialChartDataWeekly(ConfigurationManager.AppSettings["MkanbanStock"].ToString());
            Clients.All.setMaterialChartDataWeekly(new { data = dataStock });
        }

        public void GetGeneralAssemblyMatnr()
        {
            var dataStock = dvBll.GetGeneralAssemblyMatnr(appZP);
            Clients.All.setGeneralAssemblyMatnr(new { data = dataStock });
        }

        public void GetGeneralAssemblyMatnrWeek()
        {
            var dataStock = dvBll.GetGeneralAssemblyMatnrWeek(appZP);
            Clients.All.setGeneralAssemblyMatnrWeek(new { data = dataStock });
        }

        public void GetBinStock()
        {
            var data = ncvBll.GetBinStock();
            Clients.All.setBinStock(data);
        }

        public void GetBinStockTransport()
        {
            var data = ncvBll.GetBinStockTransport();
            Clients.All.setBinStockTransport(data);
        }
    }
}