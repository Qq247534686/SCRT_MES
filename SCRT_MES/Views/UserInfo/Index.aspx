<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>用户信息</title>
    <link href="../../Content/Css/myCss.css" rel="stylesheet" />
    <style>
        .x-toolbar-default
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
    <ext:ResourceManager ID="ResourceManager1" runat="server"></ext:ResourceManager>
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
            <ext:GridPanel UI="Primary" ID="GridPanel1" runat="server" ForceFit="true" Region="Center">

                <TopBar>
                    <ext:Toolbar ID="Toolbar1" runat="server">
                        <Items>
                            <ext:FormPanel runat="server" BodyStyle="background-color: #d6e6f2;" ID="seachForm" Layout="HBoxLayout">
                                <Items>
                                    <ext:TextField ID="TextField8" runat="server" Name="UserName" EmptyText="搜索用户名" Width="200" LabelAlign="Left" LabelWidth="60" FieldLabel="用户名">
                                    </ext:TextField>
                                    <ext:ComboBox ID="ComboBox1" LabelWidth="60" Width="180" Name="RoleIdFK" runat="server" Editable="false" FieldLabel="所属角色" EmptyText="搜索所属角色" StoreID="store1" ValueField="Value" DisplayField="Text" PaddingSpec="0 0 0 10">
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
                            <ext:Button ID="Button3" Icon="Delete" runat="server" UI="Primary" Text="批量删除">
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
                            <ext:Model ID="Model1" Name="Model1" runat="server">
                                <Fields>
                                    <ext:ModelField Name="UserID"></ext:ModelField>
                                    <ext:ModelField Name="UserName"></ext:ModelField>
                                    <ext:ModelField Name="UserPassword"></ext:ModelField>
                                    <ext:ModelField Name="RoleIdFK"></ext:ModelField>
                                    <ext:ModelField Name="RoleName"></ext:ModelField>
                                </Fields>
                            </ext:Model>
                        </Model>

                        <Proxy>
                            <ext:AjaxProxy Json="true" Url="/UserInfo/GetTableData/" SimpleSortMode="true">
                                <Reader>
                                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="Model1"></ext:JsonReader>

                                </Reader>
                            </ext:AjaxProxy>
                        </Proxy>
                    </ext:Store>
                </Store>

                <ColumnModel ID="ColumnModel1" runat="server" EnableColumnHide="false" Flex="2" AnchorHorizontal="100%">
                    <Columns>
                        <ext:Column Align="Center" Width="120" ID="Column1" Hidden="true" DataIndex="UserID" Text="ID" runat="server" />
                        <ext:Column Align="Center" Width="100" ID="Column2" Hidden="false" DataIndex="UserName" Text="用户名" runat="server">
                        </ext:Column>
                        <ext:Column Align="Center" Width="100" ID="Column3" Hidden="false" DataIndex="UserPassword" Text="密码" runat="server">
                            <Renderer Fn="hidePassword"></Renderer>
                        </ext:Column>
                        <ext:Column Align="Center" Width="100" ID="Column4" Hidden="true" DataIndex="RoleIdFK" Text="角色ID" runat="server"></ext:Column>
                        <ext:Column Align="Center" Width="100" ID="Column9" Hidden="false" DataIndex="RoleName" Text="角色名称" runat="server">
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
    <ext:Window runat="server" Title="编辑" Hidden="true" ID="win" Modal="true" Width="320" Height="230">
        <Items>
            <ext:FormPanel PaddingSpec="5 0 0 0" ID="tableForm" runat="server" Region="Center" Frame="true" ColumnWidth="1.0" Method="POST">
                <Items>
                    <ext:FieldSet ID="FieldSet1" runat="server" MaxWidth="315" Height="120" ColumnWidth="0.8" Title="用户信息" MarginSpec="5 8 5 5" ButtonAlign="Right">
                        <Defaults>
                            <ext:Parameter Name="LabelWidth" Value="90" />
                        </Defaults>
                        <Items>
                            <ext:TextField ID="TextField1" Name="Id" Hidden="true" runat="server" FieldLabel="编号" />
                            <ext:TextField ID="TextField2" EmptyText="请输入用户名" Icon="UserEdit" AllowBlank="false" IndicatorText="" IndicatorCls="red-text" Name="UserName" runat="server" FieldLabel="用户名">
                            </ext:TextField>
                            <ext:TextField ID="TextField3" InputType="Password" Icon="Key" EmptyText="请输入密码" Name="UserPassword" runat="server" FieldLabel="密码" AllowBlank="false">
                            </ext:TextField>

                            <ext:ComboBox ID="RoleName_Com" Width="265" Icon="UserEarth" DataIndex="RoleIdFK" Name="RoleIdFK" Mode="Local" AllowBlank="false" runat="server" Editable="false" FieldLabel="角色权限" StoreID="Store1" EmptyText="请分配权限" ValueField="Value" DisplayField="Text" />

                        </Items>
                    </ext:FieldSet>
                </Items>
                <Defaults>
                    <ext:Parameter Name="AllowBlank" Value="false" Mode="Raw" />
                    <ext:Parameter Name="MsgTarget" Value="side" />
                </Defaults>
                <Listeners>
                    <ValidityChange Fn="IsValidForm" />
                </Listeners>
            </ext:FormPanel>
        </Items>
        <FooterBar>
            <ext:Toolbar ID="Toolbar2" runat="server">
                <Items>
                    <ext:Button ID="Button5" Icon="Accept" Text="保存" runat="server">
                        <Listeners>
                            <Click Fn="EditSaveMethod"></Click>
                        </Listeners>
                    </ext:Button>
                    <ext:Button ID="Button6" Icon="Cross" Text="取消" runat="server">
                        <Listeners>
                            <Click Handler="#{tableForm}.reset();#{win}.hide();"></Click>
                        </Listeners>
                    </ext:Button>
                </Items>
            </ext:Toolbar>
        </FooterBar>
    </ext:Window>
    <script type="text/javascript">
        /*隐藏密码*/
        var hidePassword = function (value) {
            return "**********";
        }
        /*表格验证*/
        var IsValidForm = function (a, b, c) {
            App.Button5.setDisabled(!b);
        }
        /*表格搜索*/
        var SearchWhere = function (a, b, c) {
            //console.log(App.seachForm.getForm().getValues());
            App.seachForm.submit({
                url: '/UserInfo/SearchWhere',
                submitEmptyText: false,
                method: 'POST',
                success: function () {
                    App.store2.reload();
                },
                failure: function () {

                }
            });
        }
        /*表格双击*/
        var RowsDbClick = function (a, b, c) {
            App.tableForm.loadRecord(b);
            App.win.setTitle("编辑");
            App.win.show();

        }
        /*表格数据的添加方法*/
        var AddMethod = function () {
            App.tableForm.reset();
            App.win.setTitle("新增");
            App.win.show();
            App.Button5.setDisabled(true);
        }
        /*表格数据的编辑方法*/
        var EditSaveMethod = function () {
            App.tableForm.submit({
                url: '/UserInfo/EditSaveMethod',
                submitEmptyText: false,
                waitMsg: '正在保存...',
                method: 'POST',
                success: function (a, b) {
                    App.store2.reload();
                    App.tableForm.reset();
                    App.win.hide();
                    Ext.Msg.alert('提示', "操作成功");
                },
                failure: function (a, b) {
                    Ext.Msg.alert('提示', "操作失败,已存在该用户");
                }
            });
        }
        /*表格数据的删除方法*/
        var DeleteMethod = function () {
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
                        url: "/UserInfo/DeleteMethod",
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
    </script>
</body>
</html>

