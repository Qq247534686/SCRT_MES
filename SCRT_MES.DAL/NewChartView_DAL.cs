using Factory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using Model;
using System.Dynamic;
namespace DAL
{
    public class NewChartView_DAL : SqlHelps
    {
        private static List<NewChartView> cacheData { get; set; }
        public List<NewChartView> GetBinStock()
        {
            List<NewChartView> chart = new List<NewChartView>();
            var data = this.SqlQuery<dynamic>("select * from GetBinStockView where binCode like 'L0%'", null).ToList();
            data.ForEach(p =>
            {
                NewChartView newChartView = new NewChartView();
                newChartView.BIN = p.binCode;
                newChartView.LOC = p.stockCode;
                if (!string.IsNullOrEmpty(p.wlh))
                {
                    newChartView.MATNR = "--";
                    string[] list = p.wlh.Split(',');
                    for (int i = 0; i < list.Length; i++)
                    {
                        if (!list[i].Equals("empty"))
                        {
                            newChartView.MATNR = list[i];
                            break;
                        }
                    }
                    newChartView.COUNT = list.Length;
                }
                else
                {
                    newChartView.MATNR = "--";
                    newChartView.COUNT = 0;
                }
                chart.Add(newChartView);

            });
            if (cacheData == null)
            {
                cacheData = chart;
            }
            else
            {
                for (int i = 0; i < cacheData.Count; i++)
                {
                    if (cacheData[i].MATNR != chart[i].MATNR) cacheData[i].MATNR = chart[i].MATNR;

                    if (cacheData[i].COUNT == chart[i].COUNT)
                    {
                        cacheData[i].IsAnimation = 0;
                    }
                    else
                    {
                        cacheData[i].COUNT = chart[i].COUNT;
                        cacheData[i].IsAnimation = 1;
                    }
                }
            }
            return cacheData;
        }

        public List<Fromtorecord> GetBinStockTransport()
        {
            var data = this.SqlQuery<Fromtorecord>("select b.binCode as stockBinFrom,c.stockCode as stockLocFrom,d.stockCode as stockLocTo,a.insertTime,a.matnr from fromtorecord as a left join bin as b on a.stockBinFrom = b.id left join stock as c on c.id = a.stockLocFrom left join stock as d on d.id = a.stockLocTo  where a.stockLocTo = 7 ", null).ToList();
            return data;
        }
    }
}
