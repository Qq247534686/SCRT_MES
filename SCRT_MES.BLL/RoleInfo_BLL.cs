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
     *文件名：  RoleInfo_BLL
     *版本号：  V1.0.0.0
     *唯一标识：f86c9ee4-49e8-4625-9e79-9b459e3afbd8
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/7 星期二 下午 10:12:58

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/7 星期二 下午 10:12:58
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class RoleInfo_BLL
    {
        RoleInfo_DAL dal { get; set; }

        public List<RoleInfo> GetTableData(StoreParams storeParams, ref int count)
        {
            return dal.GetTableData(storeParams, ref count);
        }

        public MessageShow EditSaveMethod(RoleInfo roleInfo)
        {
            return dal.EditSaveMethod(roleInfo);
        }

        public MessageShow DeleteMethod(string theID)
        {
            return dal.DeleteMethod(theID);
        }
        public List<ComBoxStore> GetAllRolesData(StoreParams storeParams, ref int count)
        {
            return dal.GetAllRolesData(storeParams, ref count);
        }
    }
}
