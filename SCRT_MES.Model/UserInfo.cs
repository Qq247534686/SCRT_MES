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
     *文件名：  UserInfo
     *版本号：  V1.0.0.0
     *唯一标识：8ebdf3b7-fdbc-4145-859e-2627116d5085
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/7 星期二 下午 2:15:59

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/7 星期二 下午 2:15:59
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class UserInfo
    {

        private int id;
        private string userName;
        private string userPassword;
        private int roleIdFK;
        private string roleName;
        private string confirmPassword;

        public string ConfirmPassword
        {
            get { return confirmPassword; }
            set { confirmPassword = value; }
        }

        public int RoleIdFK
        {
            get { return roleIdFK; }
            set { roleIdFK = value; }
        }
     

        public string RoleName
        {
            get { return roleName; }
            set { roleName = value; }
        }
        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public string UserPassword
        {
            get { return userPassword; }
            set { userPassword = value; }
        }
    }
}
