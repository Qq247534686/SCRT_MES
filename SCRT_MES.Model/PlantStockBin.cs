using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class PlantStockBin
    {
        public int id {get;set;}
        public string numberCode { get; set; }
        public int beLongToId { get; set; }
    }
}
