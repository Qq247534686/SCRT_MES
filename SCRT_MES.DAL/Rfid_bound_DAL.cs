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
     *文件名：  Rfid_bound_DAL
     *版本号：  V1.0.0.0
     *唯一标识：4754f633-8b4c-4ce3-afab-42432d750a13
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/10 星期五 下午 6:03:01

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/10 星期五 下午 6:03:01
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class Rfid_bound_DAL : SqlHelps
    {
        public List<Model.Rfid_bound> GetTableData(Model.StoreParams store, int thisID, ref int count)
        {
            string sqlWhere = AppendWhere(store.obj, thisID);
            string order = store.sort + " " + store.dir;
            order = string.IsNullOrEmpty(order.Trim()) ? " intime desc " : order;
            count = this.SqlQueryOne<int>("SELECT COUNT(1) FROM rfid_boundView WHERE  " + sqlWhere, null);
            string sql = string.Format("select * from rfid_boundView  WHERE {0} ORDER BY {1} LIMIT {2},{3}", sqlWhere, order, store.start, store.limit);
            return this.SqlQuery<Rfid_bound>(sql, null).ToList();
        }

        /// <summary>
        /// 构建搜索条件
        /// </summary>
        /// <param name="p"></param>
        /// <returns></returns>
        private string AppendWhere(object p, int thisID)
        {
            string sqlWhere = " 1=1 ";
            if (p != null)
            {
                Rfid_bound obj = p as Rfid_bound;
                sqlWhere += string.IsNullOrEmpty(obj.Werks) ? "" : " AND Werks LIKE '%" + obj.Werks + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.Zpltn) ? "" : " AND Zpltn LIKE '%" + obj.Zpltn + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.Matnr) ? "" : " AND Matnr LIKE '%" + obj.Matnr + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.Exidv) ? "" : " AND Exidv LIKE '%" + obj.Exidv + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.Pt) ? "" : " AND Pt LIKE '%" + obj.Pt + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.StartTime) ? "" : " AND Intime>=" + obj.StartTime;
                sqlWhere += string.IsNullOrEmpty(obj.EndTime) ? "" : " AND Intime<=" + obj.EndTime;
                sqlWhere += string.IsNullOrEmpty(obj.Bin) ? "" : " AND Bin='" + obj.Bin+"'";
                sqlWhere += obj.Inbin <= 0 ? "" : " AND Inbin=" + obj.Inbin;
                sqlWhere += obj.Bounded <= 0 ? "" : " AND Bounded=" + obj.Bounded;
            }
            sqlWhere += (thisID <= 0) ? "" : " AND Tag_id=" + thisID;
            return sqlWhere;
        }

        public Model.MessageShow DeleteMethod(string idArray)
        {
            MessageShow msg = new MessageShow();
            msg.success = this.SqlExecute<int>("DELETE FROM Rfid_bound WHERE id IN(" + idArray + ")", null) > 0;
            msg.message = msg.success ? "删除成功" : "删除失败";
            return msg;
        }

        public Model.MessageShow EditSaveMethod(Model.Rfid_bound data)
        {
            MessageShow msg = new MessageShow();
            if (data.Id <= 0)//The current user already exists
            {
                string insertStr = "INSERT INTO Rfid_tag(werks,zpltn,matnr,exidv,pt,bin,bounded,intime,inbin,tag_id) VALUES(@Code,@Empty_pt,@bin,@Actived,@Created)";
                msg.success = this.SqlExecute<int>(insertStr, data) > 0;
                msg.message = msg.success ? "添加成功" : "添加失败";
            }
            else
            {
                msg.success = this.SqlExecute<int>("UPDATE Rfid_tag SET code=@Code,empty_pt=@Empty_pt,bin=@Bin,actived=@Actived,created=@Created WHERE id=@Id", data) > 0;
                msg.message = msg.success ? "编辑成功" : "编辑失败";
            }
            return msg;
        }

        public List<Rfid_bound> GetTableData(StoreParams storeParams, ref int count)
        {
            throw new NotImplementedException();
        }
    }
}