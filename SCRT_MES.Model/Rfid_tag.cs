using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMode;

namespace Model
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：Model
     *文件名：  Rfid_tag
     *版本号：  V1.0.0.0
     *唯一标识：87f93961-0b9e-4f46-90bb-c980c3311b9a
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/10 星期五 下午 2:15:33

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/10 星期五 下午 2:15:33
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class Rfid_tag : IRfid_tag
    {
        private string bounded;

        public string Bounded
        {
            get { return bounded; }
            set { bounded = value; }
        }

        private string exidv;

        public string Exidv
        {
            get { return exidv; }
            set { exidv = value; }
        }

        private string numberCount;

        public string NumberCount
        {
            get { return numberCount; }
            set { numberCount = value; }
        }

        private string matnr;

        public string Matnr
        {
            get { return matnr; }
            set { matnr = value; }
        }

        private string binCode;

        public string BinCode
        {
            get { return binCode; }
            set { binCode = value; }
        }

        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        private string code;

        public string Code
        {
            get { return code; }
            set { code = value; }
        }

        private string empty_pt;

        public string Empty_pt
        {
            get { return empty_pt; }
            set { empty_pt = value; }
        }

        private int actived;

        public int Actived
        {
            get { return actived; }
            set { actived = value; }
        }

        private string created;

        public string Created
        {
            get { return created; }
            set { created = string.IsNullOrEmpty(value) ? "" : DateTime.Parse(value).ToString("yyyy-MM-dd HH:mm:ss"); }
        }

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

        public string tagFirst { get; set; }
        public string tagLast { get; set; }
    }
}