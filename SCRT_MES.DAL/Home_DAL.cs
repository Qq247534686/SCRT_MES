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
     *文件名：  Home_DAL
     *版本号：  V1.0.0.0
     *唯一标识：e8134e17-0d2e-47a6-9bc3-4c978fc7af22
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/7 星期二 下午 3:52:32

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/7 星期二 下午 3:52:32
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class Home_DAL : SqlHelps
    {
        public List<SystemMenu> GetNavTreeByUserID(UserInfo userInfo)
        {
            List<SystemMenu> treeData = new List<SystemMenu>();
            var userMenuID = this.SqlQueryOne<string>("SELECT RoleWithTreeID FROM RoleInfo WHERE RoleInfo.id=(SELECT RoleIdFK FROM UserInfoWithRoles WHERE UserIdFK=@Id)", userInfo);
            if (!string.IsNullOrEmpty(userMenuID))
            {
                var data = this.SqlQueryOne<SystemMenu>("SELECT * FROM SystemMenu WHERE ParentID=@ParentID", new { ParentID = -1 });
                data.Children = new List<SystemMenu>();
                data.Children.AddRange(ForNodeToAppend(data, this.SqlQuery<SystemMenu>("SELECT * FROM SystemMenu", null).ToList(), userMenuID));
                treeData.Add(data);
            }
            return treeData;
        }
        public List<SystemMenu> GetNavTreeByUserID()
        {
            List<SystemMenu> treeData = new List<SystemMenu>();
            var data = this.SqlQueryOne<SystemMenu>("SELECT * FROM SystemMenu WHERE ParentID=@ParentID", new { ParentID = -1 });
            data.Children = new List<SystemMenu>();
            data.Children.AddRange(ForNodeToAppend(data, this.SqlQuery<SystemMenu>("SELECT * FROM SystemMenu", null).ToList()));
            treeData.Add(data);
            return treeData;
        }
        private List<SystemMenu> ForNodeToAppend(SystemMenu thisNode, List<SystemMenu> NodeData)
        {
            var nodes = NodeData.Where(u => u.ParentID == thisNode.MenuID).ToList();
            if (nodes.Count > 0)
            {
                nodes.ForEach(u =>
                {
                    u.Children = new List<SystemMenu>();
                    u.Children.AddRange(ForNodeToAppend(u, NodeData));
                });
            }
            return nodes;
        }
        private List<SystemMenu> ForNodeToAppend(SystemMenu thisNode, List<SystemMenu> NodeData, string userMenuID)
        {
            var nodes = NodeData.Where(u => u.ParentID == thisNode.MenuID).ToList();
            var menuArray = userMenuID.Split(',').ToList();
            if (menuArray.Contains(thisNode.MenuID.ToString()) || thisNode.Leaf == false)
            {
                if (nodes.Count > 0)
                {
                    nodes.ForEach(u =>
                    {
                        if (!menuArray.Contains(u.MenuID.ToString()) && u.Leaf == true)
                        {
                            u.Hidden = true;
                        }
                        u.Children = new List<SystemMenu>();
                        u.Children.AddRange(ForNodeToAppend(u, NodeData, userMenuID));
                    });
                }
            }
            return nodes;
        }
    }
}
