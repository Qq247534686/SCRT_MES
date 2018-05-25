using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMode
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：IMode
     *文件名：  IRfid_bound
     *版本号：  V1.0.0.0
     *唯一标识：b46d37cd-c045-44ad-afff-08394043daf4
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/13 星期一 上午 11:48:46

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/13 星期一 上午 11:48:46
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public interface IRfid_bound
    {
        string Werks { get; set; }//工厂
        string Zpltn { get; set; }//
        string Matnr { get; set; }//
        string Exidv { get; set; }//
        string Bin { get; set; }//
        string Pt { get; set; }//
        int Bounded { get; set; }//
        string Intime { get; set; }//
        int Inbin { get; set; }//
        int Tag_id { get; set; }//标签Id
    }
}