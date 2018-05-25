using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class SAPRecord
    {
        public int id { get; set; }
        public string Zsjno { get; set; }
        public string Ztype { get; set; }
        public string Werks { get; set; }
        public string Zpltn { get; set; }
        public string Zpoint { get; set; }
        public string Matnr { get; set; }
        public string Exidv { get; set; }
        public string ZlgortOri { get; set; }
        public string ZlgortTar { get; set; }
        public string qty { get; set; }
        public string Created { get; set; }
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
