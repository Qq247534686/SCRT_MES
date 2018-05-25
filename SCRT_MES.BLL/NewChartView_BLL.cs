using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class NewChartView_BLL
    {
        private NewChartView_DAL dal = new NewChartView_DAL();

        public List<Model.NewChartView> GetBinStock()
        {
            return dal.GetBinStock();
        }

        public List<Fromtorecord> GetBinStockTransport()
        {
            return dal.GetBinStockTransport();
        }
    }
}
