using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    /************************** **************************************************
     * Copyright (c) 2017$registeredorga nization$ All Rights Reserved.
     * CLR 版本： 4.0.30319.42000
     *机器名称：MS-20170310SCAF
     *公司名称：Microsoft
     *命名空间：Model
     *文件名：  SystemMenu
     *版本号：  V1.0.0.0
     *唯一标识：2b768047-831b-45aa-84ee-ed9758938ca2
     *当前的用户域：MS-20170310SCAF
     *创建人：  Administrator
     *电子邮箱：247534686@qq.com
     *创建时间：2017/11/7 星期二 下午 3:46:50

     *描述：
     *
     *=====================================================================
     *修改标记
     *修改时间：2017/11/7 星期二 下午 3:46:50
     *修改人： Administrator
     *版本号： V1.0.0.0
     *描述：
     *
     ************************************* ****************************************/

    public class SystemMenu
    {
        private int menuID;
        private string menuName;
        private int parentID;
        private bool hidden;
        private bool leaf;
        private int nodeLevel;
        private bool expanded;
        private string icon;
        private List<SystemMenu> children;

        public List<SystemMenu> Children
        {
            get { return children; }
            set { children = value; }
        }

        public int MenuID
        {
            get { return menuID; }
            set { menuID = value; }
        }


        public string MenuName
        {
            get { return menuName; }
            set { menuName = value; }
        }


        public int ParentID
        {
            get { return parentID; }
            set { parentID = value; }
        }


        public int NodeLevel
        {
            get { return nodeLevel; }
            set { nodeLevel = value; }
        }


        public bool Leaf
        {
            get { return leaf; }
            set { leaf = value; }
        }


        public bool Hidden
        {
            get { return hidden; }
            set { hidden = value; }
        }

        private string url;
        public string Url
        {
            get { return url; }
            set { url = value; }
        }


        public bool Expanded
        {
            get { return expanded; }
            set { expanded = value; }
        }

        public string Icon
        {
            get { return icon; }
            set { icon = value; }
        }
    }
}
