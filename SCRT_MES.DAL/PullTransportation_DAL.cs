using Factory;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class PullTransportation_DAL : SqlHelps
    {
        public List<Model.Fromtorecord> GetTableData(Model.StoreParams store, ref int count)
        {
            string sqlWhere = AppendWhere(store.obj);
            string order = store.sort + " " + store.dir;
            order = string.IsNullOrEmpty(order.Trim()) ? " insertTime desc " : order;
            count = this.SqlQueryOne<int>("SELECT COUNT(1) FROM fromtorecordview WHERE  " + sqlWhere, null);
            string sql = string.Format("select * from fromtorecordview  WHERE {0} ORDER BY {1} LIMIT {2},{3}", sqlWhere, order, store.start, store.limit);
            return this.SqlQuery<Fromtorecord>(sql, null).ToList();
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
                Fromtorecord obj = p as Fromtorecord;
                sqlWhere += string.IsNullOrEmpty(obj.stockBinFrom) ? "" : " AND stockBinFrom = '" + obj.stockBinFrom + "'";
                sqlWhere += string.IsNullOrEmpty(obj.matnr) ? "" : " AND matnr LIKE '%" + obj.matnr + "%'";
                sqlWhere += string.IsNullOrEmpty(obj.linePoint) ? "" : " AND linePoint LIKE '%" + obj.linePoint + "%'";
                sqlWhere += string.IsNullOrEmpty(obj.assLine) ? "" : " AND assLine LIKE '%" + obj.assLine + "%'";
                sqlWhere += string.IsNullOrEmpty(obj.StartTime) ? "" : " AND insertTime>=" + obj.StartTime;
                sqlWhere += string.IsNullOrEmpty(obj.EndTime) ? "" : " AND insertTime<=" + obj.EndTime;
            }
            return sqlWhere;
        }

        public Model.MessageShow DeleteRecord()
        {
            MessageShow msg = new MessageShow();
            msg.success = this.SqlExecute<int>("truncate table fromtorecord", null) >= 0;
            msg.message = "删除成功";
            return msg;
        }
    }
}
