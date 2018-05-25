using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ProblemAnalysis_BLL
    {
        private ProblemAnalysis_DAL dal { get; set; }

        public List<Operation> GetProblemAnalysis(int count)
        {
            return dal.GetProblemAnalysis(count);
        }
    }
}