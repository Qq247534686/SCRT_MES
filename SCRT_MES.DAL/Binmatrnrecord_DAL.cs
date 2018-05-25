using Factory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Dapper;
using System.Dynamic;
namespace DAL
{
    public class Binmatrnrecord_DAL : SqlHelps
    {

        public object GetBinmatrnrecordData(string matrnCode)
        {
            List<object> obj=new List<object>();
            var data=this.SqlProcedure<Binmatrnrecord_matnr>("binMatrnRecord_matnrProcedure", new { matrnCode = matrnCode }).ToList();
            data.ForEach(p=>{
                obj.Add(string.Format("{0},{1},{2},{3},{4}",p.EarliestCount,p.LatestCount,p.MaxCount,p.MinCount,p.TimeInfo));
            
            });
            return obj;
        }

        public List<ComBoxStore> GetComBox()
        {
            var data = this.SqlQuery<ComBoxStore>("SELECT distinct matrn as Text FROM binmatrnrecord_matnr", null).ToList();
            return data;
        }
    }
}
