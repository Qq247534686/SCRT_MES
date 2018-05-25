using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Model;

namespace BLL
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：BLL
     *文件名：  DataInteraction_BLL
     *版本号：  V1.0.0.0
     *唯一标识：46dedc57-9441-4955-833d-56335ba51986
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/12 星期日 下午 5:19:04

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/12 星期日 下午 5:19:04
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class DataInteraction_BLL
    {
        private DataInteraction_DAL dal = new DataInteraction_DAL();


        public ServerMessage DataMethod(RfidCollections data, ref string action)
        {
            return dal.DataMethod(data, ref action);
        }

        public ServerMessage GetAction(string code)
        {
            return dal.GetAction(code);
        }

        public ServerMessage InsertOrUpdateTag(Rfid_tag tag)
        {
            return dal.InsertOrUpdateTag(tag);
        }



        public RfidCollections whereRfidCollections(string p)
        {
            return dal.whereRfidCollections(p);
        }

        public string whereBinCode(int p)
        {
            return dal.whereBinCode(p);
        }
    }
}
