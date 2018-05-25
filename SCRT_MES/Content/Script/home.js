//参数设置，若用默认值可以省略以下面代
toastr.options = {
    "closeButton": false, //是否显示关闭按钮
    "debug": false, //是否使用debug模式
    "positionClass": "toast-top-full-width",//弹出窗的位置
    "showDuration": "300",//显示的动画时间
    "hideDuration": "1000",//消失的动画时间
    "timeOut": "3000", //展现时间
    "extendedTimeOut": "1000",//加长展示时间
    "showEasing": "swing",//显示时的动画缓冲方式
    "hideEasing": "linear",//消失时的动画缓冲方式
    "showMethod": "fadeIn",//显示时的动画方式
    "hideMethod": "fadeOut" //消失时的动画方式
};
function GetUserName() {

    //Pace.restart();
    Ext.Ajax.request({
        url: "/Home/GetUserName",
        success: function (response, options) {
            var data = Ext.util.JSON.decode(response.responseText);
            App.userName.setText(data.message);
            App.userNameBox.setValue(data.message);
            App.userIDBox.setValue(data.id);
        }
    });
}
var isOpen = true;
Ext.onReady(function () {
    /*后加载*/
    var btnBg = $('.btnBg');
    btnBg.mousemove(function () {
        btnBg.css({ "background-color": "transparent" });
        $(this).css({ "background-color": "#d4e1eb" });
    }).mouseout(function () {
        btnBg.css({ "background-color": "transparent" });
    });
    App.openAll.addListener('click', function () {
        var openAll=$('#openAll-btnIconEl');
        if(openAll)
        {
            if (isOpen) {
                isOpen = false;
                App.openAll.setText('关闭全屏');
                openAll.removeClass("openAll").addClass("closeAll");
                fullscreen();

            }
            else {
                isOpen = true;
                App.openAll.setText('打开全屏');
                openAll.removeClass("closeAll").addClass("openAll");
                exitFullscreen();

            }
        }
    });
})

function updateDate() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();
    var showTime = year + "-" + AppendLength(month) + "-" + AppendLength(day) + " " + AppendLength(hours) + ":" + AppendLength(minutes) + ":" + AppendLength(seconds) + " " + getWeekday();
    App.clock.setText(showTime);
}
/*长度变为两位*/
function AppendLength(number) {
    return number = parseInt(number) < 10 ? ("0" + number) : number;

}
function getWeekday() {
    var d = new Date();
    var weekday = [" 星期天", " 星期一", " 星期二", " 星期三", " 星期四", " 星期五", " 星期六"];
    return weekday[d.getDay()];
}
function SignOutMethod() {
    Ext.getBody().mask('正在退出', 'x-mask-loading');
    Ext.Ajax.request({
        url: "/Home/SignOut",
        success: function (response, options) {
            Ext.getBody().unmask();//去除MASK 
            var data = Ext.util.JSON.decode(response.responseText)
            if (data.success) {
                window.location.href = "/Login/Index";
            }
            else {
                Ext.Msg.alert("提示", "退出失败");
            }

        }
    });

}
var SignOut = function () {
    Ext.Msg.confirm('提示', '是否确认退出？', function (btn1) {
        if (btn1 == 'yes') {
            SignOutMethod();
        }
    });
}

