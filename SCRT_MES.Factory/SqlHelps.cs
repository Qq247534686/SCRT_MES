using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using Utilities;

namespace Factory
{
    public class SqlHelps : ISqlHelps
    {
        /*备注：提升效率
         COUNT(*)用COUNT(1)代替
         SELECT *用SELECT [...],[...]代替
         */
        private IDbConnection db = DataBaseFactory.GetDataBase();
        public SqlHelps() {}
        public IDbConnection GetDb()
        {
            return db;
        }
        /// <summary>
        /// 执行存储过程
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="procedureName">存储过程名称</param>
        /// <param name="obj">对象</param>
        /// <returns>对象集合</returns>
        public IQueryable<T> SqlProcedure<T>(string procedureName, object obj)
        {
            IQueryable<T> data = null;
            try
            {
                data = db.Query<T>(procedureName, obj, commandType: CommandType.StoredProcedure).AsQueryable();
            }
            catch (SqlException e)
            {
                LogHelper.Error("数据库连接失败", e);
            }
            catch (Exception e)
            {
                LogHelper.Error("其他错误", e);
            }
            return data;
        }
        /// <summary>
        /// 执行存储过程
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="procedureName">存储过程名称</param>
        /// <param name="obj">对象</param>
        /// <returns>对象集合</returns>
        public IQueryable SqlProcedure(string procedureName, object obj)
        {
            IQueryable data = null;
            try
            {
                data = db.Query(procedureName, obj, commandType: CommandType.StoredProcedure).AsQueryable();
            }
            catch (SqlException e)
            {
                LogHelper.Error("数据库连接失败", e);
            }
            catch (Exception e)
            {
                LogHelper.Error("其他错误", e);
            }
            return data;
        }
        /// <summary>
        /// 执行sql语句(增-删-改)
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="sql"></param>
        /// <param name="obj"></param>
        /// <returns></returns>
        public int SqlExecute<T>(string sql, object obj)
        {
            int data = db.Execute(sql, obj);
            return data;
        }
        /// <summary>
        /// 执行存储过程获得数据个数
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="sqlWhere">条件</param>
        /// <returns></returns>
        public int GetCount(string tableName, string sqlWhere)
        {

            int rowsCount = 0;
            sqlWhere = string.IsNullOrEmpty(sqlWhere) ? " 1=1 " : sqlWhere;
            rowsCount = db.Query<int>("getCount", new { tableName = tableName, sqlWhere = sqlWhere }, commandType: CommandType.StoredProcedure).FirstOrDefault();
            return rowsCount;
        }
        /// <summary>
        /// 查询
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="sql"></param>
        /// <param name="obj"></param>
        /// <returns></returns>
        public IQueryable<T> SqlQuery<T>(string sql, object obj)
        {
            IQueryable<T> data = db.Query<T>(sql, obj).AsQueryable();
            return data;
        }
        public T SqlQueryOne<T>(string sql, object obj)
        {
            T data = db.Query<T>(sql, obj).FirstOrDefault();
            return data;
        }
        public void SqlQueryMultiple<T1, T2>(string sql, T1 t1, T2 t2)
        {
            var data = db.QueryMultiple(sql).Read<T1>();
        }
        /// <summary>
        /// 查询个数
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="sql"></param>
        /// <param name="obj"></param>
        /// <returns></returns>
        public int SqlCount(string sql, object obj)
        {
            int count = db.Query<int>(sql, obj).FirstOrDefault();
            return count;
        }
        /// <summary>
        /// 返回表
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="obj"></param>
        /// <param name="com"></param>
        /// <returns></returns>
        public DataTable SqlDataTable(string sql, object obj, CommandType com)
        {
            var data = FillDataTable(db.ExecuteReader(sql, obj, null, null, com));
            return data;
        }
        /// <summary>
        /// 返回数据集
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="obj"></param>
        /// <param name="com"></param>
        /// <returns></returns>
        public DataSet SqlDataSet(string sql, object obj, CommandType com)
        {
            var data = FillDataSet(db.ExecuteReader(sql, obj, null, null, com));
            return data;
        }
        private DataTable FillDataTable(IDataReader reader)
        {
            DataTable dt = new DataTable();
            int fieldCount = reader.FieldCount;
            for (int i = 0; i < fieldCount; i++)
            {
                DataColumn dc = new DataColumn(reader.GetName(i), reader.GetFieldType(i));
                dt.Columns.Add(dc);
            }
            while (reader.Read())
            {
                DataRow dr = dt.NewRow();
                for (int i = 0; i < fieldCount; i++)
                {
                    dr[i] = reader[i];
                }
                dt.Rows.Add(dr);
            }
            return dt;
        }
        private DataSet FillDataSet(IDataReader reader)
        {
            DataSet ds = new DataSet();
            var dt = FillDataTable(reader);
            ds.Tables.Add(dt);
            while (reader.NextResult())
            {
                dt = FillDataTable(reader);
                ds.Tables.Add(dt);
            }

            return ds;
        }

    }
}
