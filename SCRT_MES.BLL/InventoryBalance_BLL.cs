using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class InventoryBalance_BLL
    {
        private InventoryBalance_DAL dal { get; set; }

        public List<BinMatrnRecord> GetTableData(Model.StoreParams storeParams, ref int count)
        {
            return dal.GetTableData(storeParams, ref count);
        }
    }
}