/*加载子节点*/
var loadNode = function (node, ajaxResponse, ajaxParams) {
    var result = ajaxResponse.responseText;
    var rootNode = App.menuTree.getRootNode();
    var nodes = createNodes(Ext.util.JSON.decode(result));
    if (nodes.length > 0) {
        rootNode.appendChild(nodes[0]);
    }
    else {
        node.removeChildren();
    }

};
/*追加子节点*/
var createNodes = function (menuNodeList) {
    var nodes = [];
    var count = menuNodeList.length;
    for (var i = 0; i < count; i++) {
        var menuNode = menuNodeList[i];
        var node = {};
        node.id = menuNode.MenuID;
        node.text = menuNode.MenuName;
        node.leaf = menuNode.Leaf;
        node.data = menuNode;
        node.url = menuNode.Url;
        node.visible = !menuNode.Hidden;
        node.expanded = menuNode.Expanded;
        if (menuNode.Icon != undefined && menuNode.Icon != '') {
            node.icon = menuNode.Icon;
        }

        if (menuNode.Children) {
            node.children = createNodes(menuNode.Children);
        }
        nodes.push(node);
    }
    return nodes;
}
/*节点的点击事件*/
var nodeClick = function (record, e) {
    e.stopEvent();
    if (record.isLeaf()) {//是否为叶子节点
        e.stopEvent();//禁止触发当前对象的默认事件
        var url = record.get('url');
        if (url == null || url == '') {
            return;
        }
        loadExample(record.get('url'), "tab" + record.getId(), record.get('text'), record.get('icon'));
    }
    else {
        //打开或关闭此父节点
        record[record.isExpanded() ? 'collapse' : 'expand']();
    }
}
/*点击节点添加对应的选项卡*/
var loadExample = function (href, id, title, icon) {
    var tab = App.TabPanel1.getComponent(id);//根据id获得Tab中的子对象
    if (!tab) {
       
        tab = App.TabPanel1.add(new Ext.Panel({
            id: id,
            title: title,
            icon: icon,
            closable: true,
            hideMode: "offsets",
            loader: {
                scripts: true,
                url: href,
                renderer: "frame",
                listeners: {
                    beforeload: function () {
                      
                        //this.target.body.mask("正在加载‘" + title + "’,请稍后...");
                    },
                    load: {
                        fn: function (loader) {
                            //Pace.restart();
                            //this.target.body.unmask();
                        }
                    }
                }
            }
        }));
        Pace.restart();
    }
    App.TabPanel1.setActiveTab(tab);/*选中当前选项卡*/
}
/*更改用户信息*/
var updateUserInfo = function () {
    App.userPasswordBox.setValue('');
    App.inputPassword.setValue('');
    App.confirmPassword.setValue('');
    App.userWin.show();

}
/*表单验证*/
var IsValidForm = function (a, b, c) {
    App.btn_Save.setDisabled(!b);
}
/*保存用户信息*/
var saveUserInfo = function () {
    Ext.Msg.confirm('提示', '是否确认修改？', function (btn1) {
        if (btn1 == 'yes') {
            App.userForm.submit({
                url: '/UserInfo/SaveUserInfo',
                submitEmptyText: false,
                method: 'POST',
                success: function () {
                    toastr.success("修改成功");
                    Ext.Msg.confirm('提示', '修改成功,是否重新登陆？', function (btn2) {
                        if (btn2 == 'yes') {
                            SignOutMethod();
                        }
                    });
                },
                failure: function () {
                    toastr.error("修改失败,原密码不正确");
                }
            });
        }
    })
};
var fullscreen = function () {
    var docElm = document.documentElement;
    //W3C  
    if (docElm.requestFullscreen) {
        docElm.requestFullscreen();
    }
        //FireFox  
    else if (docElm.mozRequestFullScreen) {
        docElm.mozRequestFullScreen();
    }
        //Chrome等  
    else if (docElm.webkitRequestFullScreen) {
        docElm.webkitRequestFullScreen();
    }
        //IE11
    else if (elem.msRequestFullscreen) {
        elem.msRequestFullscreen();
    }
}
var exitFullscreen = function () {
    if (document.exitFullscreen) {
        document.exitFullscreen();
    }
    else if (document.mozCancelFullScreen) {
        document.mozCancelFullScreen();
    }
    else if (document.webkitCancelFullScreen) {
        document.webkitCancelFullScreen();
    }
    else if (document.msExitFullscreen) {
        document.msExitFullscreen();
    }
}
//document.addEventListener("fullscreenchange", function () {
//    alert(document.fullscreen ? "1" : "not ");
//}, false);

//document.addEventListener("mozfullscreenchange", function () {
//    alert(document.mozFullScreen ? "2" : "not ");
//}, false);

//document.addEventListener("webkitfullscreenchange", function () {
//    alert(document.webkitIsFullScreen ? "3" : "not ");
//}, false);
//document.addEventListener("msfullscreenchange", function () {
//    alert(document.msFullscreenElement ? "4" : "not ");
//}, false);
/*=====================================================================
     *修改标记：……&JS*
     *修改时间：2017/10/1 星期三 下午 9:30:16
     *修改人： 李嘉成
     *版本号： V1.0.0.0
     *描述：参考Extjs
     *
     ******************************************************************/

