using Factory;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;

namespace DAL
{
    public class ProblemAnalysis_DAL : SqlHelps
    {
        public List<Operation> GetProblemAnalysis(int count)
        {
            return this.SqlQuery<Operation>("select * from operationview order by recordTime desc limit 0," + count, null).ToList();
        }
    }
}