using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    /// <summary>
    /// 自定义消息
    /// </summary>
    public class MessageShow
    {
        public bool flag { get; set; }//状态1
        public bool success { get; set; }//状态2
        public string message { get; set; }//消息
        public int stateCode { get; set; }//状态码
        public int id { get; set; }
    }
}
