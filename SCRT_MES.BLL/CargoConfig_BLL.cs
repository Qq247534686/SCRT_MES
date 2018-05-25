using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
     public class CargoConfig_BLL
    {
         private CargoConfig_DAL dal { get; set; }

         public List<CargoConfig> GetTableData(Model.StoreParams storeParams, ref int count)
        {
            return dal.GetTableData(storeParams, ref count);
        }

        public Model.MessageShow DeleteMethod(string idArray)
        {
            return dal.DeleteMethod(idArray);
        }

        public Model.MessageShow EditSaveMethod(Model.CargoConfig data)
        {
            return dal.EditSaveMethod(data);
        }

        public List<ComBoxStore> GetComBoxPlantToData()
        {
            return dal.GetComBoxPlantToData();
        }

        public List<ComBoxStore> GetComBoxStockToData(string plantCode)
        {
            return dal.GetComBoxStockToData(plantCode);
        }

        public List<ComBoxStore> GetComBoxBinToData(string stockCode)
        {
            return dal.GetComBoxBinToData(stockCode);
        }

        public List<ComBoxStore> GetComBoxPlantFromData()
        {
            return dal.GetComBoxPlantFromData();
        }

        public List<ComBoxStore> GetComBoxStockFromData(string plantCode)
        {
            return dal.GetComBoxStockFromData(plantCode);
        }

        public List<ComBoxStore> GetComBoxBinFromData(string stockCode)
        {
            return dal.GetComBoxBinFromData(stockCode);
        }
    }
}
