using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;
namespace Utilities
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：Utilities
     *文件名：  Class1
     *版本号：  V1.0.0.0
     *唯一标识：fdd1f7a6-03d5-4b29-8092-a74aac740f82
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/17 星期五 下午 11:23:05

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/17 星期五 下午 11:23:05
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/
    public class CreateObj
    {
        public static object creatClass(string assembly,string className)
        {
            var ass=Assembly.Load(assembly);
            return ass.CreateInstance(ass.GetType().Namespace + "." + className);
        }
    }
}
