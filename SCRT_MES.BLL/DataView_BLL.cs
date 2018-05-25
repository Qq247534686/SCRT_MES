using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Model;

namespace BLL
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：BLL
     *文件名：  BinMatrnRecord_BLL
     *版本号：  V1.0.0.0
     *唯一标识：a826f8e3-de8a-4075-a49d-9990dfb750ea
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/18 星期六 下午 2:24:02

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/18 星期六 下午 2:24:02
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class DataView_BLL
    {
        private DataView_DAL dal = new DataView_DAL();

        public void InsertData()
        {
            dal.InsertData();
        }

        public List<ChartData> GetBinMatrnRecordData()
        {
            return dal.GetBinMatrnRecordData();
        }

        public  List<ChartData> GetMaterialChartData(string Stock){
            return dal.GetMaterialChartData(Stock);
        }

        public List<ChartData> GetMaterialChartDataWeekly(string Stock) {
            return dal.GetMaterialChartDataWeekly(Stock);
        }


        #region 装配图表数据
        public List<ChartData> GetGeneralAssemblyMatnr(string appStr)
        {
            return dal.GetGeneralAssemblyMatnr(appStr);
        }

        public List<ChartData> GetGeneralAssemblyMatnrWeek(string appStr)
        {
            return dal.GetGeneralAssemblyMatnrWeek(appStr);
        }
        #endregion
       
    }
}
