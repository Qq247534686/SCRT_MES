using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class CargoConfig
    {
        public int id { get; set; }
        public string rfidKey { get; set; }
        public string action { get; set; }
        public string plantTo { get; set; }
        public string stockLocTo { get; set; }
        public string stockBinTo { get; set; }
        public string plantFrom { get; set; }
        public string stockLocFrom { get; set; }
        public string stockBinFrom { get; set; }
        public string assLine { get; set; }
        public string linePoint { get; set; }
        public string ecp { get; set; }
        public string actionGroup { get; set; } 
    }
}
