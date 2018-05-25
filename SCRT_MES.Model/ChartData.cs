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
     *文件名：  ChartData
     *版本号：  V1.0.0.0
     *唯一标识：8239ccfc-819b-4288-b4e2-ca1b022f329a
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/18 星期六 下午 2:40:29

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/18 星期六 下午 2:40:29
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class ChartData
    {
        public string bin { get; set; }
        public List<ChartLegendXY> data { get; set; }
    }
    public class ChartLegendXY
    {
        public string Legend { get; set; }
        public List<string> X { get; set; }
        public List<int> Y { get; set; }
    }
}
