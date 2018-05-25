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
     *文件名：  Rfid_tag_DAL
     *版本号：  V1.0.0.0
     *唯一标识：2c97e52d-7ffe-4fea-9e39-eae99b2d06af
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/10 星期五 下午 2:22:00

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/10 星期五 下午 2:22:00
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class Rfid_tag_DAL : SqlHelps
    {
        public List<Model.Rfid_tag> GetTableData(Model.StoreParams store, ref int count)
        {
            string sqlWhere = AppendWhere(store.obj);
            string order = store.sort + " " + store.dir;
            order = string.IsNullOrEmpty(order.Trim()) ? " created desc " : order;
            count = this.SqlQueryOne<int>("SELECT COUNT(1) FROM rfid_tagView WHERE  " + sqlWhere, null);
            string sql = string.Format("SELECT * FROM rfid_tagView WHERE {0} ORDER BY {1}  LIMIT {2},{3}", sqlWhere, order, store.start, store.limit);
            return this.SqlQuery<Rfid_tag>(sql, null).ToList();
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
                Rfid_tag obj = p as Rfid_tag;
                sqlWhere += string.IsNullOrEmpty(obj.Code) ? "" : " AND Code LIKE '%" + obj.Code + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.Empty_pt) ? "" : " AND Empty_pt LIKE '%" + obj.Empty_pt + "%' ";
                sqlWhere += obj.Actived <= 0 ? "" : " AND Actived=" + obj.Actived;
                sqlWhere += string.IsNullOrEmpty(obj.StartTime) ? "" : " AND Created>=" + obj.StartTime;
                sqlWhere += string.IsNullOrEmpty(obj.Matnr) ? "" : " AND matnr LIKE '%" + obj.Matnr + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.Exidv) ? "" : " AND exidv LIKE '%" + obj.Exidv + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.BinCode) ? "" : " AND binCode = '" + obj.BinCode + "' ";
                sqlWhere += string.IsNullOrEmpty(obj.tagFirst) ? "" : " AND tagfirst LIKE '%" + obj.tagFirst + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.tagLast) ? "" : " AND taglast LIKE '%" + obj.tagLast + "%' ";
                sqlWhere += string.IsNullOrEmpty(obj.StartTime) ? "" : " AND Created>=" + obj.StartTime;
                sqlWhere += string.IsNullOrEmpty(obj.EndTime) ? "" : " AND Created<=" + obj.EndTime;
            }
            return sqlWhere;
        }

        public Model.MessageShow DeleteMethod(string idArray)
        {
            MessageShow msg = new MessageShow();
            msg.success = this.SqlExecute<int>("DELETE FROM Rfid_tag WHERE id IN(" + idArray + ")", null) > 0;
            msg.message = msg.success ? "删除成功" : "删除失败";
            return msg;
        }

        public Model.MessageShow EditSaveMethod(Model.Rfid_tag data)
        {
            MessageShow msg = new MessageShow();
            if (data.Id <= 0)//The current user already exists
            {
                if (this.SqlCount(string.Format("SELECT COUNT(1) FROM Rfid_tag WHERE Code='{0}'", data.Code), null) > 0)
                {
                    msg.success = false;
                    msg.message = "此标签已存在";
                }
                else
                {
                    string insertStr = "INSERT INTO Rfid_tag(code,empty_pt,actived,created) VALUES(@Code,@Empty_pt,@Actived,@Created)";
                    msg.success = this.SqlExecute<int>(insertStr, data) > 0;
                    msg.message = msg.success ? "添加成功" : "添加失败";
                }
            }
            else
            {
                msg.success = this.SqlExecute<int>("UPDATE Rfid_tag SET code=@Code,empty_pt=@Empty_pt,actived=@Actived,created=@Created WHERE id=@Id", data) > 0;
                msg.message = msg.success ? "编辑成功" : "编辑失败";
            }
            return msg;
        }

        public List<ComBoxStore> GetComBoxDataRfidKey()
        {
            return this.SqlQuery<ComBoxStore>("select rfidKey as Text,rfidKey as Value from rfidinfo", null).ToList();
        }

        public string getCode(string p)
        {
            return this.SqlQueryOne<string>("select tagfirst from rfid_tag where code='" + p + "'", null);
        }
    }
}