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
     *文件名：  PageData_BLL
     *版本号：  V1.0.0.0
     *唯一标识：6c7c8c22-0777-4b76-88a2-1afc539b350f
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/14 星期二 下午 10:10:50

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/14 星期二 下午 10:10:50
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class PageData_BLL
    {
        private PageData_DAL dal = new PageData_DAL();
        public List<TransportPlant> GetPullData()
        {
            return dal.GetPullData();
        }

        public List<BinStocPlant> GetBinStockData()
        {
            return dal.GetBinStockData();
        }
    }
}
