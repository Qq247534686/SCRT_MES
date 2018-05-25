using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Fromtorecord
    {
        public int id { get; set; }
        public string stockLocFrom { get; set; }
        public string stockBinFrom { get; set; }
        public string stockLocTo { get; set; }
        public string linePoint { get; set; }
        public string assLine { get; set; }
        public string matnr { get; set; }
        public string insertTime { get; set; }
        private string startTime;

        public string StartTime
        {
            get { return startTime; }
            set { startTime = string.IsNullOrEmpty(value) ? "" : "'" + DateTime.Parse(value).ToString("yyyy-MM-dd HH:mm:ss") + "'"; }
        }

        private string endTime;

        public string EndTime
        {
            get { return endTime; }
            set { endTime = string.IsNullOrEmpty(value) ? "" : "'" + DateTime.Parse(value).ToString("yyyy-MM-dd HH:mm:ss") + "'"; }
        }
    }
}
