using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL;
using Microsoft.AspNet.SignalR;
using Model;
using Newtonsoft.Json;
using App;
using System.Configuration;
using App.App_Start;

namespace App
{
    /// <summary>
    /// DataInteraction 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。
    // [System.Web.Script.Services.ScriptService]
    public class DataInteraction : System.Web.Services.WebService
    {
        private PageData_BLL pageData = new PageData_BLL();
        private DataInteraction_BLL bll = new DataInteraction_BLL();
        private IHubContext chat = GlobalHost.ConnectionManager.GetHubContext<HubsHelp>();

        [WebMethod]
        public ServerMessage DataMethod(RfidCollections data)
        {
            var message = new ServerMessage();
            var action = string.Empty;
            message = bll.DataMethod(data, ref action);
            var newRfidCollections = bll.whereRfidCollections(data.rfidKey);
            string actionName = string.Empty;
            if (string.IsNullOrEmpty(newRfidCollections.specialAction))
            {
                actionName = newRfidCollections.Action.ToUpper();
            }
            else
            {
                actionName = newRfidCollections.specialAction.ToUpper();
            }
            if ((actionName.StartsWith("IN") || actionName.StartsWith("OUT")) && newRfidCollections.stockLocTo == 6 && message.Code == 0)
            {
                actionName = actionName.StartsWith("OUT") ? "出库" : "入库";
                chat.Clients.All.setInputBinStock(new { binCode = bll.whereBinCode(newRfidCollections.stockBinTo), action = actionName, time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") });
            }
            SendPull(message.Code, data.stockFromStr);
            return message;
        }

        public void SendPull(int code, string stockName)
        {
            if (code == 0)
            {
                var dataPull = pageData.GetPullData();
                chat.Clients.All.setPullDataTable(new { data = dataPull, total = dataPull.Count });
                var dataStock = pageData.GetBinStockData();
                chat.Clients.All.setStockDataTable(new { data = dataStock, total = dataStock.Count });

                DataView_BLL bllChart = new DataView_BLL();
                var appMP = string.Empty;
                var appZP = string.Empty;
                var dataPullChart = new List<ChartData>();
                appMP = ConfigurationManager.AppSettings["MkanbanStock"].ToString(); /*毛坯*/
                appZP = ConfigurationManager.AppSettings["FkanbanStock"].ToString(); /*装配*/
                if (!string.IsNullOrEmpty(appMP))
                {
                    dataPullChart = bllChart.GetMaterialChartData(appMP);
                    chat.Clients.All.setPullDailyDataForMaterial(new { data = dataPullChart });
                    dataPullChart = bllChart.GetMaterialChartDataWeekly(appMP);
                    chat.Clients.All.setMaterialChartDataWeekly(new { data = dataPullChart });
                }
                if (!string.IsNullOrEmpty(appZP))
                {
                    dataPullChart = bllChart.GetGeneralAssemblyMatnr(appZP);//日
                    chat.Clients.All.setGeneralAssemblyMatnr(new { data = dataPullChart });
                    dataPullChart = bllChart.GetGeneralAssemblyMatnrWeek(appZP);//周
                    chat.Clients.All.setGeneralAssemblyMatnrWeek(new { data = dataPullChart });
                }
                //入库
                chat.Clients.All.setBinStock(new NewChartView_BLL().GetBinStock());
                //产生拉动
                chat.Clients.All.setBinStockTransport(new NewChartView_BLL().GetBinStockTransport());
            }
        }

        [WebMethod]
        public ServerMessage GetAction(string code)
        {
            return bll.GetAction(code);
        }

        [WebMethod]
        public ServerMessage InsertOrUpdateTag(Rfid_tag tag)
        {
            return bll.InsertOrUpdateTag(tag);
        }
    }
}