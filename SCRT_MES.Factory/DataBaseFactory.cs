using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using MySql.Data;
using System.Configuration;
using Dapper;
using MySql.Data.MySqlClient;
using Utilities;

namespace Factory
{
    public class DataBaseFactory
    {
        private DataBaseFactory() { }
        private static DataBaseFactory dbFactory { get; set; }
        private static object seal = new object();
        /// <summary>
        /// 创建数据实例
        /// </summary>
        /// <returns></returns>
        public static IDbConnection GetDataBase()
        {
            string conStr = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;
            IDbConnection connection = (IDbConnection)CallContext.GetData("dbSession");//线程唯一
            try
            {
                if (connection == null)
                {
                    lock (seal)
                    {
                        string DbType = ConfigurationManager.AppSettings["DbType"].ToString();
                        switch (DbType)
                        {
                            case "MYSQL":
                                connection = new MySqlConnection(conStr);
                                break;
                            case "SQLSERVER":
                                connection = new SqlConnection(conStr);
                                break;
                            default: break;
                        }
                       
                      
                        CallContext.SetData("dbSession", connection);
                    }
                }
            }
            catch (SqlException e)
            {
                LogHelper.Error("数据库连接失败", e);
            }
            catch (Exception e)
            {
                LogHelper.Error("数据库其他错误", e);
            }
            return connection;
        }
    }
}
