using Factory;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class SAPRecord_DAL : SqlHelps
    {
        public List<Model.SAPRecord> GetTableData(Model.StoreParams store, ref int count)
        {
            string sqlWhere = AppendWhere(store.obj);
            string order = store.sort + " " + store.dir;
            order = string.IsNullOrEmpty(order.Trim()) ? " id desc " : order;
            count = this.SqlQueryOne<int>("SELECT COUNT(1) FROM sap_log WHERE  " + sqlWhere, null);
            string sql = string.Format("select * from sap_log  WHERE {0} ORDER BY {1} LIMIT {2},{3}", sqlWhere, order, store.start, store.limit);
            return this.SqlQuery<SAPRecord>(sql, null).ToList();
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
                SAPRecord obj = p as SAPRecord;
                sqlWhere += string.IsNullOrEmpty(obj.Werks) ? "" : " AND Werks LIKE '%" + obj.Werks + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.Zpltn) ? "" : " AND Zpltn LIKE '%" + obj.Zpltn + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.Matnr) ? "" : " AND Matnr LIKE '%" + obj.Matnr + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.Exidv) ? "" : " AND Exidv LIKE '%" + obj.Exidv + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.ZlgortOri) ? "" : " AND ZlgortOri LIKE '%" + obj.ZlgortOri + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.ZlgortTar) ? "" : " AND ZlgortTar LIKE '%" + obj.ZlgortTar + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.StartTime) ? "" : " AND created>=" + obj.StartTime;
                sqlWhere += string.IsNullOrEmpty(obj.EndTime) ? "" : " AND created<=" + obj.EndTime;
            }
          
            return sqlWhere;
        }
    }
}
