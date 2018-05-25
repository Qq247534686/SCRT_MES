using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：Model
     *文件名：  RoleInfo
     *版本号：  V1.0.0.0
     *唯一标识：875831b7-24a9-4fea-9aed-89fa55caf8cf
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/7 星期二 下午 8:16:59

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/7 星期二 下午 8:16:59
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class RoleInfo
    {
        private int id;
        private string roleName;
        private string roleRemarks;
        private string roleWithTreeName;
        private string roleWithTreeID;

        public string RoleWithTreeName
        {
            get { return roleWithTreeName; }
            set { roleWithTreeName = value; }
        }
      

        public string RoleWithTreeID
        {
            get { return roleWithTreeID; }
            set { roleWithTreeID = value; }
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string RoleName
        {
            get { return roleName; }
            set { roleName = value; }
        }


       

        public string RoleRemarks
        {
            get { return roleRemarks; }
            set { roleRemarks = value; }
        }

    }
}
