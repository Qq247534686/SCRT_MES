using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Dapper;
using Factory;
using System.Data;

namespace DAL
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：Factory
     *文件名：  RunRfidCollections
     *版本号：  V1.0.0.0
     *唯一标识：2790ef6e-91d0-4a08-9259-c6e3b9521fd4
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/13 星期一 下午 9:39:00

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/13 星期一 下午 9:39:00
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class RunRfidCollections_DAL : AbsRfidCollections<RfidCollections>
    {
        private SqlHelps db = new SqlHelps();

        public RunRfidCollections_DAL(RfidCollections inputData)//code sku matnr
        {
            data = db.SqlQueryOne<RfidCollections>("select * from rfidinfo where rfidKey=@RfidKey", new { RfidKey = inputData.rfidKey });
            if (data != null)
            {
                data.Code = db.SqlQueryOne<string>("select code from rfid_tag where tagfirst=@Code or taglast=@Code", new { Code = inputData.Code });

                data.stockFromStr = db.SqlQueryOne<string>("select stockCode from stock where id = @id", new { id = data.stockLocFrom });
                data.stockToStr = db.SqlQueryOne<string>("select stockCode from stock where id = @id", new { id = data.stockLocTo });
                data.plantToStr = db.SqlQueryOne<string>("select plantCode from plant where id = @id", new { id = data.plantTo });
                data.Tag_id = db.SqlQueryOne<int>("select id from rfid_tag where tagfirst=@Code or taglast=@Code", new { Code = inputData.Code });

                if (inputData.Matnr == null)
                {
                    data.Matnr = db.SqlQueryOne<string>("SELECT matnr FROM rfidsystem.rfid_bound where tag_id = @tag_id order by id desc", new { tag_id = data.Tag_id });
                }
                else
                {
                    data.Matnr = inputData.Matnr;
                }
                if (inputData.Exidv == null)
                {
                    data.Exidv = db.SqlQueryOne<string>("SELECT exidv FROM rfidsystem.rfid_bound where tag_id = @tag_id order by id desc", new { tag_id = data.Tag_id });
                }
                else
                {
                    data.Exidv = inputData.Exidv;
                }
            }
        }

        public override RfidCollections GetData()
        {
            return base.data;
        }

        public override string GetAction()
        {
            return base.data.Action;
        }

        public override string GetERP()
        {
            return base.data.ecp;
        }

        public override string EmptyContainer()
        {
            return db.SqlProcedure<string>("EmptyContainer", new { theCode = data.Code, theEmpty_pt = data.Empty_pt }).FirstOrDefault();
        }

        public override string TakeOut()
        {
            //拉动看板减去一种料
            var str = "";
            var newData = new { theSLF = data.stockLocFrom, theSBF = data.stockBinTo };
            if (newData != null)
            {
                str = db.SqlQueryOne<string>("call FeedOnePull(@theSLF,@theSBF)", newData);
            }
            return str == "" ? "1,data is null" : str;
        }

        public override string GeneratePull()
        {
            var message = string.Empty;
            //SAP同步。。。。
            if (SAPMethod())
            {
                //标签记录更新 拉动
                var newData = new { theCode = data.Code, tStockLocFrom = data.stockLocFrom, tStockBinFrom = data.stockBinFrom, tStockLocTo = data.stockLocTo };
                message = db.SqlQueryOne<string>("call GeneratePull(@theCode,@tStockLocFrom,@tStockBinFrom,@tStockLocTo)", newData);
            }
            else
            {
                message = "SAP反馈失败";
            }
            return message == "" ? "1,data error" : message;
        }

        public override bool SAPMethod()
        {
            return true;
        }

        public override string TagBundling()
        {
            return db.SqlQueryOne<string>("call TagBundling (@theCode,@theMatnr,@theExidv)", new { theMatnr = data.Matnr, theExidv = data.Exidv, theCode = data.Code });
        }

        public override string TagUnbundling()
        {
            //插入记录
            return db.SqlProcedure<string>("TagUnbundling", new { theCode = data.Code }).FirstOrDefault();
        }

        public override string TagIn()
        {
            //进入
            return db.SqlQueryOne<string>("call TagIn ('" + data.Code + "','" + data.plantTo + "','" + data.stockLocTo + "','" + data.stockBinTo + "')", null);
        }

        public override string TagGenerate()
        {
            //Generate
            return db.SqlQueryOne<string>("call TagGenerate (@theCode,@tStockLocFrom,@tStockBinFrom,@tStockLocTo)", new { theCode = data.Code, tStockLocFrom = data.stockLocFrom, tStockBinFrom = data.stockBinFrom, tStockLocTo = data.stockLocTo });
            //return db.SqlProcedure<string>("TagGenerate", new { theCode = data.Code, tStockLocFrom = data.stockLocFrom, tStockBinFrom = data.stockBinFrom, tStockLocTo = data.stockLocTo }).FirstOrDefault();
        }

        public override string TagPull()
        {
            //Pull
            data.Matnr = db.SqlQueryOne<string>("select Matnr from rfid_bound where tag_id = @id order by id desc", new { id = data.Tag_id });

            return db.SqlQueryOne<string>("call TagPull(@theCode,@tStockLocFrom,@tStockBinFrom,@tStockLocTo,@theMatnr)", new { theCode = data.Code, tStockLocFrom = data.stockLocFrom, tStockBinFrom = data.stockBinFrom, tStockLocTo = data.stockLocTo, theMatnr = data.Matnr });
            // return db.SqlProcedure<string>("TagPull", new { theCode = data.Code, tStockLocFrom = data.stockLocFrom, tStockBinFrom = data.stockBinFrom, tStockLocTo = data.stockLocTo, theMatnr = data.Matnr }).FirstOrDefault();
        }
    }
}