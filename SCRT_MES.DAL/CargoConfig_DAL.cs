using Factory;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class CargoConfig_DAL : SqlHelps
    {
        public List<Model.CargoConfig> GetTableData(Model.StoreParams store, ref int count)
        {
            string sqlWhere = AppendWhere(store.obj);
            string order = store.sort + " " + store.dir;
            order = string.IsNullOrEmpty(order.Trim()) ? " id asc " : order;
            count = this.SqlQueryOne<int>("SELECT COUNT(1) FROM rfidinfoView WHERE  " + sqlWhere, null);
            string sql = string.Format("SELECT * FROM rfidinfoView WHERE {0} ORDER BY {1}  LIMIT {2},{3}", sqlWhere, order, store.start, store.limit);
            return this.SqlQuery<CargoConfig>(sql, null).ToList();
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
                CargoConfig obj = p as CargoConfig;
                sqlWhere += string.IsNullOrEmpty(obj.rfidKey) ? "" : " AND rfidKey LIKE '%" + obj.rfidKey + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.action) ? "" : " AND action = '" + obj.action + "' ";
            }
            return sqlWhere;
        }

        public Model.MessageShow DeleteMethod(string idArray)
        {
            MessageShow msg = new MessageShow();
            msg.success = this.SqlExecute<int>("DELETE FROM rfidinfo WHERE id IN(" + idArray + ")", null) > 0;
            msg.message = msg.success ? "删除成功" : "删除失败";
            return msg;
        }

        public Model.MessageShow EditSaveMethod(Model.CargoConfig data)
        {
            MessageShow msg = new MessageShow();
            if (data.id <= 0)//The current user already exists
            {
                if (this.SqlCount(string.Format("SELECT COUNT(1) FROM rfidinfo WHERE rfidKey='{0}'", data.rfidKey), null) > 0)
                {
                    msg.success = false;
                    msg.message = "此标签已存在";
                }
                else
                {
                    string insertStr = "INSERT INTO rfidinfo(rfidKey,action,plantTo,stockLocTo,stockBinTo,plantFrom,stockLocFrom,stockBinFrom,assLine,linePoint,ecp,actionGroup) VALUES(@rfidKey,@action,(select id from plant where plantCode=@plantTo),(select id from stock where stockCode=@stockLocTo),(select id from bin where binCode=@stockBinTo),(select id from plant where plantCode=@plantFrom),(select id from stock where stockCode=@stockLocFrom),(select id from bin where binCode=@stockBinFrom),@assLine,@linePoint,@ecp,@actionGroup)";
                    msg.success = this.SqlExecute<int>(insertStr, data) > 0;
                    msg.message = msg.success ? "添加成功" : "添加失败";
                }
            }
            else
            {
                msg.success = this.SqlExecute<int>("UPDATE rfidinfo SET action=@action,plantTo=(select id from plant where plantCode=@plantTo),stockLocTo=(select id from stock where stockCode=@stockLocTo),stockBinTo=(select id from bin where binCode=@stockBinTo),plantFrom=(select id from plant where plantCode=@plantFrom),stockLocFrom=(select id from stock where stockCode=@stockLocFrom),stockBinFrom=(select id from bin where binCode=@stockBinFrom),assLine=@assLine,linePoint=@linePoint,ecp=@ecp,actionGroup=@actionGroup WHERE id=@Id", data) > 0;
                msg.message = msg.success ? "编辑成功" : "编辑失败";
            }
            return msg;
        }

        public List<ComBoxStore> GetComBoxPlantToData()
        {
            return this.SqlQuery<ComBoxStore>("select plantCode as Value,plantCode as Text from plant", null).ToList();
        }

        public List<ComBoxStore> GetComBoxStockToData(string plantCode)
        {
            var data = new List<ComBoxStore>();
            if (!string.IsNullOrEmpty(plantCode))
            {
                data = this.SqlQuery<ComBoxStore>("select stockCode as Value,stockCode as Text from stock where plantId=(select id from plant where plantCode='" + plantCode + "')", null).ToList();
            }
            else { 
                data=this.SqlQuery<ComBoxStore>("select stockCode as Value,stockCode as Text from stock", null).ToList();
            }
            return data;
        }

        public List<ComBoxStore> GetComBoxBinToData(string stockCode)
        {
            var data = new List<ComBoxStore>();
            if (!string.IsNullOrEmpty(stockCode))
            {
                data = this.SqlQuery<ComBoxStore>("select binCode as Value,binCode as Text from bin where stockId=(select id from stock where stockCode='" + stockCode + "')", null).ToList();
            }
            else
            {
                data = this.SqlQuery<ComBoxStore>("select binCode as Value,binCode as Text from bin", null).ToList();
            }
            return data;
        }
        public List<ComBoxStore> GetComBoxPlantFromData()
        {
            return this.SqlQuery<ComBoxStore>("select plantCode as Value,plantCode as Text from plant", null).ToList();
        }
        public List<ComBoxStore> GetComBoxStockFromData(string plantCode)
        {
            var data = new List<ComBoxStore>();
            if (!string.IsNullOrEmpty(plantCode))
            {
                data = this.SqlQuery<ComBoxStore>("select stockCode as Value,stockCode as Text from stock where plantId=(select id from plant where plantCode='" + plantCode + "')", null).ToList();
            }
            else
            {
                data = this.SqlQuery<ComBoxStore>("select stockCode as Value,stockCode as Text from stock", null).ToList();
            }
            return data;
        }

        public List<ComBoxStore> GetComBoxBinFromData(string stockCode)
        {
            var data = new List<ComBoxStore>();
            if (!string.IsNullOrEmpty(stockCode))
            {
                data = this.SqlQuery<ComBoxStore>("select binCode as Value,binCode as Text from bin where stockId=(select id from stock where stockCode='" + stockCode + "')", null).ToList();
            }
            else
            {
                data = this.SqlQuery<ComBoxStore>("select binCode as Value,binCode as Text from bin", null).ToList();
            }
            return data;
        }
    }
}
