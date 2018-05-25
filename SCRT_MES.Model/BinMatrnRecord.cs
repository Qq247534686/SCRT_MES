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
     *文件名：  BinMatrnRecord
     *版本号：  V1.0.0.0
     *唯一标识：54686c7b-35bb-4665-b467-c288c06b82f2
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/18 星期六 下午 2:09:04

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/18 星期六 下午 2:09:04
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class BinMatrnRecord
    {
        public int Id { get; set; }
        public string Bin { get; set; }
        public int MatrnCount { get; set; }
        public string MatrnNumber { get; set; }
        public string RecordTime { get; set; }
        public string week { get; set; }

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