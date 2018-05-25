using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：BLL
     *文件名：  Home_BLL
     *版本号：  V1.0.0.0
     *唯一标识：e66c8e35-a546-4d2d-94b4-30c1d5521d41
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/7 星期二 下午 3:55:26

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/7 星期二 下午 3:55:26
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class Home_BLL
    {
        private Home_DAL dal { get; set; }

        public List<Model.SystemMenu> GetNavTreeByUserID(Model.UserInfo userInfo)
        {
            return dal.GetNavTreeByUserID(userInfo);
        }

        public List<Model.SystemMenu> GetNavTreeByUserID()
        {
            return dal.GetNavTreeByUserID();
        }
    }
}
