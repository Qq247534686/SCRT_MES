using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Binmatrnrecord_BLL
    {
        private Binmatrnrecord_DAL dal { get; set; }

        public object GetBinmatrnrecordData(string matrnCode)
        {
           return dal.GetBinmatrnrecordData(matrnCode);
        }

        public List<ComBoxStore> GetComBox()
        {
            return dal.GetComBox();
        }
    }
}
