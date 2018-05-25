using Factory;
using Model;
using SAP.Middleware.Connector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class SapncoClient
    {
        private RfcDestination _rfcDestination = null;

        /// <summary>
        /// Register Client
        /// </summary>
        public void RegisterRfcDestination()
        {
            try
            {
                if (_rfcDestination == null)
                    _rfcDestination = RfcDestinationManager.GetDestination("NCO_Destination"); //获取 config配置中NCO_Destination节点参数，并注册RfcClient
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// 调用Sap服务器函数
        /// (非IDOC)
        /// </summary>
        /// <param name="orderCode"></param>
        /// <returns></returns>
        public string InvokeRFCFunctionGetCompanyID(string orderCode)
        {
            IRfcFunction function = null;
            string companyID = String.Empty;
            try
            {
                function = _rfcDestination.Repository.CreateFunction("ZRFC_JGM_INFO2");//调用sap函数
                function.SetParameterActive(0, true);
                function.SetValue("VBELN", orderCode);//给函数 ZRFC_JGM_INFO2 传值
                function.Invoke(_rfcDestination);
                IRfcTable tb = function.GetTable("E_TAB"); //获取 ZRFC_JGM_INFO2函数返回的 "E_TAB"表

                foreach (IRfcStructure dr in tb)
                {
                    string orderNumber = dr.GetValue("VBELN").ToString(); //获取表 "E_TAB"结构中 "VBELN" 字段的值
                    if (orderNumber.Equals(orderCode))
                    {
                        companyID = dr.GetValue("KUNNR").ToString();
                        break;
                    }
                }
            }
            catch (RfcBaseException e)
            {
                throw e;
            }
            return companyID;
        }



        /// <summary>
        /// 调用Sap服务器函数
        /// (非IDOC)
        /// </summary>
        /// <param name="orderCode"></param>
        /// <returns></returns>
        /// 
        public SAPLog InvokeRFCFunctionRFID(SAPLog item)
        {
            IRfcFunction function = null;
            
          
            string companyID = String.Empty;
            try
            {
                function = _rfcDestination.Repository.CreateFunction("ZMMF_RFID_WS");//调用sap函数
                function.SetParameterActive(0, true);
                function.SetValue("ZSJNO", item.Zsjno);
                function.SetValue("ZTYPE", item.Ztype);
                function.SetValue("WERKS", item.Werks.ToUpper());
                function.SetValue("ZPLTN", string.IsNullOrEmpty(item.Zpltn) ? item.Zpltn : item.Zpltn.ToUpper());
                function.SetValue("ZPOINT", item.Zpoint);
                function.SetValue("MATNR", item.Matnr);
                function.SetValue("EXIDV", item.Exidv);
                function.SetValue("ZLGORT_ORI", item.ZlgortOri);
                function.SetValue("ZLGORT_TAR", item.ZlgortTar);
                function.SetValue("ERFMG", item.qty);
                function.Invoke(_rfcDestination);
                IRfcTable tb = function.GetTable("GT_OUTPUT"); //获取 ZRFC_JGM_INFO2函数返回的 "E_TAB"表

                foreach (IRfcStructure dr in tb)
                {
                    string ZSJNO = dr.GetValue("ZSJNO").ToString(); //获取表 "E_TAB"结构中 "VBELN" 字段的值
                    string ZTYPE = dr.GetValue("ZTYPE").ToString();
                    item.M_TYPE = dr.GetValue("M_TYPE").ToString();
                    item.M_MESS = dr.GetValue("M_MESS").ToString();
                    //if (orderNumber.Equals(orderCode))
                    //{
                    //    companyID = dr.GetValue("KUNNR").ToString();
                    //    break;
                    //}
                }
            }
            catch (RfcAbapMessageException e)
            {
                item.M_TYPE = e.AbapMessageType.ToString();
                item.M_MESS = e.AbapT100Message;
            }
            return item;
        }

        #region 非IDOC RfcTable 结构
        // [SAP.Middleware.Connector.RfcTable]	
        //{TABLE  [STRUCTURE E_TAB { FIELD KUNNR=0000001000 FIELD NAME1=安徽邦泰医 FIELD ZZDKHID= FIELD ZZDKH= FIELD VBELN=8000000001 FIELD MATNR=000000002015000211 FIELD MAKTX=胞磷胆碱钠氯化钠注射液&100ml:0.5gx80瓶 FIELD CHARG=2013052201 FIELD LFIMG=1.000 FIELD VRKME=KAR }]}	
        #endregion

    }
}
