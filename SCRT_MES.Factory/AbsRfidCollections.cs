using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMode;
using Model;

namespace Factory
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：Factory
     *文件名：  AbsRfidCollections
     *版本号：  V1.0.0.0
     *唯一标识：84fb5f6e-0323-44b6-a950-1e85ff63ecf6
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/13 星期一 下午 9:30:11

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/13 星期一 下午 9:30:11
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public abstract class AbsRfidCollections<T> where T : RfidCollections
    {
        protected T data { get; set; }

        public AbsRfidCollections()
        {
        }

        public abstract string EmptyContainer();

        public abstract string TakeOut();

        public abstract string GeneratePull();

        public abstract bool SAPMethod();

        public abstract string TagBundling();

        public abstract string TagUnbundling();

        public abstract string TagIn();

        public abstract string GetAction();

        public abstract string GetERP();

        public abstract RfidCollections GetData();

        public abstract string TagGenerate();

        public abstract string TagPull();
    }
}