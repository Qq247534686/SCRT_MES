
/*新增*/
function AddRoles() {
    FormPanel1.reset();
    win1.setTitle('新增');
    TreeIsChecked(false);
    win1.show();

};
/*消除选中的树节点*/
var TreeIsChecked = function (isOk) {
    var selNodes = menuTree.getChecked();
    Ext.each(selNodes, function (node) {
        node.attributes.checked = isOk;
        node.getUI().checkbox.checked = isOk;
    });
};
/*设置选中的树节点*/
var TreeIsSelect = function (root, nodes, isOk) {
    if (root != undefined && nodes.length > 0) {
        root.eachChild(function (node) {
            for (var i = 0; i < nodes.length; i++) {
                if ((node.id + '') == nodes[i]) {
                    node.attributes.checked = isOk;
                    node.getUI().checkbox.checked = isOk;
                }
            }
            if (!node.leaf) {
                TreeIsSelect(node, nodes, isOk);
            }
        });
    }

};
/*双击事件*/
var UpdateUserEntity = function (thisObject, index, record) {
    TreeIsChecked(false);
    win1.setTitle('修改');
    win1.show();
    var data = thisObject.store.data.items[index];
    FormPanel1.getForm().loadRecord(data);
    var treeId = thisObject.store.getAt(index).get('RoleWithTreeID');
    var selectNode = [];
    if (treeId != null && treeId != '') {
        selectNode = treeId.split(",");
    }
    TreeIsSelect(menuTree.getRootNode(), selectNode, true);
};
/*加载树节点*/
var loadNode = function (tree, node, response) {
    var result = response.responseText;
    var rootNode = menuTree.getRootNode();
    var nodes = createNodes(Ext.util.JSON.decode(result).Data);
    if (nodes.length > 0) {
        node.loadNodes(nodes);
    }
    else {
        node.removeChildren();
    }

};
/*创建树节点*/
var createNodes = function (menuNodeList) {
    var nodes = [];
    var count = menuNodeList.length;

    for (var i = 0; i < count; i++) {
        var menuNode = menuNodeList[i];
        var node = {};
        node.checked = false;
        node.id = menuNode.MenuID;
        node.text = menuNode.MenuName;
        node.leaf = menuNode.IsLeaf;
        node.data = menuNode;
        node.url = menuNode.Url;
        node.hidden = menuNode.Hidden;
        node.expanded = menuNode.Expanded;
        if (node.leaf);
        if (menuNode.Children) {
            node.children = createNodes(menuNode.Children);
        }
        nodes.push(node);
    }
    return nodes;
};
var clickMenu = function (node, e) {
    if (node.isLeaf()) {
    }
    e.stopEvent();
};
//文档树父子节点联动
function checkChildNode(node, ch) {
    if (node == undefined) {
        return;
    }
    node.eachChild(function (child) {
        child.getUI().checkbox.checked = ch;
        child.attributes.checked = ch;
        checkChildNode(child, ch);
    });
};
//触发文档树的单击事件
function checkchange(node, checked) {
    if (node.leaf == false) {
        if (checked) {
            checkChildNode(node, checked);
        }
        else {
            checkChildNode(node, checked);
        }

    }
    //alert(node.id);
};
//选中权限表的id
function getTableCheckedID(np) {
    var ids = "";
    var records = GridPanelRelationGroup.getSelectionModel();
    var length = records.selections.items.length;
    for (var i = 0; i < length; i++) {
        ids += records.selections.items[i].data[np];
        if (length != i + 1) {
            ids += ",";
        }
    }
    return ids;
};
//文档树的选中文本
function getTreeCheckedID(np) {
    var msg = "";
    selNodes = menuTree.getChecked();
    Ext.each(selNodes, function (node) {

        if (np == "MenuName") {
            msg += node.text + ',';
        }
        else {
            msg += node.id + ',';
        }
    });
    return msg = (msg.substring(msg.length - 1) == ',') ? msg.substring(0, msg.length - 1) : msg;
};


var btn_search = function () {//搜索
    Ext.Ajax.request({
        url: "/RoleInfo/searchWhere",
        params: {
            RoleName: RoleName_Search.getValue()
        },
        success: function () {
            GridPanelRelationGroup.reload();
        }
    });
}
var resetSearch = function () {//重置
    Ext.Ajax.request({
        url: "/RoleInfo/searchWhere",
        params: {
            RoleName: ""
        },
        success: function () {
            RoleName_Search.setValue('');
            GridPanelRelationGroup.reload();
        }
    });
}
var btn_Save = function () {//保存
    if (!FormPanel1.isValid()) {
        Ext.Msg.alert("提示", "请填写必要信息"); return;
    }
    var data = FormPanel1.getForm().getValues();
    data.RoleWithTreeName = getTreeCheckedID("MenuName");
    data.RoleWithTreeID = getTreeCheckedID("MenuID");
    Ext.Msg.confirm('提示', '是否确认保存?', function (btn) {
        if (btn == 'yes') {
            Ext.Ajax.request({
                url: "/RoleInfo/SaveRoles/",
                params: data,
                success: function (response, options) {
                    GridPanelRelationGroup.reload();
                    win1.hide();
                    Ext.Msg.alert("提示", Ext.util.JSON.decode(response.responseText).message);
                }
            });
        }

    });
}
var btn_Remove = function () {//删除
    var records = GridPanelRelationGroup.getSelectionModel();
    var length = records.selections.items.length;
    if (length == 0) { Ext.Msg.alert("错误", "请选择数据！"); return; }
    Ext.Msg.confirm('提示', '是否确认删除?', function (btn) {
        if (btn == 'yes') {
            var idArray = "";
            for (var i = 0; i < records.selections.items.length; i++) {
                idArray += records.selections.items[i].data["Id"];
                if (length != i + 1)
                    idArray += ",";
            }
            Ext.Ajax.request({
                url: "/RoleInfo/RemoveData/",
                params: {
                    theID: idArray
                },
                success: function (response, options) {
                    GridPanelRelationGroup.reload();
                    Ext.Msg.alert("提示", Ext.util.JSON.decode(response.responseText).message);
                }
            });
        }

    });

}
