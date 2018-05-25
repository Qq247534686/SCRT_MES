using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Dapper;
using Factory;
namespace DAL
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：DAL
     *文件名：  RoleInfo_DAL
     *版本号：  V1.0.0.0
     *唯一标识：6e65bba4-0f62-42a2-ad63-707442b4bd52
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/7 星期二 下午 10:13:22

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/7 星期二 下午 10:13:22
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class RoleInfo_DAL : SqlHelps
    {
        public List<RoleInfo> GetTableData(StoreParams store, ref int count)
        {
            List<RoleInfo> roles = new List<RoleInfo>();
            string sqlWhere = AppendWhere(store.obj);
            string order = store.sort + " " + store.dir;
            order = string.IsNullOrEmpty(order.Trim()) ? " id asc " : order;
            count = this.SqlQueryOne<int>("SELECT * FROM RoleInfo WHERE  "+sqlWhere,null);
            string sql = string.Format("SELECT * FROM RoleInfo WHERE {0} ORDER BY {1}  LIMIT {2},{3}", sqlWhere, order, store.start, store.limit);
            var data = this.SqlQuery<RoleInfo>(sql, null).ToList();
            return data;
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
                RoleInfo obj = p as RoleInfo;
                sqlWhere += string.IsNullOrEmpty(obj.RoleName) ? "" : " AND RoleName LIKE '%" + obj.RoleName + "%' ";
                sqlWhere += obj.Id <= 0 ? "" : " AND id=" + obj.Id;
            }
            return sqlWhere;
        }

        public MessageShow EditSaveMethod(RoleInfo roleInfo)
        {

            MessageShow msg = new MessageShow();
            if (roleInfo.Id <= 0)//The current user already exists
            {
                if (this.SqlCount("SELECT COUNT(1) FROM RoleInfo WHERE RoleName='" + roleInfo.RoleName + "'", null) > 0)
                {
                    msg.success = false; msg.message = "此权限名称已存在";
                }
                else
                {
                    msg.success = this.GetDb().Execute("INSERT INTO RoleInfo( RoleName, RoleRemarks,RoleWithTreeName,RoleWithTreeID) VALUES  (@RoleName, @roleRemarks,@RoleWithTreeName,@RoleWithTreeID);SELECT LAST_INSERT_ID()", roleInfo) > 0;
                    msg.message = msg.success ? "保存成功" : "保存失败";

                }
            }
            else
            {
                msg.success = this.GetDb().Execute("UPDATE RoleInfo SET RoleName=@RoleName,RoleRemarks=@RoleRemarks,RoleWithTreeName=@RoleWithTreeName,RoleWithTreeID=@RoleWithTreeID WHERE Id=@Id", roleInfo) > 0;
                msg.message = msg.success ? "保存成功" : "保存失败";
            }

            return msg;
        }

        public MessageShow DeleteMethod(string theID)
        {
            MessageShow msg = new MessageShow();
            msg.success = this.GetDb().Execute("DELETE FROM  RoleInfo WHERE Id IN(" + theID + ")", null) > 0;
            msg.message = msg.success ? "删除成功" : "删除失败";
            return msg;
        }

        public List<ComBoxStore> GetAllRolesData(StoreParams storeParams, ref int count)
        {
            var data = this.SqlQuery<ComBoxStore>("SELECT id AS Value,RoleName AS Text FROM RoleInfo", null).ToList();
            count = data.Count();
            return data;
        }
    }
}
