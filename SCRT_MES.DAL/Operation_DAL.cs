using Factory;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Operation_DAL : SqlHelps
    {
        public List<Model.Operation> GetTableData(Model.StoreParams store, ref int count)
        {
            string sqlWhere = AppendWhere(store.obj);
            string order = store.sort + " " + store.dir;
            order = string.IsNullOrEmpty(order.Trim()) ? " id desc " : order;
            count = this.SqlQueryOne<int>("SELECT COUNT(1) FROM operationView WHERE  " + sqlWhere, null);
            string sql = string.Format("select * from operationView  WHERE {0} ORDER BY {1} LIMIT {2},{3}", sqlWhere, order, store.start, store.limit);
            return this.SqlQuery<Operation>(sql, null).ToList();
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
                Operation obj = p as Operation;
                sqlWhere += string.IsNullOrEmpty(obj.rfidKey) ? "" : " AND rfidKey = '" + obj.rfidKey + "'";
                sqlWhere += string.IsNullOrEmpty(obj.plantFrom) ? "" : " AND plantFrom LIKE '%" + obj.plantFrom + "%'";
                sqlWhere += string.IsNullOrEmpty(obj.stockFrom) ? "" : " AND stockFrom LIKE '%" + obj.stockFrom + "%'";
                sqlWhere += string.IsNullOrEmpty(obj.binFrom) ? "" : " AND binFrom LIKE '%" + obj.binFrom + "%'";
                sqlWhere += string.IsNullOrEmpty(obj.exidv) ? "" : " AND exidv LIKE '%" + obj.exidv + "%'";
                sqlWhere += string.IsNullOrEmpty(obj.action) ? "" : " AND action = '" + obj.action + "' ";
                sqlWhere += string.IsNullOrEmpty(obj.StartTime) ? "" : " AND recordTime>=" + obj.StartTime;
                sqlWhere += string.IsNullOrEmpty(obj.EndTime) ? "" : " AND recordTime<=" + obj.EndTime;
                if (obj.processingState == 1)
                {
                    sqlWhere += " AND processingState = 0 ";
                }
                else if (obj.processingState == 2)
                {
                    sqlWhere += " AND processingState = 1 ";
                }
            }
            return sqlWhere;
        }

        public Model.MessageShow DeleteRecord()
        {
            MessageShow msg = new MessageShow();
            msg.success = this.SqlExecute<int>("truncate table operation", null) >= 0;
            msg.message = "删除成功";
            return msg;
        }
    }
}