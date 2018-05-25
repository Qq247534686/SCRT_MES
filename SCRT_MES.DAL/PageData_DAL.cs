using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Factory;
using Model;

namespace DAL
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：DAL
     *文件名：  PageData_DAL
     *版本号：  V1.0.0.0
     *唯一标识：01dacacb-8868-4c49-8b9b-946830c18518
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/14 星期二 下午 10:11:22

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/14 星期二 下午 10:11:22
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class PageData_DAL : SqlHelps
    {
        public List<TransportPlant> GetPullData()
        {
           var data = this.SqlQuery<TransportPlant>("call GetPullData", null).ToList();
           if (data == null)
           {
               data = new List<TransportPlant>();
           }
           
           return data;
        }
        public List<BinStocPlant> GetBinStockData()
        {
            var data = this.SqlQuery<BinStocPlant>("call GetBinStockData", null).ToList();
            if (data == null)
            {
                data = new List<BinStocPlant>();
            }

            return data;
        }
    }
}
