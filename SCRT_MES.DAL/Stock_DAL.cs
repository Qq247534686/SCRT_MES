using Factory;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Stock_DAL : SqlHelps
    {
        public List<Model.PlantStockBin> GetTableData(Model.StoreParams store, ref int count)
        {
            string sqlWhere = AppendWhere(store.obj);
            string order = store.sort + " " + store.dir;
            order = string.IsNullOrEmpty(order.Trim()) ? " id asc " : order;
            count = this.SqlQueryOne<int>("SELECT COUNT(1) FROM stock WHERE  " + sqlWhere, null);
            string sql = string.Format("SELECT id,stockCode as numberCode,plantId as beLongToId FROM stock WHERE {0} ORDER BY {1}  LIMIT {2},{3}", sqlWhere, order, store.start, store.limit);
            return this.SqlQuery<PlantStockBin>(sql, null).ToList();
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
                PlantStockBin obj = p as PlantStockBin;
                sqlWhere += string.IsNullOrEmpty(obj.numberCode) ? "" : " AND stockCode = '" + obj.numberCode + "' ";
                sqlWhere += obj.beLongToId==0 ? "" : " AND plantId = " + obj.beLongToId;
            }
            return sqlWhere;
        }

        public Model.MessageShow DeleteMethod(string idArray)
        {
            MessageShow msg = new MessageShow();
            msg.success = this.SqlExecute<int>("DELETE FROM stock WHERE id IN(" + idArray + ")", null) > 0;
            msg.message = msg.success ? "删除成功" : "删除失败";
            return msg;
        }

        public Model.MessageShow EditSaveMethod(Model.PlantStockBin data)
        {
            MessageShow msg = new MessageShow();
            if (data.id <= 0)//The current user already exists
            {
                if (this.SqlCount(string.Format("SELECT COUNT(1) FROM stock WHERE stockCode='{0}'", data.numberCode), null) > 0)
                {
                    msg.success = false;
                    msg.message = "此Bin已存在";
                }
                else
                {

                    string insertStr = "INSERT INTO stock(stockCode,plantId) VALUES(@numberCode,@beLongToId)";
                    msg.success = this.SqlExecute<int>(insertStr, data) > 0;
                    msg.message = msg.success ? "添加成功" : "添加失败";
                }
            }
            else
            {
                msg.success = this.SqlExecute<int>("UPDATE stock SET stockCode=@numberCode,plantId=@beLongToId WHERE id=@id", data) > 0;
                msg.message = msg.success ? "编辑成功" : "编辑失败";
            }
            return msg;
        }

        public List<ComBoxStore> GetComBoxDataPlant()
        {
            return this.SqlQuery<ComBoxStore>("select id as Value,plantCode as Text from plant", null).ToList();
        }

        public List<ComBoxStore> GetComBoxDataStock(string inputPlantId)
        {
            var data = new List<ComBoxStore>();
            if (string.IsNullOrEmpty(inputPlantId))
            {
                data = this.SqlQuery<ComBoxStore>("select stockCode as Value,stockCode as Text from stock", null).ToList();
            }
            else
            {
                data = this.SqlQuery<ComBoxStore>("select stockCode as Value,stockCode as Text from stock where plantId=@plantId", new { plantId = inputPlantId }).ToList();
            }
            return data;
        }
    }
}
