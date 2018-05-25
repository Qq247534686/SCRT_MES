using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Factory;
using Model;
using Newtonsoft.Json;
using System.Configuration;
using DAL.sapService;
using Utilities;

namespace DAL
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：DAL
     *文件名：  DataInteraction_DAL
     *版本号：  V1.0.0.0
     *唯一标识：6ab60023-f4db-4b96-ba50-e3ce6354c799
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/12 星期日 下午 5:19:12

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/12 星期日 下午 5:19:12
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class DataInteraction_DAL : SqlHelps
    {
        public ServerMessage DataMethod(RfidCollections rfidKey, ref string action)
        {
            var megInfo = new ServerMessage();
            string message = string.Empty;
            var acionGroup = string.Empty;
            var dataObj = new RfidCollections();
            try
            {
                //var data = JsonConvert.DeserializeObject<RfidCollections>(jsonData);
                AbsRfidCollections<RfidCollections> abs = new RunRfidCollections_DAL(rfidKey);
                dataObj = abs.GetData();
                //action = abs.GetAction().ToLower();
                acionGroup = this.SqlQueryOne<string>(" select actionGroup from rfidinfo where rfidKey=@rfidKey", new { rfidKey = rfidKey.rfidKey });//查询方法组

                if (string.IsNullOrEmpty(acionGroup))
                {
                    message = "0,successfully";
                }
                else
                {
                    if (abs.GetAction().Equals("131"))
                    {
                        message = "0,successfully";
                    }
                    else
                    {
                        message = RunActionGroup(abs, acionGroup, rfidKey.specialAction);
                    }
                }

                if (abs.GetERP() != null && message.StartsWith("0"))
                {
                    SapncoClient client = new SapncoClient();
                    client.RegisterRfcDestination();
                    var sapCreateDate = DateTime.Now;
                    SAPLog sapLog = new SAPLog() { Zsjno = sapCreateDate.ToString("yyyyMMddHHmmss") + abs.GetData().Exidv, Ztype = abs.GetData().ecp, Werks = abs.GetData().plantToStr, Zpltn = abs.GetData().assLine, Zpoint = abs.GetData().linePoint, Matnr = abs.GetData().Matnr, Exidv = abs.GetData().Exidv, ZlgortOri = abs.GetData().stockFromStr, ZlgortTar = abs.GetData().stockToStr, qty = rfidKey.qty.ToString(), Created = sapCreateDate.ToString("yyyy-MM-dd HH:mm:ss") };
                    SAPLog ret = client.InvokeRFCFunctionRFID(sapLog);
                    sapLogger(ret);
                    if (sapLog.M_TYPE.Contains("E"))
                    {
                        //return new ServerMessage() { Code = 1, Msg = "SAP ERROR" };
                    }
                }
            }
            catch
            {
                megInfo.Code = 1;
                megInfo.Msg = "Data Error";
            }
            var msg = string.IsNullOrEmpty(message) ? new string[2] { "1", "Data Handle Error" } : message.Split(',');
            //插入处理记录
            var svc = new ServerMessage() { Code = int.Parse(msg[0]), Msg = msg[1] };
            dataObj.CodeInt = svc.Code;
            dataObj.Msg = svc.Msg;
            var acionArray = acionGroup.Split(',').ToList();
            if (!string.IsNullOrEmpty(rfidKey.specialAction))
            {
                if (!acionArray.Contains(rfidKey.specialAction.ToLower()))
                {
                    dataObj.Action = rfidKey.specialAction.ToUpper();
                }
            }
            this.SqlExecute<int>("insert into Operation(rfidKey,action,plantTo,stockTo,binTo,plantFrom,stockFrom,binFrom,matnr,exidv,recordTime,processingState,messageHints) values(@Code,@Action,@plantTo,@stockLocTo,@stockBinTo,@plantFrom,@stockLocFrom,@stockBinFrom,@Matnr,@Exidv,now(),@CodeInt,@Msg)", dataObj);
            return svc;
        }

        private string RunActionGroup(AbsRfidCollections<RfidCollections> abs, string acionGroup, string specialAction)
        {
            DataView_DAL ddal = new DataView_DAL();

            string message = string.Empty;
            var acionArray = acionGroup.Split(',').ToList();
            List<string> actionDone = new List<string>();
            if (!string.IsNullOrEmpty(specialAction))
            {
                switch (specialAction)
                {
                    case "IN"://入库
                        message = abs.TagIn();
                        break;

                    case "OUT"://出库
                        message = abs.TagGenerate();//sap
                        break;
                }

                if (message.StartsWith("1")) return message;
                actionDone = new List<string> { "in", "out" };
                if (!acionArray.Contains(specialAction.ToLower())) return message;
            }
            //else
            //{
            foreach (var p in acionArray)
            {
                if (actionDone.Contains(p)) continue;
                switch (p)
                {
                    case "in"://入库
                        message = abs.TagIn();
                        if (message.StartsWith("0")) ddal.InsertData();
                        break;

                    case "unbound"://解绑
                        message = abs.TagUnbundling();
                        break;

                    case "out"://出库
                        message = abs.TagGenerate();//sap
                        if (message.StartsWith("0")) ddal.InsertData();
                        break;

                    case "pull"://产生拉动
                        message = abs.TagPull();
                        break;

                    case "bind"://绑定
                        message = abs.TagBundling();
                        break;

                    case "feed"://清除拉动
                        message = abs.TakeOut();
                        break;

                    default: break;
                }
                if (message.StartsWith("1")) break;
            }

            //}

            return message;
        }

        public ServerMessage GetAction(string code)
        {
            var actionName = this.SqlQueryOne<string>(" select action from rfidinfo where rfidKey=@rfidKey", new { rfidKey = code });
            return string.IsNullOrEmpty(actionName) ? new ServerMessage() { Code = 1, Msg = "Error: Not Find This Code" } : new ServerMessage() { Code = 0, Msg = actionName };
        }

        public ServerMessage InsertOrUpdateTag(Rfid_tag tag)
        {
            ServerMessage newServerMessage = new ServerMessage();
            var codeStr = ConfigurationManager.AppSettings["CodeRegex"].ToString();
            string msg = this.SqlProcedure<string>("InsertOrUpdateTag", new { codeStr = codeStr, tagFirstC = tag.tagFirst, tagLastC = tag.tagLast }).FirstOrDefault();
            if (string.IsNullOrEmpty(msg))
            {
                newServerMessage = new ServerMessage() { Code = 1, Msg = "This Code Is Null" };
            }
            else
            {
                newServerMessage = new ServerMessage() { Code = 0, Msg = msg };
            }

            return newServerMessage;
        }

        public bool sapLogger(SAPLog log)
        {
            return this.SqlExecute<int>("INSERT INTO sap_log(Zsjno,Ztype,Werks,Zpltn,Zpoint,Matnr,Exidv,ZlgortOri,ZlgortTar,qty,M_TYPE,M_MESS,created) VALUES(@Zsjno,@Ztype,@Werks,@Zpltn,@Zpoint,@Matnr,@Exidv,@ZlgortOri,@ZlgortTar,@qty,@M_TYPE,@M_MESS,@Created)", log) > 0;
        }

        public RfidCollections whereRfidCollections(string p)
        {
            return this.SqlQueryOne<RfidCollections>("select * from rfidinfo where rfidKey='" + p + "'", null);
        }

        public string whereBinCode(int p)
        {
            return this.SqlQueryOne<string>("select binCode from bin where id=" + p, null);
        }
    }
}