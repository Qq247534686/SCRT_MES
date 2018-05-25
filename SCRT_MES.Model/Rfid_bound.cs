using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMode;
using Newtonsoft.Json;

namespace Model
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：Model
     *文件名：  Rfid_bound
     *版本号：  V1.0.0.0
     *唯一标识：608a641d-e169-474e-a73c-d5d7b6162998
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/10 星期五 下午 5:52:10

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/10 星期五 下午 5:52:10
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class Rfid_bound : IRfid_bound
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        private string werks;

        public string Werks
        {
            get { return werks; }
            set { werks = value; }
        }

        private string zpltn;

        public string Zpltn
        {
            get { return zpltn; }
            set { zpltn = value; }
        }

        private string matnr;

        public string Matnr
        {
            get { return matnr; }
            set { matnr = value; }
        }

        private string exidv;

        public string Exidv
        {
            get { return exidv; }
            set { exidv = value; }
        }

        private string pt;

        public string Pt
        {
            get { return pt; }
            set { pt = value; }
        }

        private string bin;

        public string Bin
        {
            get { return bin; }
            set { bin = value; }
        }

        private int bounded;

        public int Bounded
        {
            get { return bounded; }
            set { bounded = value; }
        }

        private string intime;

        public string Intime
        {
            get { return intime; }
            set { intime = (string.IsNullOrEmpty(value) ? DateTime.Now : DateTime.Parse(value)).ToString("yyyy-MM-dd HH:mm:ss"); }
        }

        private int inbin;

        public int Inbin
        {
            get { return inbin; }
            set { inbin = value; }
        }

        private int tag_id;

        public int Tag_id
        {
            get { return tag_id; }
            set { tag_id = value; }
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
    }
}