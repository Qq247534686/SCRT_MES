using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    /// <summary>
    /// Ext.Net的Store参数对象
    /// </summary>
    public class StoreParams
    {
        public int start { get; set; }
        public int total { get; set; }
        public int limit { get; set; }
        /// <summary>
        /// 排序参数
        /// </summary>
        public string sort { get; set; }
        /// <summary>
        /// 正序或者反序
        /// </summary>
        public string dir { get; set; }
        public object obj { get; set; }
    }
}
