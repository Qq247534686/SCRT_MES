using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Operation
    {
        public int id { get; set; }
        public string rfidKey { get; set; }
        public string action { get; set; }
        public string plantTo { get; set; }
        public string stockTo { get; set; }
        public string binTo { get; set; }
        public string plantFrom { get; set; }
        public string stockFrom { get; set; }
        public string binFrom { get; set; }
        public string matnr { get; set; }
        public string exidv { get; set; }
        public string recordTime { get; set; }
        public int processingState { get; set; }
        public string messageHints { get; set; }
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