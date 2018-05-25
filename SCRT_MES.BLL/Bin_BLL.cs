using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Bin_BLL
    {
        private Bin_DAL dal { get; set; }

        public List<PlantStockBin> GetTableData(Model.StoreParams storeParams, ref int count)
        {
            return dal.GetTableData(storeParams, ref count);
        }

        public Model.MessageShow DeleteMethod(string idArray)
        {
            return dal.DeleteMethod(idArray);
        }

        public Model.MessageShow EditSaveMethod(Model.PlantStockBin data)
        {
            return dal.EditSaveMethod(data);
        }

        public List<ComBoxStore> GetComBoxDataStock()
        {
            return dal.GetComBoxDataStock();
        }

        public List<ComBoxStore> GetComBoxDataBin(string inputStockId)
        {
            return dal.GetComBoxDataBin(inputStockId);
        }
    }
}
