using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Factory;
using Model;
using Dapper;
namespace DAL
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：DAL
     *文件名：  UserInfo_DAL
     *版本号：  V1.0.0.0
     *唯一标识：40c48967-2949-4a13-bc7a-2b66cf97d67b
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/7 星期二 下午 2:18:33

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/7 星期二 下午 2:18:33
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class UserInfo_DAL : SqlHelps
    {

        public UserInfo GetUserInfo(UserInfo userInfo)
        {
            return this.SqlQueryOne<UserInfo>("SELECT * FROM userInfo WHERE userName=@UserName AND userPassword=@UserPassword", userInfo);
        }

        public List<UserInfo> GetTableData(StoreParams store, ref int count)
        {
           
            string sqlWhere = AppendWhere(store.obj);
            string order = store.sort + " " + store.dir;
            order = string.IsNullOrEmpty(order.Trim()) ? " id asc " : order;
            count = this.SqlQueryOne<int>("SELECT COUNT(1) FROM UserInfo LEFT JOIN UserInfoWithRoles ON UserInfoWithRoles.userIdFK=UserInfo.id LEFT JOIN RoleInfo ON RoleInfo.id=UserInfoWithRoles.roleIdFK WHERE  " + sqlWhere, null);
            string sql = string.Format("SELECT * FROM (SELECT UserInfo.Id,UserInfo.UserName,UserInfo.UserPassword,RoleInfo.RoleName,RoleInfo.Id AS RoleIdFK FROM UserInfo LEFT JOIN UserInfoWithRoles ON UserInfoWithRoles.userIdFK=UserInfo.id LEFT JOIN RoleInfo ON RoleInfo.id=UserInfoWithRoles.roleIdFK) AS a WHERE {0} ORDER BY {1}  LIMIT {2},{3}", sqlWhere, order, store.start, store.limit);
            return this.SqlQuery<UserInfo>(sql, null).ToList();
        }
        /// <summary>
        /// 构建搜索条件
        /// </summary>
        /// <param name="p"></param>
        /// <returns></returns>
        private string AppendWhere(object p)
        {
            string sqlWhere = " 1=1 ";
            if (p != null)
            {
                UserInfo obj = p as UserInfo;
                sqlWhere += string.IsNullOrEmpty(obj.UserName) ? "" : " AND UserName LIKE '%" + obj.UserName + "%' ";
                sqlWhere += obj.RoleIdFK <= 0 ? "" : " AND RoleIdFK=" + obj.RoleIdFK;
                sqlWhere += string.IsNullOrEmpty(obj.RoleName) ? "" : " AND RoleName LIKE '%" + obj.RoleName + "%' ";
            }
            return sqlWhere;
        }

       

        public MessageShow DeleteMethod(string idArray)
        {
            MessageShow msg = new MessageShow();
            msg.success = this.SqlExecute<int>("DELETE FROM UserInfo WHERE id IN(" + idArray + ")", null) > 0;
            this.SqlExecute<int>("DELETE FROM userInfoWithRoles WHERE userIdFK IN(" + idArray + ")", null);
            msg.message = msg.success ? "删除成功" : "删除失败";
            return msg;
        }

        public MessageShow EditSaveMethod(UserInfo userInfo)
        {
            MessageShow msg = new MessageShow();
            if (userInfo.Id <= 0)//The current user already exists
            {
                if (this.SqlCount(string.Format("SELECT COUNT(1) FROM UserInfo WHERE UserName='{0}'",userInfo.UserName), null) > 0)
                {
                    msg.success = false; 
                    msg.message = "此用户已存在";
                }
                else
                {
                    string getUserInfoId = string.Format("INSERT INTO UserInfo(UserName,UserPassword) VALUES ('{0}','{1}');SELECT LAST_INSERT_ID()", userInfo.UserName, userInfo.UserPassword);
                    userInfo.Id = this.SqlQueryOne<int>(getUserInfoId, null);
                    string joinUserWithRole = string.Format("INSERT INTO userInfoWithRoles(roleIdFK,userIdFK) VALUES({0},{1})", userInfo.RoleIdFK, userInfo.Id);
                    this.SqlExecute<int>(joinUserWithRole, null);
                    msg.success = true; 
                    msg.message = msg.success ? "保存成功" : "保存失败";
                }
            }
            else
            {
                this.SqlExecute<int>("UPDATE UserInfo SET UserName=@UserName,UserPassword=@UserPassword WHERE id=@Id", userInfo);
                msg.success = this.SqlExecute<int>("UPDATE UserInfoWithRoles SET RoleIdFK=@RoleIdFK WHERE UserIdFK=@Id", userInfo) > 0;
                if (!msg.success)
                {
                    msg.success = this.GetDb().Execute("INSERT INTO UserInfoWithRoles(RoleIdFK, UserIdFK ) VALUES(@RoleIdFK,@Id)", userInfo) > 0;
                }
                msg.message = msg.success ? "保存成功" : "保存失败";
            }
            return msg;
        }

        public bool SaveUserInfo(UserInfo data)
        {
            bool state=false;
            if (data != null && data.Id > 0)
            {
                if (this.SqlQueryOne<int>("select count(1) from userinfo where id=@Id and userPassword=@UserPassword", data) > 0)
                {
                    state = this.SqlExecute<int>("update userinfo set userPassword=@ConfirmPassword where id=@Id", data) > 0;
                }
            }
            return state;
        }

        public bool HasAccessPermission(UserInfo data, string url)
        {
            var menuCollections=this.SqlProcedure<SystemMenu>("GetUserMenuInfo", new { nowUserName = data.UserName }).ToList();
            return menuCollections.Where(p => p.Url == url).Count()>0;
        }
    }
}
