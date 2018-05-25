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
     *文件名：  UserInfo_BLL
     *版本号：  V1.0.0.0
     *唯一标识：d136ed52-d5d9-4572-a957-7598caece01f
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/7 星期二 下午 2:18:23

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/7 星期二 下午 2:18:23
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class UserInfo_BLL
    {
        private UserInfo_DAL dal { get; set; }
        public UserInfo GetUserInfo(UserInfo userInfo)
        {
            return dal.GetUserInfo(userInfo);
        }

        public List<UserInfo> GetTableData(StoreParams storeParams, ref int count)
        {
            return dal.GetTableData(storeParams, ref count);
        }

        public MessageShow DeleteMethod(string idArray)
        {
            return dal.DeleteMethod(idArray);
        }

        public MessageShow EditSaveMethod(UserInfo userInfo)
        {
            return dal.EditSaveMethod(userInfo);
        }

        public bool SaveUserInfo(UserInfo data)
        {
            return dal.SaveUserInfo(data);
        }
        public bool HasAccessPermission(UserInfo data, string url)
        {
            return dal.HasAccessPermission(data, url);
        }
    }
}
