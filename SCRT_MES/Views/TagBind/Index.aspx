<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
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
    </style>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager1" runat="server"></ext:ResourceManager>
     <ext:Store ID="store6" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
        <Model>
            <ext:Model ID="Model6" Name="storeModel" runat="server">
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
                    <ext:Toolbar ID="Toolbar1" runat="server" AutoScroll="true">
                        <Items>
                            <ext:FormPanel runat="server" BodyStyle="background-color: #d6e6f2;" Frame="true" ID="seachForm" Layout="HBoxLayout">
                                <Items>
                                    <ext:ComboBox ID="ComboBox2" LabelWidth="35" Width="130" Name="Werks" runat="server" Editable="false" FieldLabel="工厂" EmptyText="搜索工厂" ValueField="Text" DisplayField="Text">
                                        <Store>
                                            <ext:Store ID="store5" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
                                                <Model>
                                                    <ext:Model ID="Model5" Name="storeModel" runat="server">
                                                        <Fields>
                                                            <ext:ModelField Name="Text"></ext:ModelField>
                                                            <ext:ModelField Name="Value"></ext:ModelField>
                                                        </Fields>
                                                    </ext:Model>
                                                </Model>
                                                <Proxy>
                                                    <ext:AjaxProxy Json="true" Url="/Plant/GetComBoxDataPlant/" SimpleSortMode="true">
                                                        <Reader>
                                                            <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                                                        </Reader>
                                                    </ext:AjaxProxy>
                                                </Proxy>
                                            </ext:Store>
                                        </Store>
                                    </ext:ComboBox>
                                      <ext:ComboBox ID="ComboBox5" LabelWidth="50" Width="150" Name="Pt" runat="server" Editable="false" FieldLabel="库位" EmptyText="搜索库位" ValueField="Text" DisplayField="Text" PaddingSpec="0 0 0 10">
                                        <Store>
                                            <ext:Store ID="store7" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
                                                <Model>
                                                    <ext:Model ID="Model7" Name="storeModel" runat="server">
                                                        <Fields>
                                                            <ext:ModelField Name="Text"></ext:ModelField>
                                                            <ext:ModelField Name="Value"></ext:ModelField>
                                                        </Fields>
                                                    </ext:Model>
                                                </Model>
                                                <Proxy>
                                                    <ext:AjaxProxy Json="true" Url="/Stock/GetComBoxDataStock/" SimpleSortMode="true">
                                                        <Reader>
                                                            <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                                                        </Reader>
                                                    </ext:AjaxProxy>
                                                </Proxy>
                                            </ext:Store>
                                        </Store>
                                    </ext:ComboBox>
                                    <ext:ToolbarSeparator Width="10"></ext:ToolbarSeparator>
                                    <ext:TextField ID="TextField10" runat="server" Name="Matnr" EmptyText="搜索物料编号" Width="150" LabelAlign="Left" LabelWidth="60" FieldLabel="物料编号">
                                    </ext:TextField>
                                    <ext:TextField ID="TextField5" runat="server" Name="Exidv" EmptyText="搜索SKU" Width="130" LabelAlign="Left" LabelWidth="35" FieldLabel="SKU" PaddingSpec="0 0 0 10">
                                    </ext:TextField>
                                   <ext:ComboBox ID="ComboBox3" LabelWidth="30" Width="120" Name="Bin" runat="server" Editable="false" FieldLabel="Bin" EmptyText="搜索Bin" ValueField="Text" StoreID="store6" DisplayField="Text" PaddingSpec="0 0 0 5"></ext:ComboBox>
                                    <ext:DateField ID="DateField1" Hidden="true" LabelWidth="60" Width="190" runat="server" Name="StartTime" Format="Y-M-d H:i:s" SubmitFormat="Y-M-d HH:i:s" FieldLabel="入库日期" EmptyText="请选择开始日期" PaddingSpec="0 0 0 10"></ext:DateField>
                                    <ext:DateField ID="DateField2" Hidden="true" LabelWidth="10" Width="140" runat="server" Name="EndTime" Format="Y-M-d H:i:s" SubmitFormat="Y-M-d HH:i:s" FieldLabel="至" EmptyText="请选择结束日期"></ext:DateField>
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
                            <ext:ToolbarSeparator></ext:ToolbarSeparator>
                            <ext:Button ID="Button3" Icon="Delete" Hidden="true" UI="Primary" runat="server" Text="批量删除">
                                <Listeners>
                                    <Click Fn="DeleteMethod"></Click>
                                </Listeners>
                            </ext:Button>
                             <ext:ToolbarFill ID="ToolbarFill2" runat="server"></ext:ToolbarFill>
                            <ext:Button ID="Button5" Icon="Delete" UI="Primary" runat="server" Text="批量删除">
                                <Listeners>
                                    <Click Fn="DeleteMethod"></Click>
                                </Listeners>
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <Store>
                    <ext:Store ID="store1" runat="server" AutoLoad="true" PageSize="25" RemoteSort="true" RemoteFilter="false">
                        <Model>
                            <ext:Model ID="Model1" Name="storeModel" runat="server">
                                <Fields>
                                    <ext:ModelField Name="Id"></ext:ModelField>
                                    <ext:ModelField Name="Werks"></ext:ModelField>
                                    <ext:ModelField Name="Zpltn"></ext:ModelField>
                                    <ext:ModelField Name="Matnr"></ext:ModelField>
                                    <ext:ModelField Name="Exidv"></ext:ModelField>
                                    <ext:ModelField Name="Pt"></ext:ModelField>
                                    <ext:ModelField Name="Bin"></ext:ModelField>
                                    <ext:ModelField Name="Bounded" Type="Int"></ext:ModelField>
                                    <ext:ModelField Name="Inbin" Type="Int"></ext:ModelField>
                                    <ext:ModelField Name="Tag_id" Type="Int"></ext:ModelField>
                                    <ext:ModelField Name="Intime" DateFormat="Y-M-d HH:i:s" Type="Date"></ext:ModelField>
                                </Fields>
                            </ext:Model>
                        </Model>
                        <Listeners>
                            <Load Fn="StoreBeforeLoad"></Load>
                        </Listeners>
                        <Proxy>
                            <ext:AjaxProxy Json="true" Url="/TagBind/GetTableData/" SimpleSortMode="true">
                                <Reader>
                                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                                </Reader>
                            </ext:AjaxProxy>
                        </Proxy>
                    </ext:Store>
                </Store>
                <ColumnModel ID="ColumnModel1" runat="server" EnableColumnHide="false" Flex="2" AnchorHorizontal="100%">
                    <Columns>
                        <ext:Column ID="Column1" Align="Center" Width="120" Hidden="true" DataIndex="Id" Text="ID" runat="server" />
                        <ext:Column ID="Column10" Align="Center" Width="50" Hidden="true" DataIndex="Tag_id" Text="关联RFID_TAG中的ID" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column2" Align="Center" Width="50" Hidden="false" DataIndex="Werks" Text="工厂" runat="server">
                            <Items>
                                <ext:ComboBox
                                    ID="ComboBoxWerks" Hidden="true"
                                    runat="server"
                                    Icon="Magnifier"
                                    TriggerAction="All"
                                    QueryMode="Local"
                                    DisplayField="Text"
                                    ValueField="Text">
                                    <Store>
                                        <ext:Store ID="Store2" runat="server">
                                            <Model>
                                                <ext:Model ID="Model2" Name="storeModel" runat="server">
                                                    <Fields>
                                                        <ext:ModelField Name="Text"></ext:ModelField>
                                                        <ext:ModelField Name="Value"></ext:ModelField>
                                                    </Fields>
                                                </ext:Model>
                                            </Model>
                                            <Proxy>
                                                <ext:AjaxProxy Json="true" Url="/Stock/GetComBoxDataPlant/" SimpleSortMode="true">
                                                    <Reader>
                                                        <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                                                    </Reader>
                                                </ext:AjaxProxy>
                                            </Proxy>
                                        </ext:Store>
                                    </Store>
                                    <Listeners>
                                        <Change Handler="applyFilter(this);" Buffer="250" />
                                    </Listeners>
                                    <Plugins>
                                        <ext:ClearButton ID="ClearButton4" runat="server" />
                                    </Plugins>
                                </ext:ComboBox>
                            </Items>
                        </ext:Column>
                        <ext:Column ID="Column3" Align="Center" Width="50" Hidden="false" DataIndex="Zpltn" Text="生产线" runat="server">
                            <Items>
                                <ext:TextField ID="TextZpltn" runat="server" Hidden="true">
                                    <Listeners>
                                        <Change Handler="applyFilter(this);" Buffer="250" />
                                    </Listeners>
                                    <Plugins>
                                        <ext:ClearButton ID="ClearButton2" runat="server" />
                                    </Plugins>
                                </ext:TextField>
                            </Items>
                        </ext:Column>
                        <ext:Column ID="Column4" Align="Center" Width="50" Hidden="false" DataIndex="Matnr" Text="物料编号" runat="server">
                            <Items>
                                <ext:TextField ID="TextMatnr" runat="server" Hidden="true">
                                    <Listeners>
                                        <Change Handler="applyFilter(this);" Buffer="250" />
                                    </Listeners>
                                    <Plugins>
                                        <ext:ClearButton ID="ClearButton3" runat="server" />
                                    </Plugins>
                                </ext:TextField>
                            </Items>
                        </ext:Column>
                        <ext:Column ID="Column5" Align="Center" Width="50" Hidden="false" DataIndex="Exidv" Text="SKU号" runat="server">
                            <Items>
                                <ext:TextField ID="TextExidv" runat="server" Hidden="true">
                                    <Listeners>
                                        <Change Handler="applyFilter(this);" Buffer="250" />
                                    </Listeners>
                                    <Plugins>
                                        <ext:ClearButton ID="ClearButton1" runat="server" />
                                    </Plugins>
                                </ext:TextField>
                            </Items>
                        </ext:Column>
                        <ext:Column ID="Column6" Align="Center" Width="50" Hidden="false" DataIndex="Pt" Text="当前库位 " runat="server">
                            <Items>
                                <ext:ComboBox
                                    ID="ComboBoxPt" Hidden="true"
                                    runat="server"
                                    TriggerAction="All"
                                    QueryMode="Local"
                                    DisplayField="Text"
                                    ValueField="Text">
                                    <Store>
                                        <ext:Store ID="Store3" runat="server">
                                            <Model>
                                                <ext:Model ID="Model3" Name="storeModel" runat="server">
                                                    <Fields>
                                                        <ext:ModelField Name="Text"></ext:ModelField>
                                                        <ext:ModelField Name="Value"></ext:ModelField>
                                                    </Fields>
                                                </ext:Model>
                                            </Model>
                                            <Proxy>
                                                <ext:AjaxProxy Json="true" Url="/Stock/GetComBoxDataStock/" SimpleSortMode="true">
                                                    <Reader>
                                                        <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                                                    </Reader>
                                                </ext:AjaxProxy>
                                            </Proxy>
                                        </ext:Store>
                                    </Store>
                                    <Listeners>
                                        <Change Handler="applyFilter(this);" Buffer="250" />
                                    </Listeners>
                                    <Plugins>
                                        <ext:ClearButton ID="ClearButton5" runat="server" />
                                    </Plugins>
                                </ext:ComboBox>
                            </Items>
                        </ext:Column>
                        <ext:Column ID="Column7" Align="Center" Width="50" Hidden="false" DataIndex="Bin" Text="当前货道" runat="server">
                            <Items>
                                <ext:ComboBox Hidden="true"
                                    ID="ComboBoxBin"
                                    runat="server"
                                    TriggerAction="All"
                                    QueryMode="Local"
                                    DisplayField="Text"
                                    ValueField="Text">
                                    <Store>
                                        <ext:Store ID="Store4" runat="server">
                                            <Model>
                                                <ext:Model ID="Model4" Name="storeModel" runat="server">
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
                                    </Store>
                                    <Listeners>
                                        <Change Handler="applyFilter(this);" Buffer="250" />
                                    </Listeners>
                                    <Plugins>
                                        <ext:ClearButton ID="ClearButton6" runat="server" />
                                    </Plugins>
                                </ext:ComboBox>
                            </Items>
                        </ext:Column>
                        <ext:Column ID="Column8" Align="Center" Width="50" Hidden="false" DataIndex="Bounded" Text="是否绑定" runat="server">
                            <Renderer Fn="BoundedMethod"></Renderer>
                        </ext:Column>
                        <ext:Column ID="Column9" Align="Center" Width="50" Hidden="false" DataIndex="Inbin" Text="是否已入库" runat="server">
                            <Renderer Fn="InbinMethod"></Renderer>
                        </ext:Column>

                        <ext:DateColumn ID="DateColumn1" Align="Center" Width="50" Hidden="false" Format="Y-M-d HH:i:s" DataIndex="Intime" Text="入库时间" runat="server"></ext:DateColumn>
                    </Columns>
                </ColumnModel>
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
    <script src="../../Content/Script/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        var StoreBeforeLoad = function () {
            $("tr:odd").addClass('trbg');
        }
        var applyFilter = function (field) {
            var store = App.GridPanel1.getStore();
            store.filterBy(getRecordFilter());
        }; var getRecordFilter = function () {
            var f = [];
            f.push({
                filter: function (record) {
                    return filterNumber(App.ComboBoxWerks.getValue(), "Werks", record);
                }
            });
            f.push({
                filter: function (record) {
                    return filterNumber(App.TextExidv.getValue(), "Exidv", record);
                }
            });
            f.push({
                filter: function (record) {
                    return filterNumber(App.ComboBoxPt.getValue(), "Pt", record);
                }
            });
            f.push({
                filter: function (record) {
                    return filterNumber(App.ComboBoxBin.getValue(), "Bin", record);
                }
            });
            f.push({
                filter: function (record) {
                    return filterNumber(App.TextMatnr.getValue(), "Matnr", record);
                }
            });
            f.push({
                filter: function (record) {
                    return filterNumber(App.TextZpltn.getValue(), "Zpltn", record);
                }
            });
            var len = f.length;
            return function (record) {
                for (var i = 0; i < len; i++) {
                    if (!f[i].filter(record)) {
                        return false;
                    }
                }
                return true;
            };
        }
        var filterNumber = function (value, dataIndex, record) {
            var val = record.get(dataIndex);
            var re = new RegExp(value, 'g');
            if (!Ext.isEmpty(value, false) && (val + '').match(value) == null) {
                return false;
            }

            return true;
        };

        /*表格搜索*/
        var SearchWhere = function (a, b, c) {
            App.seachForm.submit({
                url: '/TagBind/SearchWhere',
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
        /*是否绑定*/
        var BoundedMethod = function (value) {
            return '<span' + (value == 1 ? ' style="color:green;">已绑定' : ' style="color:red;">未绑定') + '</span>';

        }
        /*是否已入库*/
        var InbinMethod = function (value) {
            return '<span' + (value == 1 ? ' style="color:green;">已入库' : ' style="color:red;">未入库') + '</span>';

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
                        url: "/TagBind/DeleteMethod/",
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