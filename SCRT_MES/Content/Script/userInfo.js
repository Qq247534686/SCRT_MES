var SaveUserInfo = function () {
   
    var data = FormPanel1.getForm().getValues();
    console.log(data);
    if (!FormPanel1.isValid()) {
        Ext.Msg.alert("提示", "请填写必要信息");
        return;
    }
    data.RoleName = data.RoleName_Com;
    data.RoleInfoFK = data.RoleName_Com_Value;
    Ext.Msg.confirm('提示', '是否确认保存?', function (btn) {
        if (btn == 'yes') {
            Ext.Ajax.request({
                url: "/UserInfo/SaveUserInfo/",
                params: data,
                success: function (response, options) {
                    UserInfoTable.store.reload();
                    win1.hide();
                    Ext.Msg.alert("提示", Ext.util.JSON.decode(response.responseText).message);
                }
            });
        }

    });
}
var btn_Remove = function () {
    var records = UserInfoTable.getSelectionModel();
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
                url: "/UserInfo/RemoveUsersInfo/",
                params: {
                    UserID: idArray
                },
                success: function (response, options) {
                    UserInfoTable.store.reload();
                    Ext.Msg.alert("提示", Ext.util.JSON.decode(response.responseText).message);
                }
            });
        }

    });

}
var UpdateInfoEntity = function (thisObject, index, record) {
    win1.setTitle("修改");
    var data = thisObject.store.data.items[index];
    FormPanel1.getForm().loadRecord(data);
    RoleName_Com.setValue((data.data.RoleInfoFK > 0 ? data.data.RoleInfoFK : ""));
    win1.show();


}
var passWord = function (val) {
    return "*******";
}
var btn_search = function () {
    var RoleName = RoleNameSer.lastSelectionText == null ? "" : RoleNameSer.lastSelectionText;
    Ext.Ajax.request({
        url: "/UserInfo/searchWhere",
        params: {
            UserName: UserName.getValue(), RoleName: RoleName
        },
        success: function () {
            UserInfoStore.reload();
        }
    });
}

var resetSearch = function () {
    Ext.Ajax.request({
        url: "/UserInfo/searchWhere",
        params: {
            UserName: ""
        },
        success: function () {
            RoleNameSer.setValue('');
            UserName.setValue('');
            UserInfoStore.reload();
        }
    });
}