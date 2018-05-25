using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：Model
     *文件名：  FromToRecord
     *版本号：  V1.0.0.0
     *唯一标识：f828708d-5d8f-4da5-a8dc-bd442b2bbac9
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/14 星期二 下午 10:28:39

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/14 星期二 下午 10:28:39
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class TransportPlant
    {
        public int id { get; set; }
        public string stockLocFrom { get; set; }
        public string stockBinFrom { get; set; }
        public string stockLocTo { get; set; }
        public string matnr { get; set; }
        public string assLine { get; set; }
        public string linePoint { get; set; }
        public int totalNumber { get; set; }
      

    }
}
