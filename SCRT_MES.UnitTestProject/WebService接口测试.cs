using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using UnitTestProject.ServiceReference1;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Dynamic;
namespace rfidSystem.UnitTestProject
{
    [TestClass]
    public class UnitTest1
    {
        DataInteractionSoapClient client = new DataInteractionSoapClient();
        static string Code = "A00002";
        [TestMethod]
        public ServerMessage 解绑()
        {
            //Assert.AreEqual(230, 230);

            RfidCollections jsonData = new RfidCollections()
            {
                Code = "A001",
                rfidKey = "SH00-1102-B001---01"
            };
            ;
            return client.DataMethod(jsonData);
        }
        [TestMethod]
        public ServerMessage 绑定()
        {
            RfidCollections jsonData = new RfidCollections()
            {
                Exidv = "001",
                Matnr = "001",
                rfidKey="SH00-1102-B001-SHDPRack01--05",
                Code = Code
            };
            return client.DataMethod(jsonData);
            
        }
        [TestMethod]
        public ServerMessage 消耗()
        {
            RfidCollections jsonData = new RfidCollections()
            {
                  Code = Code,
              rfidKey="SH00-1102-B001-SHDPRack01--02"
              

            };
            return client.DataMethod(jsonData);
        }
        [TestMethod]
        public ServerMessage 取料()
        {
            RfidCollections jsonData = new RfidCollections()
            {
                rfidKey="SH00-1102-B001-SHDPRack01--03",
                Code =Code,
            };
            return client.DataMethod(jsonData);
        }
        [TestMethod]
        public bool 空箱返回()
        {
            RfidCollections jsonData = new RfidCollections()
            {
                Action = "5",
                Empty_pt = "KX001",
                Code = Code,
            };
            client.DataMethod(jsonData);
            return true;
        }
        [TestMethod]
        public void RunTestMethod()
        {

            var msg = 解绑();
            Assert.IsTrue(msg.Code < 1, msg.Msg);
            //Assert.IsTrue(解绑(), "绑定失败");
            //Assert.IsTrue(绑定(), "绑定失败");
            //Assert.IsTrue(消耗(), "消耗失败");
            //Assert.IsTrue(取料(), "取料失败");
            //Assert.IsTrue(空箱返回(), "空箱返回失败");

        }
        //[TestMethod]
        //public void test()
        //{

        //    var p = new { date = DateTime.Now, name = "123" };
        //    string newtonstr = JsonConvert.SerializeObject(p, Formatting.Indented,
        //        new IsoDateTimeConverter() { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" });
        //    Assert.IsNotNull(newtonstr, "PassTest");

        //}
    }
}
