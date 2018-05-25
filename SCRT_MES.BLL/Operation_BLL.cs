using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Operation_BLL
    {
        private Operation_DAL dal { get; set; }

        public List<Operation> GetTableData(Model.StoreParams storeParams, ref int count)
        {
            return dal.GetTableData(storeParams, ref count);
        }

        public MessageShow DeleteRecord()
        {
            return dal.DeleteRecord();
        }
    }
}