using Factory;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class InventoryBalance_DAL : SqlHelps
    {
        public List<Model.BinMatrnRecord> GetTableData(Model.StoreParams store, ref int count)
        {
            string sqlWhere = AppendWhere(store.obj);
            string order = store.sort + " " + store.dir;
            order = string.IsNullOrEmpty(order.Trim()) ? " recordTime desc " : order;
            count = this.SqlQueryOne<int>("SELECT COUNT(1) FROM binmatrnrecordView WHERE  " + sqlWhere, null);
            string sql = string.Format("select * from binmatrnrecordView  WHERE {0} ORDER BY {1} LIMIT {2},{3}", sqlWhere, order, store.start, store.limit);
            return this.SqlQuery<BinMatrnRecord>(sql, null).ToList();
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
                BinMatrnRecord obj = p as BinMatrnRecord;
                sqlWhere += string.IsNullOrEmpty(obj.Bin) ? "" : " AND bin ='" + obj.Bin + "'";
                sqlWhere += string.IsNullOrEmpty(obj.week) ? "" : " AND week =" + obj.week;
                sqlWhere += string.IsNullOrEmpty(obj.StartTime) ? "" : " AND recordTime>=" + obj.StartTime;
                sqlWhere += string.IsNullOrEmpty(obj.EndTime) ? "" : " AND recordTime<=" + obj.EndTime;
            }
            return sqlWhere;
        }
    }
}