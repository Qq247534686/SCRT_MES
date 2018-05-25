<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Index</title>
    <link href="../../Content/Css/myCss.css" rel="stylesheet" />
    <style>
        .x-toolbar-default {
            background-color: #d6e6f2;
        }

        .x-progress-default .x-progress-bar-default {
            background-color: #5b90c0;
        }

        #TextField2 .x-form-text-default {
            color: #2a6496;
        }
    </style>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager1" runat="server"></ext:ResourceManager>
    <ext:Store ID="store3" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
        <Model>
            <ext:Model ID="Model3" Name="storeModel" runat="server">
                <Fields>
                    <ext:ModelField Name="Text"></ext:ModelField>
                    <ext:ModelField Name="Value"></ext:ModelField>
                </Fields>
            </ext:Model>
        </Model>
        <Proxy>
            <ext:AjaxProxy Json="true" Url="/BinConfig/GetComBoxDataStock/" SimpleSortMode="true">
                <Reader>
                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                </Reader>
            </ext:AjaxProxy>
        </Proxy>
    </ext:Store>
    <ext:Store ID="store4" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
        <Model>
            <ext:Model ID="Model2" Name="storeModel" runat="server">
                <Fields>
                    <ext:ModelField Name="Text"></ext:ModelField>
                    <ext:ModelField Name="Value"></ext:ModelField>
                </Fields>
            </ext:Model>
        </Model>
        <Proxy>
            <ext:AjaxProxy Json="true" Url="/BinConfig/GetComBoxDataBin" SimpleSortMode="true">
                <Reader>
                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
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
                            <ext:FormPanel runat="server" BodyStyle="background-color: #d6e6f2;" Frame="true" ID="seachForm" Layout="HBoxLayout">
                                <Items>
                                    <ext:ComboBox ID="ComboBox1" LabelWidth="60" Width="180" Name="beLongToId" runat="server" Editable="false" FieldLabel="Stock" EmptyText="搜索Stock" ValueField="Value" StoreID="store3" DisplayField="Text" PaddingSpec="0 0 0 10">
                                        <Listeners>
                                            <Select Fn="StockSelect"></Select>
                                        </Listeners>
                                    </ext:ComboBox>
                                    <ext:ComboBox ID="ComboBox3" LabelWidth="60" Width="180" Name="numberCode" runat="server" Editable="false" FieldLabel="Bin" EmptyText="搜索Bin" ValueField="Value" StoreID="store4" DisplayField="Text" PaddingSpec="0 0 0 10">
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
                            <ext:Button ID="Button1" Icon="Add" UI="Primary" runat="server" Text="新增">
                                <Listeners>
                                    <Click Fn="AddMethod"></Click>
                                </Listeners>
                            </ext:Button>
                            <ext:ToolbarSeparator></ext:ToolbarSeparator>
                            <ext:Button ID="Button3" Icon="Delete" UI="Primary" runat="server" Text="批量删除">
                                <Listeners>
                                    <Click Fn="DeleteMethod"></Click>
                                </Listeners>
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <Store>
                    <ext:Store ID="store1" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
                        <Model>
                            <ext:Model ID="Model1" Name="storeModel" runat="server">
                                <Fields>
                                    <ext:ModelField Name="id"></ext:ModelField>
                                    <ext:ModelField Name="numberCode"></ext:ModelField>
                                    <ext:ModelField Name="beLongToId"></ext:ModelField>
                                </Fields>
                            </ext:Model>
                        </Model>
                        <Proxy>
                            <ext:AjaxProxy Json="true" Url="/BinConfig/GetTableData/" SimpleSortMode="true">
                                <Reader>
                                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                                </Reader>
                            </ext:AjaxProxy>
                        </Proxy>
                    </ext:Store>
                </Store>
                <ColumnModel ID="ColumnModel1" runat="server" EnableColumnHide="false" Flex="2" AnchorHorizontal="100%">
                    <Columns>
                        <ext:Column ID="Column1" Align="Center" Width="120" Hidden="true" DataIndex="id" Text="ID" runat="server" />
                        <ext:Column ID="Column2" Align="Center" Width="150" Hidden="false" DataIndex="numberCode" Text="BinCode" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column3" Align="Center" Width="50" Hidden="true" DataIndex="beLongToId" Text="beLongToId" runat="server" />
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
                    <ext:PagingToolbar ID="PagingToolbar1" StoreID="store1" runat="server">

                        <Plugins>
                            <ext:ProgressBarPager ID="ProgressBarPager1" runat="server" />
                        </Plugins>
                    </ext:PagingToolbar>
                </BottomBar>
            </ext:GridPanel>
        </Items>
    </ext:Viewport>
    <ext:Window runat="server" Title="编辑" Hidden="true" ID="win" Modal="true" Width="270" Height="200">
        <Items>
            <ext:FormPanel PaddingSpec="5 0 0 0" ID="tableDataForm" runat="server" Region="Center" Frame="true" ColumnWidth="1.0" Method="POST">
                <Items>
                    <ext:FieldSet ID="FieldSet2" runat="server" MaxWidth="335" Height="100" ColumnWidth="0.8" Title="编辑信息" MarginSpec="5 8 5 5" ButtonAlign="Right">
                        <Defaults>
                            <ext:Parameter Name="LabelWidth" Value="90" />
                        </Defaults>
                        <Items>
                            <ext:TextField ID="TextField1" Name="id" Hidden="true" runat="server" FieldLabel="编号" />
                            <ext:TextField ID="TextField2" MinWidth="150" EmptyText="请输入Bin" AllowBlank="false" Name="numberCode" runat="server" FieldLabel="Bin" LabelWidth="40">
                            </ext:TextField>
                            <ext:ComboBox ID="ComboBox2" MinWidth="215" LabelWidth="40" Width="180" Name="beLongToId" AllowBlank="false" runat="server" Editable="false" FieldLabel="Stock" EmptyText="选择Stock" ValueField="Value" StoreID="store3" DisplayField="Text">
                            </ext:ComboBox>
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
                            <Click Handler="#{tableDataForm}.reset();#{win}.hide();"></Click>
                        </Listeners>
                    </ext:Button>
                </Items>
            </ext:Toolbar>
        </FooterBar>
    </ext:Window>

    <script type="text/javascript">
        var StockSelect = function (a, b, c) {
            App.ComboBox3.clearValue();
            Ext.Ajax.request({
                url: '/BinConfig/SearchWhereStock',
                params: {
                    stockId: a.lastValue
                },
                success: function (response, options) {
                    App.store4.reload()
                }
            });
        }
        /*表格搜索*/
        var SearchWhere = function (a, b, c) {
            //console.log(App.seachForm.getForm().getValues());
            App.seachForm.submit({
                url: '/BinConfig/SearchWhere',
                submitEmptyText: false,
                method: 'POST',
                success: function () {
                    App.store1.reload();
                },
                failure: function () {

                }
            });
        }
        /*表单验证*/
        var IsValidForm = function (a, b, c) {
            App.Button5.setDisabled(!b);
        }
        /*表格数据的添加方法*/
        var AddMethod = function () {
            App.tableDataForm.reset();
            App.win.setTitle("添加");
            App.win.show();
            App.Button5.setDisabled(true);
        }
        /*表格数据的双击方法*/
        var RowsDbClick = function (a, b, c) {
            App.tableDataForm.loadRecord(b);
            App.win.setTitle("编辑");
            App.win.show();
        }
        /*表格数据的编辑方法*/
        var EditSaveMethod = function () {
            //console.log(App.tableDataForm.getForm().getValues()); return;
            App.tableDataForm.submit({
                url: '/BinConfig/EditSaveMethod',
                submitEmptyText: false,
                waitMsg: '正在保存...',
                method: 'POST',
                success: function (a, b) {
                    App.store1.reload();
                    App.tableDataForm.reset();
                    App.win.hide();
                    Ext.Msg.alert('提示', "操作成功");
                },
                failure: function (a, b, c) {
                    Ext.Msg.alert('提示', "操作失败,该Bin已存在");
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
                idArray += records.selected.items[i].data.id;
                if (length != i + 1)
                    idArray += ",";
            }
            Ext.Msg.confirm('提示', '是否确认删除?', function (btn) {
                if (btn == 'yes') {
                    Ext.Ajax.request({
                        url: "/BinConfig/DeleteMethod/",
                        waitMsg: '正在删除...',
                        params: {
                            idArray: idArray
                        },
                        success: function (response, options) {
                            Ext.Msg.alert('提示', "删除成功");
                            App.store1.reload();
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