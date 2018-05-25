using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Factory;
using Model;
using Utilities;

namespace DAL
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：DAL
     *文件名：  BinMatrnRecord_DAL
     *版本号：  V1.0.0.0
     *唯一标识：f4859393-f369-4edd-8451-5a15dce4e2d9
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/18 星期六 下午 2:24:35

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/18 星期六 下午 2:24:35
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class DataView_DAL : SqlHelps
    {
        public void InsertData()
        {
            try
            {
                this.SqlProcedure("QueryChartDaily", new { binPT = 4, matnrPT = 6 });
            }
            catch (Exception ex)
            {
                LogHelper.Error("Quartz Work Error", ex);
            }
        }

        public List<ChartData> GetMaterialChartData(string Stock)
        {
            List<ChartData> charts = new List<ChartData>();
            var binArray = this.SqlQuery<Bin>("select a.id,binCode from bin as a left join stock as b on a.stockId = b.id where b.stockCode=@stockCode", new { stockCode = Stock }).ToList();//货道
            foreach (var p in binArray)
            {
                ChartData chart = new ChartData();
                chart.data = new List<ChartLegendXY>();
                chart.bin = p.BinCode;
                var matrnArray = this.SqlQuery<BinMatrnRecord>("select sum(MatrnCount) as MatrnCount,recordTime from binmatrnrecord where bin=@bin and DATE(recordTime)=CURDATE() group by recordTime order by recordTime asc", new { bin = p.Id }).ToList();//今天货到的库存量
                if (matrnArray.Count < 1) continue;
                ChartLegendXY chartLegendXY = new ChartLegendXY();
                chartLegendXY.Legend = p.BinCode;
                chartLegendXY.X = matrnArray.Select(s => s.RecordTime).ToList();
                chartLegendXY.Y = matrnArray.Select(s => s.MatrnCount).ToList();
                chart.data.Add(chartLegendXY);
                charts.Add(chart);
            }

            return charts;
        }

        public List<ChartData> GetMaterialChartDataWeekly(string Stock)
        {
            List<ChartData> charts = new List<ChartData>();
            var binArray = this.SqlQuery<Bin>("select a.id,binCode from bin as a left join stock as b on a.stockId = b.id where b.stockCode=@stockCode", new { stockCode = Stock }).ToList();//货道
            foreach (var p in binArray)
            {
                ChartData chart = new ChartData();
                chart.data = new List<ChartLegendXY>();
                chart.bin = p.BinCode;
                var matrnArray = this.SqlQuery<BinMatrnRecord>("select RecordTime,MatrnCount as MatrnCount,weekofyear(RecordTime) as week from (select * from binmatrnrecord where year(recordTime) = year(curdate()) and bin = @bin order by recordTime desc ) a group by weekofyear(recordTime) ", new { bin = p.Id }).ToList();//今天货到的库存量
                if (matrnArray.Count < 1) continue;
                ChartLegendXY chartLegendXY = new ChartLegendXY();
                chartLegendXY.Legend = p.BinCode;
                chartLegendXY.X = matrnArray.Select(s => s.week).ToList();
                chartLegendXY.Y = matrnArray.Select(s => s.MatrnCount).ToList();
                chart.data.Add(chartLegendXY);
                charts.Add(chart);
            };

            return charts;
        }

        public List<ChartData> GetBinMatrnRecordData()
        {
            List<ChartData> charts = new List<ChartData>();
            var binArray = this.SqlQuery<Bin>("select id,binCode from bin", null).ToList();//货道
            binArray.ForEach(p =>
            {
                ChartData chart = new ChartData();
                chart.data = new List<ChartLegendXY>();
                chart.bin = p.BinCode;
                var matrnArray = this.SqlQuery<string>("select DISTINCT matrnNumber from binmatrnrecord where bin=@bin and DATE(recordTime)=CURDATE()", new { bin = p.Id }).ToList();//今天货道下的各个物料
                matrnArray.ForEach(u =>
                {
                    ChartLegendXY chartLegendXY = new ChartLegendXY();
                    chartLegendXY.Legend = u;
                    var binMatrnRecord = this.SqlQuery<BinMatrnRecord>("select recordTime,matrnCount from binmatrnrecord where bin=@bin and DATE(recordTime)=CURDATE() and matrnNumber=@matrnNumber ORDER BY recordTime asc", new { bin = p.Id, matrnNumber = u }).ToList();
                    chartLegendXY.X = binMatrnRecord.Select(s => s.RecordTime).ToList();
                    chartLegendXY.Y = binMatrnRecord.Select(s => s.MatrnCount).ToList();
                    chart.data.Add(chartLegendXY);
                });
                charts.Add(chart);
            });
            return charts;
            // ChartData
        }

        #region 装配日物料图

        public List<ChartData> GetGeneralAssemblyMatnr(string appStr)
        {
            List<ChartData> charts = new List<ChartData>();
            var matrns = this.SqlQuery<string>("SELECT matrn FROM rfidsystem.binmatrnrecord_matnr where DATE(recordTime) = DATE(now()) group by matrn", null).ToList();

            foreach (var p in matrns)
            {
                ChartData chart = new ChartData();
                chart.data = new List<ChartLegendXY>();
                chart.bin = p;
                var matrnArray = this.SqlQuery<BinMatrnRecord>("select recordTime,matrnCount from binmatrnrecord_matnr where matrn=@matrn and DATE(recordTime)=CURDATE() ORDER BY recordTime asc", new { matrn = p }).ToList();
                if (matrnArray.Count < 1) continue;
                ChartLegendXY chartLegendXY = new ChartLegendXY();
                chartLegendXY.Legend = p;
                chartLegendXY.X = matrnArray.Select(s => s.RecordTime).ToList();
                chartLegendXY.Y = matrnArray.Select(s => s.MatrnCount).ToList();
                chart.data.Add(chartLegendXY);
                charts.Add(chart);
            }
            return charts;
        }

        #endregion 装配日物料图

        public List<ChartData> GetGeneralAssemblyMatnrWeek(string appStr)
        {
            List<ChartData> charts = new List<ChartData>();
            var matrns = this.SqlQuery<string>("SELECT matrn FROM rfidsystem.binmatrnrecord_matnr where DATE(recordTime) = DATE(now()) group by matrn", null).ToList();
            foreach (var p in matrns)
            {
                ChartData chart = new ChartData();
                chart.data = new List<ChartLegendXY>();
                chart.bin = p;
                var matrnArray = this.SqlQuery<BinMatrnRecord>("select RecordTime,MatrnCount as MatrnCount,weekofyear(RecordTime) as week from (select * from binmatrnrecord_matnr where year(recordTime) = year(curdate()) and matrn = @matrn order by recordTime desc ) a group by weekofyear(recordTime) ", new { matrn = p }).ToList();//今天货到的库存量
                if (matrnArray.Count < 1) continue;
                ChartLegendXY chartLegendXY = new ChartLegendXY();
                chartLegendXY.Legend = p;
                chartLegendXY.X = matrnArray.Select(s => s.week).ToList();
                chartLegendXY.Y = matrnArray.Select(s => s.MatrnCount).ToList();
                chart.data.Add(chartLegendXY);
                charts.Add(chart);
            };
            return charts;
        }
    }
}