using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Factory
{
    public interface ISqlHelps
    {
        IQueryable<T> SqlProcedure<T>(string procedureName, object obj);
        int SqlExecute<T>(string sql, object obj);
        IQueryable<T> SqlQuery<T>(string sql, object obj);
        T SqlQueryOne<T>(string sql, object obj);
        int SqlCount(string sql, object obj);
        DataTable SqlDataTable(string sql, object obj, CommandType com);
        DataSet SqlDataSet(string sql, object obj, CommandType com);
    }
}
