<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>角色管理</title>
    <link href="../../Content/Css/myCss.css" rel="stylesheet" />
    <style>
        .x-toolbar-default
        {
            background-color: #d6e6f2;
        }

        .x-panel-header-default
        {
            background-color: rgba(249, 249, 249, 0);
        }

        .x-window-header-default-top
        {
            background-color: #d6e6f2;
        }

        .x-progress-default .x-progress-bar-default
        {
            background-color: #5b90c0;
        }
    </style>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager1" runat="server">
    </ext:ResourceManager>
    <ext:Store ID="store1" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
        <Model>
            <ext:Model ID="Model2" Name="Model2" runat="server">
                <Fields>
                    <ext:ModelField Name="Text"></ext:ModelField>
                    <ext:ModelField Name="Value"></ext:ModelField>
                </Fields>
            </ext:Model>
        </Model>
        <Proxy>
            <ext:AjaxProxy Json="true" Url="/RoleInfo/GetAllRolesData/" SimpleSortMode="true">
                <Reader>
                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="Model2"></ext:JsonReader>
                </Reader>
            </ext:AjaxProxy>
        </Proxy>
    </ext:Store>
    <ext:Viewport ID="Viewport1" runat="server" Region="Center" Layout="FitLayout">
        <Items>
            <ext:GridPanel ID="GridPanel1" ForceFit="true" runat="server" Region="Center">
                <TopBar>
                    <ext:Toolbar ID="Toolbar1" runat="server">
                        <Items>
                            <ext:FormPanel runat="server" BodyStyle="background-color: #d6e6f2;" Frame="true" ID="seachForm" Layout="HBoxLayout">
                                <Items>
                                    <ext:ComboBox ID="ComboBox1" LabelWidth="60" Width="180" Name="Id" runat="server" Editable="false" FieldLabel="角色名称" EmptyText="搜索角色名称" StoreID="store1" ValueField="Value" DisplayField="Text" PaddingSpec="0 0 0 10">
                                    </ext:ComboBox>
                                    <ext:Button ID="Button2" Icon="Magnifier" runat="server" Text="搜索" MarginSpec="0 0 0 10">
                                        <Listeners>
                                            <Click Fn="SearchWhere"></Click>
                                        </Listeners>
                                    </ext:Button>
                                    <ext:ToolbarSeparator></ext:ToolbarSeparator>
                                    <ext:Button ID="Button4" Icon="ArrowRefresh" runat="server" Text="重置" MarginSpec="0 0 0 10">
                                        <Listeners>
                                            <Click Handler="#{seachForm}.reset();SearchWhere();"></Click>
                                        </Listeners>
                                    </ext:Button>
                                </Items>
                            </ext:FormPanel>
                            <ext:ToolbarFill ID="ToolbarFill1" runat="server"></ext:ToolbarFill>
                            <ext:Button ID="Button1" Icon="Add" runat="server" UI="Primary" Text="新增">
                                <Listeners>
                                    <Click Fn="AddMethod"></Click>
                                </Listeners>
                            </ext:Button>
                            <ext:ToolbarSeparator></ext:ToolbarSeparator>
                            <ext:Button ID="Button3" Icon="Delete" runat="server" UI="Primary" Text="删除">
                                <Listeners>
                                    <Click Fn="DeleteMethod"></Click>
                                </Listeners>
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <Store>
                    <ext:Store ID="store2" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
                        <Model>
                            <ext:Model ID="Model1" Name="mm" runat="server">
                                <Fields>
                                    <ext:ModelField Name="Id"></ext:ModelField>
                                    <ext:ModelField Name="RoleName"></ext:ModelField>
                                    <ext:ModelField Name="RoleRemarks"></ext:ModelField>
                                    <ext:ModelField Name="RoleWithTreeName"></ext:ModelField>
                                    <ext:ModelField Name="RoleWithTreeID"></ext:ModelField>
                                </Fields>
                            </ext:Model>
                        </Model>
                        <Proxy>
                            <ext:AjaxProxy Json="true" Url="/RoleInfo/GetTableData/" SimpleSortMode="true">
                                <Reader>
                                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="mm"></ext:JsonReader>

                                </Reader>
                            </ext:AjaxProxy>
                        </Proxy>
                    </ext:Store>
                </Store>
                <ColumnModel ID="ColumnModel1" runat="server" EnableColumnHide="false" Flex="2" AnchorHorizontal="100%">
                    <Columns>
                        <ext:Column Align="Center" Width="120" ID="Column1" Hidden="true" DataIndex="Id" Text="ID" runat="server" />
                        <ext:Column Align="Center" Width="150" ID="Column2" Hidden="false" DataIndex="RoleName" Text="角色名称" runat="server">
                        </ext:Column>

                        <ext:Column Align="Center" Width="150" ID="Column3" Hidden="false" DataIndex="RoleRemarks" Text="备注" runat="server" />

                        <ext:Column Align="Center" Width="450" ID="Column9" Hidden="false" DataIndex="RoleWithTreeName" Text="包含的权限" runat="server">
                        </ext:Column>
                    </Columns>
                </ColumnModel>
                <Listeners>
                    <RowDblClick Fn="RowsDbClick"></RowDblClick>
                </Listeners>
                <SelectionModel>
                    <ext:CheckboxSelectionModel ID="CheckboxSelectionModel1" runat="server" Mode="Simple">
                    </ext:CheckboxSelectionModel>
                </SelectionModel>
                <BottomBar>
                    <ext:PagingToolbar ID="PagingToolbar1" StoreID="store2" runat="server">

                        <Plugins>
                            <ext:ProgressBarPager ID="ProgressBarPager1" runat="server" />
                        </Plugins>
                    </ext:PagingToolbar>
                </BottomBar>
            </ext:GridPanel>
        </Items>
    </ext:Viewport>
    <ext:Window ID="win1" Hidden="true" Collapsible="false" Modal="true"
        runat="server"
        Icon="Application"
        Width="700"
        Height="400"
        Border="false"
        Layout="BorderLayout">
        <Items>
            <ext:Panel
                ID="WestPanel" StyleSpec=" border-right-width: 3px; border-right-style:solid;border-right-color:#d6e6f2;"
                runat="server"
                Region="West"
                MinWidth="180"
                Split="false"
                Layout="Fit"
                Width="200"
                BodyPadding="5">
                <Items>
                    <ext:TreePanel
                        UseArrows="true"
                        Frame="false"
                        ID="menuTree2"
                        AutoLoad="true"
                        AutoScroll="true"
                        EnableDD="false"
                        Animate="true"
                        RootVisible="false"
                        runat="server"
                        Scroll="Vertical"
                        Title="菜单权限树"
                        Region="East"
                        MinWidth="160"
                        MaxWidth="400"
                        Collapsible="true">
                        <Root>
                            <ext:Node
                                NodeID="-1"
                                Checked="False"
                                Text="Root"
                                Expanded="true" />
                        </Root>
                        <Listeners>
                            <ItemClick
                                Handler="NodeClick(record,e);">
                            </ItemClick>
                        </Listeners>
                    </ext:TreePanel>
                </Items>
            </ext:Panel>
            <ext:Panel ID="Panel1" runat="server" Layout="Fit" Region="Center" Title="">
                <Items>
                    <ext:FormPanel ID="tableForm" Region="Center" Frame="true" Layout="FormLayout" Padding="10" HideBorders="true" Border="false" runat="server" Title="">
                        <Defaults>
                            <ext:Parameter Name="MsgTarget" Value="side" />
                        </Defaults>
                        <Items>
                            <ext:TextField ID="TextField1" Name="Id" Hidden="true" DataIndex="Id" runat="server" FieldLabel="ID" AnchorHorizontal="90%" />
                            <ext:TextField ID="TextField2" AllowBlank="false" Name="RoleName" ReadOnly="false" DataIndex="RoleName" runat="server" FieldLabel="角色名称" AnchorHorizontal="90%" />
                            <ext:TextField ID="TextField3" Name="RoleRemarks" DataIndex="RoleRemarks" runat="server" FieldLabel="备注" AnchorHorizontal="90%" />
                            <ext:TextArea ID="TextArea1" Name="RoleWithTreeName" ReadOnly="true" Height="200" DataIndex="RoleWithTreeName" runat="server" FieldLabel="包含的权限" AnchorHorizontal="90%" />
                        </Items>
                    </ext:FormPanel>
                </Items>
            </ext:Panel>
        </Items>
        <BottomBar>
            <ext:Toolbar ID="Toolbar2" runat="server">
                <Items>
                    <ext:ToolbarFill ID="ToolbarFill2" runat="server"></ext:ToolbarFill>
                    <ext:Button ID="EditSaveMethod" Icon="Accept" UI="Primary" Text="保存" runat="server">
                        <Listeners>
                            <Click Fn="EditSaveMethod" />
                        </Listeners>
                    </ext:Button>
                    <ext:Button ID="btn_Cross" Icon="Cross" Text="取消" UI="Primary" runat="server">
                        <Listeners>
                            <Click Handler="#{win1}.hide();" />
                        </Listeners>
                    </ext:Button>
                </Items>
            </ext:Toolbar>
        </BottomBar>
    </ext:Window>
    <script type="text/javascript">
        Ext.onReady(function () {
            LoadNode();
        });

        /*表格数据的添加方法*/
        function AddMethod() {
            App.tableForm.reset();
            var selNodes = App.menuTree2.getRootNode();
            NodeIsChecked(selNodes.childNodes, false);
            App.win1.setTitle('新增');
            App.win1.show();

        };

        /*表格数据的编辑方法*/
        var EditSaveMethod = function () {//保存
            var data = App.tableForm.getForm().getValues();
            data.RoleWithTreeName = getTreeCheckedID("MenuName");
            data.RoleWithTreeID = getTreeCheckedID("MenuID");
            Ext.Msg.confirm('提示', '是否确认保存?', function (btn) {
                if (btn == 'yes') {
                    Ext.Ajax.request({
                        url: "/RoleInfo/EditSaveMethod/",
                        params: data,
                        success: function (response, options) {
                            App.store2.reload();
                            App.win1.hide();
                            Ext.Msg.alert("提示", Ext.util.JSON.decode(response.responseText).message);
                        }
                    });
                }
            });
        }

        /*表格数据的删除方法*/
        function DeleteMethod() {
            var records = App.GridPanel1.getSelectionModel();
            var length = records.selected.items.length;
            if (length <= 0) {
                Ext.Msg.alert("提示", "请选择要删除的行");
                return;
            }
            var idArray = "";
            for (var i = 0; i < length; i++) {
                idArray += records.selected.items[i].data.Id;
                if (length != i + 1)
                    idArray += ",";
            }
            Ext.Msg.confirm('提示', '是否确认删除?', function (btn) {
                if (btn == 'yes') {
                    Ext.Ajax.request({
                        url: "/RoleInfo/DeleteMethod",
                        waitMsg: '正在删除...',
                        params: {
                            idArray: idArray
                        },
                        success: function (response, options) {
                            Ext.Msg.alert('提示', "删除成功");
                            App.store2.reload();
                        },
                        failure: function (a, b) {
                            Ext.Msg.alert('提示', "删除失败");
                        }
                    });
                }

            });
        }

        /*表格搜索*/
        var SearchWhere = function () {
            App.seachForm.submit({
                url: '/RoleInfo/SearchWhere',
                submitEmptyText: false,
                //waitMsg: '正在搜索...',
                method: 'POST',
                success: function (a, b) {
                    App.store2.reload();
                },
                failure: function (a, b) {

                }
            });
        }

        /*加载子节点*/
        function LoadNode() {
            Ext.Ajax.request({
                url: "/Home/GetAllMenu",
                success: function (response, options) {
                    if (response.responseText != null && response.responseText != undefined) {
                        var result = Ext.util.JSON.decode(response.responseText);
                        var rootNode = App.menuTree2.getRootNode();
                        var nodes = CreateNodes(result);
                        if (nodes.length > 0) {
                            rootNode.appendChild(nodes[0]);
                        }
                        else {
                            node.removeChildren();
                        }
                    }
                }
            });
        };
        /*追加子节点*/
        var CreateNodes = function (menuNodeList) {
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
                node.icon = menuNode.Icon;
                node.hidden = menuNode.Hidden;
                node.expanded = menuNode.Expanded;
                node.checked = false;
                if (menuNode.Children) {
                    node.children = CreateNodes(menuNode.Children);
                }
                nodes.push(node);
            }
            return nodes;
        }
        /*节点的点击事件*/
        var NodeClick = function (record, e) {
            if (!record.isLeaf()) {//是否为叶子节点
                NodeIsChecked(record, !record.get('checked'));
            }
        }

        /*设置节点是否选中*/
        function NodeIsChecked(node, checked) {
            Ext.each(node, function (node) {
                node.set('checked', checked);
                if (node.childNodes.length > 0) {
                    NodeIsChecked(node.childNodes, checked)
                }
            });
        }
        /*表格双击*/
        var RowsDbClick = function (a, b, c) {
            App.tableForm.loadRecord(b);
            var selectedID = b.data.RoleWithTreeID;
            var selNodes = App.menuTree2.getRootNode();
            NodeIsChecked(selNodes.childNodes, false);
            NodesChecked(selNodes.childNodes, selectedID);
            App.win1.setTitle("编辑");
            App.win1.show();
        }

        function NodesChecked(node, selectedID) {
            Ext.each(node, function (node) {
                for (var i = 0; i < selectedID.split(',').length; i++) {
                    if (node.id == selectedID.split(',')[i]) {
                        node.set('checked', true);
                    }
                }
                if (node.childNodes.length > 0) {
                    NodesChecked(node.childNodes, selectedID)
                }
            });
        }




        /*文档树的选中的文本和ID*/
        function getTreeCheckedID(np) {
            var msg = "";
            var selNodes = App.menuTree2.getChecked();
            Ext.each(selNodes, function (node) {
                if (np == "MenuName") {
                    msg += node.data.text + ',';
                }
                else {
                    msg += node.data.id + ',';
                }
            });
            return msg = (msg.substring(msg.length - 1) == ',') ? msg.substring(0, msg.length - 1) : msg;
        };

    </script>
</body>
</html>

