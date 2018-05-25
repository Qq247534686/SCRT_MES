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
    <ext:Store ID="plantStoreTo" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
        <Model>
            <ext:Model ID="Model3" Name="storeModel" runat="server">
                <Fields>
                    <ext:ModelField Name="Text"></ext:ModelField>
                    <ext:ModelField Name="Value"></ext:ModelField>
                </Fields>
            </ext:Model>
        </Model>
        <Proxy>
            <ext:AjaxProxy Json="true" Url="/CargoConfig/GetComBoxPlantToData/" SimpleSortMode="true">
                <Reader>
                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                </Reader>
            </ext:AjaxProxy>
        </Proxy>
    </ext:Store>
     <ext:Store ID="stockStoreTo" runat="server" AutoLoad="false" PageSize="15" RemoteSort="true" RemoteFilter="true">
        <Model>
            <ext:Model ID="Model2" Name="storeModel" runat="server">
                <Fields>
                    <ext:ModelField Name="Text"></ext:ModelField>
                    <ext:ModelField Name="Value"></ext:ModelField>
                </Fields>
            </ext:Model>
        </Model>
        <Proxy>
            <ext:AjaxProxy Json="true" Url="/CargoConfig/GetComBoxStockToData/" SimpleSortMode="true">
                <Reader>
                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                </Reader>
            </ext:AjaxProxy>
        </Proxy>
    </ext:Store>
     <ext:Store ID="binStoreTo" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
        <Model>
            <ext:Model ID="Model4" Name="storeModel" runat="server">
                <Fields>
                    <ext:ModelField Name="Text"></ext:ModelField>
                    <ext:ModelField Name="Value"></ext:ModelField>
                </Fields>
            </ext:Model>
        </Model>
        <Proxy>
            <ext:AjaxProxy Json="true" Url="/CargoConfig/GetComBoxBinToData/" SimpleSortMode="true">
                <Reader>
                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                </Reader>
            </ext:AjaxProxy>
        </Proxy>
    </ext:Store>

    <ext:Store ID="plantStoreFrom" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
        <Model>
            <ext:Model ID="Model5" Name="storeModel" runat="server">
                <Fields>
                    <ext:ModelField Name="Text"></ext:ModelField>
                    <ext:ModelField Name="Value"></ext:ModelField>
                </Fields>
            </ext:Model>
        </Model>
        <Proxy>
            <ext:AjaxProxy Json="true" Url="/CargoConfig/GetComBoxPlantFromData/" SimpleSortMode="true">
                <Reader>
                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                </Reader>
            </ext:AjaxProxy>
        </Proxy>
    </ext:Store>
     <ext:Store ID="stockStoreFrom" runat="server" AutoLoad="false" PageSize="15" RemoteSort="true" RemoteFilter="true">
        <Model>
            <ext:Model ID="Model6" Name="storeModel" runat="server">
                <Fields>
                    <ext:ModelField Name="Text"></ext:ModelField>
                    <ext:ModelField Name="Value"></ext:ModelField>
                </Fields>
            </ext:Model>
        </Model>
        <Proxy>
            <ext:AjaxProxy Json="true" Url="/CargoConfig/GetComBoxStockFromData/" SimpleSortMode="true">
                <Reader>
                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                </Reader>
            </ext:AjaxProxy>
        </Proxy>
    </ext:Store>
     <ext:Store ID="binStoreFrom" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
        <Model>
            <ext:Model ID="Model7" Name="storeModel" runat="server">
                <Fields>
                    <ext:ModelField Name="Text"></ext:ModelField>
                    <ext:ModelField Name="Value"></ext:ModelField>
                </Fields>
            </ext:Model>
        </Model>
        <Proxy>
            <ext:AjaxProxy Json="true" Url="/CargoConfig/GetComBoxBinFromData/" SimpleSortMode="true">
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
                                    <ext:TextField ID="TextField8" runat="server" Name="rfidKey" EmptyText="搜索rfidKey" Width="150" LabelAlign="Left" LabelWidth="45" FieldLabel="rfidKey">
                                    </ext:TextField>
                                    <ext:ComboBox ID="ComboBox1" LabelWidth="60" Width="180" Name="action" runat="server" Editable="false" FieldLabel="Action" EmptyText="搜索Action" ValueField="Value" DisplayField="Text" PaddingSpec="0 0 0 10">
                                        <Items>
                                            <ext:ListItem Text="IN-UNBIND" Value="IN-UNBIND"></ext:ListItem>
                                            <ext:ListItem Text="OUT" Value="OUT"></ext:ListItem>
                                            <ext:ListItem Text="FEED" Value="FEED"></ext:ListItem>
                                            <ext:ListItem Text="U-OUT" Value="U-OUT"></ext:ListItem>
                                            <ext:ListItem Text="IN" Value="IN"></ext:ListItem>
                                            <ext:ListItem Text="131 BIND" Value="131 BIND"></ext:ListItem>
                                            <ext:ListItem Text="BIND" Value="BIND"></ext:ListItem>
                                        </Items>
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
                                    <ext:ModelField Name="rfidKey"></ext:ModelField>
                                    <ext:ModelField Name="action"></ext:ModelField>
                                    <ext:ModelField Name="plantTo"></ext:ModelField>
                                    <ext:ModelField Name="stockLocTo"></ext:ModelField>
                                    <ext:ModelField Name="stockBinTo"></ext:ModelField>
                                    <ext:ModelField Name="plantFrom"></ext:ModelField>
                                    <ext:ModelField Name="stockLocFrom"></ext:ModelField>
                                    <ext:ModelField Name="stockBinFrom"></ext:ModelField>
                                    <ext:ModelField Name="assLine"></ext:ModelField>
                                    <ext:ModelField Name="linePoint"></ext:ModelField>
                                    <ext:ModelField Name="ecp"></ext:ModelField>
                                    <ext:ModelField Name="actionGroup"></ext:ModelField>
                                </Fields>
                            </ext:Model>
                        </Model>
                        <Proxy>
                            <ext:AjaxProxy Json="true" Url="/CargoConfig/GetTableData/" SimpleSortMode="true">
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
                        <ext:Column ID="Column2" Align="Center" Width="350" Hidden="false" DataIndex="rfidKey" Text="rfidKey" runat="server" />
                        <ext:Column ID="Column3" Align="Center" Width="150" Hidden="false" DataIndex="action" Text="action" runat="server" />
                        <ext:Column ID="Column4" Align="Center" Width="150" Hidden="false" DataIndex="plantTo" Text="plantTo" runat="server" />
                        <ext:Column ID="Column5" Align="Center" Width="150" Hidden="false" DataIndex="stockLocTo" Text="stockLocTo" runat="server" />
                        <ext:Column ID="Column6" Align="Center" Width="150" Hidden="false" DataIndex="stockBinTo" Text="stockBinTo" runat="server" />
                        <ext:Column ID="Column7" Align="Center" Width="150" Hidden="false" DataIndex="plantFrom" Text="plantFrom" runat="server" />
                        <ext:Column ID="Column8" Align="Center" Width="150" Hidden="false" DataIndex="stockLocFrom" Text="stockLocFrom" runat="server" />
                        <ext:Column ID="Column9" Align="Center" Width="150" Hidden="false" DataIndex="stockBinFrom" Text="stockBinFrom" runat="server" />
                        <ext:Column ID="Column10" Align="Center" Width="200" Hidden="false" DataIndex="assLine" Text="assLine" runat="server" />
                        <ext:Column ID="Column11" Align="Center" Width="150" Hidden="false" DataIndex="linePoint" Text="linePoint" runat="server" />
                        <ext:Column ID="Column12" Align="Center" Width="150" Hidden="false" DataIndex="ecp" Text="ecp" runat="server" />
                        <ext:Column ID="Column13" Align="Center" Width="150" Hidden="false" DataIndex="actionGroup" Text="actionGroup" runat="server" />
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
    <ext:Window runat="server" Title="编辑" Hidden="true" ID="win" Modal="true" Width="580" Height="300">
        <Items>
            <ext:FormPanel PaddingSpec="5 0 0 0" ID="tableDataForm" runat="server" Region="Center" Frame="true" ColumnWidth="1.0" Method="POST">
                <Items>
                    <ext:FieldSet ID="FieldSet2" runat="server" MaxWidth="550" Height="200" Layout="ColumnLayout" Title="编辑信息" MarginSpec="5 5 5 12" ButtonAlign="Right">
                        <Defaults>
                            <ext:Parameter Name="LabelWidth" Value="90" />
                        </Defaults>
                        <Items>

                            <ext:Panel ID="Panel1" runat="server" ColumnWidth="0.5">
                                <Items>
                                    <ext:TextField ID="TextField1" Name="id" Hidden="true" runat="server" FieldLabel="编号" />
                                    <ext:TextField ID="TextField2" Width="235" EmptyText="请输入Plant" AllowBlank="false" Name="rfidKey" runat="server" FieldLabel="rfidKey" LabelWidth="80">
                                    </ext:TextField>
                                    <ext:TextField ID="TextField3" Width="235" EmptyText="请输入ecp" Name="ecp" runat="server" FieldLabel="ecp" LabelWidth="80">
                                    </ext:TextField>
                                   <ext:ComboBox ID="ComboBox2" LabelWidth="80" Width="235" Name="action" AllowBlank="false" runat="server" Editable="false" FieldLabel="Action" EmptyText="选择Action" ValueField="Value" DisplayField="Text">
                                        <Items>
                                            <ext:ListItem Text="IN-UNBIND" Value="IN-UNBIND"></ext:ListItem>
                                            <ext:ListItem Text="OUT" Value="OUT"></ext:ListItem>
                                            <ext:ListItem Text="FEED" Value="FEED"></ext:ListItem>
                                            <ext:ListItem Text="U-OUT" Value="U-OUT"></ext:ListItem>
                                            <ext:ListItem Text="OUT" Value="OUT"></ext:ListItem>
                                            <ext:ListItem Text="IN" Value="IN"></ext:ListItem>
                                            <ext:ListItem Text="131 BIND" Value="131 BIND"></ext:ListItem>
                                            <ext:ListItem Text="BIND" Value="BIND"></ext:ListItem>
                                        </Items>
                                    </ext:ComboBox>
                                     <ext:ComboBox ID="ComboBox3" LabelWidth="80"  runat="server" Editable="false" QueryMode="Local" TriggerAction="All" FireSelectOnLoad="true" Width="235" Name="plantTo" AllowBlank="false" FieldLabel="plantTo" EmptyText="选择plantTo" ValueField="Value" DisplayField="Text" StoreID="plantStoreTo">
                                         <Listeners>
                                            <Select Fn="PlantToSelect"></Select>
                                         </Listeners>
                                    </ext:ComboBox>
                                      <ext:ComboBox ID="ComboBox4" LabelWidth="80" Width="235"  Name="stockLocTo" AllowBlank="false" runat="server" Editable="false" FieldLabel="stockLocTo" AutoDataBind="true" AutoShow="true" EmptyText="选择stockLocTo" ValueField="Value" Enabled="true" DisplayField="Text" StoreID="stockStoreTo">
                                           <Listeners>
                                            <Select Fn="StockToSelect"></Select>
                                         </Listeners>
                                    </ext:ComboBox>
                                      <ext:ComboBox ID="ComboBox5" LabelWidth="80" Width="235" Name="stockBinTo" AllowBlank="false" runat="server" Editable="false" FieldLabel="stockBinTo" EmptyText="选择stockBinTo" ValueField="Value" DisplayField="Text" StoreID="binStoreTo">
                                    </ext:ComboBox>
                                </Items>
                            </ext:Panel>
                            <ext:Panel ID="Panel2" runat="server" ColumnWidth="0.45">
                                <Items>
                                       <ext:TextField ID="TextField6" Width="235" EmptyText="请输入actionGroup" AllowBlank="false" Name="actionGroup" runat="server" FieldLabel="actionGroup" LabelWidth="80">
                                    </ext:TextField>
                                    <ext:TextField ID="TextField4" Width="235" EmptyText="请输入assLine"  Name="assLine" runat="server" FieldLabel="assLine" LabelWidth="80">
                                    </ext:TextField>
                                    <ext:TextField ID="TextField5" Width="235" EmptyText="请输入linePoint"  Name="linePoint" runat="server" FieldLabel="linePoint" LabelWidth="80">
                                    </ext:TextField>
                                      <ext:ComboBox ID="ComboBox6" LabelWidth="80" Width="235" Name="plantFrom" AllowBlank="false" runat="server" Editable="false" FieldLabel="plantFrom" EmptyText="选择plantFrom" ValueField="Value" DisplayField="Text" StoreID="plantStoreFrom">
                                           <Listeners>
                                            <Select Fn="PlantFromSelect"></Select>
                                         </Listeners>
                                    </ext:ComboBox>
                                      <ext:ComboBox ID="ComboBox7" LabelWidth="80" Width="235" Name="stockLocFrom" AllowBlank="false" runat="server" Editable="false" FieldLabel="stockLocFrom" EmptyText="选择stockLocFrom" ValueField="Value" DisplayField="Text" StoreID="stockStoreFrom">
                                            <Listeners>
                                            <Select Fn="StockFromSelect"></Select>
                                         </Listeners>
                                    </ext:ComboBox>
                                      <ext:ComboBox ID="ComboBox8" LabelWidth="80" Width="235" Name="stockBinFrom" AllowBlank="false" runat="server" Editable="false" FieldLabel="stockBinFrom" EmptyText="选择stockBinFrom" ValueField="Value" DisplayField="Text" StoreID="binStoreFrom">
                                    </ext:ComboBox>
                                </Items>
                            </ext:Panel>
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
        var route = "/CargoConfig/";
        var PlantToSelect = function (a, b, c) {
            App.ComboBox4.clearValue();
            Ext.Ajax.request({
                url: "/CargoConfig/LockPlantTo",
                params: {
                    plantToStr: a.lastValue
                },
                success: function (response, options) {
                    App.stockStoreTo.reload()
                }
            });
        }
        var StockToSelect = function (a, b, c) {
            App.ComboBox5.clearValue();
            Ext.Ajax.request({
                url: "/CargoConfig/LockStockTo",
                params: {
                    stockToStr: a.lastValue
                },
                success: function (response, options) {
                    App.binStoreTo.reload()
                }
            });

        }

        var PlantFromSelect = function (a, b, c) {
            App.ComboBox7.clearValue();
            Ext.Ajax.request({
                url: "/CargoConfig/LockPlantFrom",
                params: {
                    plantFromStr: a.lastValue
                },
                success: function (response, options) {
                    App.stockStoreFrom.reload()
                }
            });
        }
        var StockFromSelect = function (a, b, c) {
            App.ComboBox8.clearValue();
            Ext.Ajax.request({
                url: "/CargoConfig/LockStockFrom",
                params: {
                    stockFromStr: a.lastValue
                },
                success: function (response, options) {
                    App.binStoreFrom.reload()
                }
            });

        }
        /*表格搜索*/
        var SearchWhere = function (a, b, c) {
            //console.log(App.seachForm.getForm().getValues());
            App.seachForm.submit({
                url: route + 'SearchWhere',
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
            Ext.Ajax.request({
                url: "/CargoConfig/LockStockFrom",
                params: {
                    stockFromStr: ''
                },
                success: function (response, options) {
                    App.binStoreFrom.reload()
                }
            });
            Ext.Ajax.request({
                url: "/CargoConfig/LockPlantFrom",
                params: {
                    plantFromStr: ''
                },
                success: function (response, options) {
                    App.stockStoreFrom.reload()
                }
            });
            Ext.Ajax.request({
                url: "/CargoConfig/LockPlantTo",
                params: {
                    plantToStr:''
                },
                success: function (response, options) {
                    App.stockStoreTo.reload()
                }
            });
            Ext.Ajax.request({
                url: "/CargoConfig/LockStockTo",
                params: {
                    stockToStr: ''
                },
                success: function (response, options) {
                    App.binStoreTo.reload()
                }
            });
            App.tableDataForm.loadRecord(b);
            App.win.setTitle("编辑");
            App.win.show();
        }
        /*表格数据的编辑方法*/
        var EditSaveMethod = function () {
            //console.log(App.ComboBox3);
            //console.log(App.tableDataForm.getForm().getValues()); return;
            App.tableDataForm.submit({
                url: route + 'EditSaveMethod',
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
                    Ext.Msg.alert('提示', "操作失败,该rfidKey已存在");
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
                        url: route + "DeleteMethod",
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

