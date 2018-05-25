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
     *文件名：  Rfid_tag_BLL
     *版本号：  V1.0.0.0
     *唯一标识：68ec2693-604b-46d1-b7db-2d335abb0423
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/10 星期五 下午 2:21:47

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/10 星期五 下午 2:21:47
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class Rfid_tag_BLL
    {
        private Rfid_tag_DAL dal { get; set; }

        public List<Rfid_tag> GetTableData(Model.StoreParams storeParams, ref int count)
        {
            return dal.GetTableData(storeParams, ref count);
        }

        public Model.MessageShow DeleteMethod(string idArray)
        {
            return dal.DeleteMethod(idArray);
        }

        public Model.MessageShow EditSaveMethod(Model.Rfid_tag data)
        {
            return dal.EditSaveMethod(data);
        }

        public List<Model.ComBoxStore> GetComBoxDataRfidKey()
        {
            return dal.GetComBoxDataRfidKey();
        }

        public string getCode(string p)
        {
            return dal.getCode(p);
        }
    }
}