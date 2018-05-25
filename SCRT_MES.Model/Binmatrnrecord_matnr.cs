using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Binmatrnrecord_matnr
    {
        public int LatestCount { get; set; }
        public int EarliestCount { get; set; }
        public int MaxCount { get; set; }
        public int MinCount { get; set; }
        private string timeInfo;
        public string TimeInfo
        {
            get { return timeInfo; }
            set { timeInfo =DateTime.Parse(value).ToString("yyyy-MM-dd"); }
        }
    }
}
