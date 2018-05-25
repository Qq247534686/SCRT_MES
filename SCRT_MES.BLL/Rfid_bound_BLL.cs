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
     *文件名：  Rfid_bound_BLL
     *版本号：  V1.0.0.0
     *唯一标识：20db2c52-be08-4d4f-943a-22acd0ab9c00
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/10 星期五 下午 6:02:38

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/10 星期五 下午 6:02:38
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class Rfid_bound_BLL
    {
        private Rfid_bound_DAL dal { get; set; }

        public List<Rfid_bound> GetTableData(Model.StoreParams storeParams,int thisID, ref int count)
        {
            return dal.GetTableData(storeParams,thisID, ref count);
        }

        public Model.MessageShow DeleteMethod(string RfId)
        {
            return dal.DeleteMethod(RfId);
        }

        public Model.MessageShow EditSaveMethod(Model.Rfid_bound data)
        {
            return dal.EditSaveMethod(data);
        }

    }
}
