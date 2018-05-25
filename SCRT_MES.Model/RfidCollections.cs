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
     *文件名：  RfidCollections
     *版本号：  V1.0.0.0
     *唯一标识：6c37c2f7-ee9f-4a3a-a8d1-cb0094316dec
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/12 星期日 下午 5:29:09

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/12 星期日 下午 5:29:09
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class RfidCollections //: IRfid_bound, IRfid_tag
    {
        //手持机参数
        private string code;//标签号

        public string Code
        {
            get { return code; }
            set { code = value; }
        }

        private string empty_pt;//空箱位

        public string Empty_pt
        {
            get { return empty_pt; }
            set { empty_pt = value; }
        }

        //RFID参数
        private string action;

        public string Action
        {
            get { return action; }
            set { action = value; }
        }

        private string zpltn;//

        public string Zpltn
        {
            get { return zpltn; }
            set { zpltn = value; }
        }

        private string matnr;//

        public string Matnr
        {
            get { return matnr; }
            set { matnr = value; }
        }

        private string exidv;//

        public string Exidv
        {
            get { return exidv; }
            set { exidv = value; }
        }

        private int tag_id;//标签Id

        public int Tag_id
        {
            get { return tag_id; }
            set { tag_id = value; }
        }

        public string rfidKey { get; set; }
        public int plantTo { get; set; }
        public int stockLocTo { get; set; }
        public int stockBinTo { get; set; }

        public int plantFrom { get; set; }
        public int stockLocFrom { get; set; }
        public int stockBinFrom { get; set; }

        public string assLine { get; set; }
        public string linePoint { get; set; }
        public string ecp { get; set; }
        public string stockFromStr { get; set; }
        public string stockToStr { get; set; }
        public string plantToStr { get; set; }
        public int qty { get; set; }
        public string specialAction { get; set; }

        public int CodeInt { get; set; }
        public string Msg { get; set; }
    }
}