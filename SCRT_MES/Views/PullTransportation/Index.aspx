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
                    <ext:Toolbar ID="Toolbar1" runat="server" AutoScroll="true">
                        <Items>
                            <ext:FormPanel runat="server" BodyStyle="background-color: #d6e6f2;" Frame="true" ID="seachForm" Layout="HBoxLayout">
                                <Items>

                                    <ext:ComboBox ID="ComboBox4" LabelWidth="30" Width="120" Name="stockBinFrom" runat="server" Editable="false" FieldLabel="Bin" EmptyText="搜索Bin" ValueField="Value" StoreID="store4" DisplayField="Text" PaddingSpec="0 0 0 5"></ext:ComboBox>
                                    <ext:TextField ID="TextField2" runat="server" Name="matnr" EmptyText="搜索物料码" LabelWidth="60" FieldLabel="物料码" Width="150">
                                    </ext:TextField>
                                    <ext:TextField ID="TextField1" runat="server" Name="linePoint" EmptyText="搜索LinePoint" LabelWidth="60" FieldLabel="LinePoint" Width="150">
                                    </ext:TextField>
                                    <ext:TextField ID="TextField3" runat="server" Name="assLine" EmptyText="搜索AssLine" LabelWidth="60" FieldLabel="AssLine" Width="150">
                                    </ext:TextField>
                                    <ext:DateField ID="DateField1" LabelWidth="60" Width="190" runat="server" Name="StartTime" Format="Y-M-d H:i:s" SubmitFormat="Y-M-d HH:i:s" FieldLabel="操作日期" EmptyText="请选择开始日期" PaddingSpec="0 0 0 10"></ext:DateField>
                                    <ext:DateField ID="DateField2" LabelWidth="10" Width="140" runat="server" Name="EndTime" Format="Y-M-d H:i:s" SubmitFormat="Y-M-d HH:i:s" FieldLabel="至" EmptyText="请选择结束日期"></ext:DateField>
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

                            <ext:Button ID="Button1" Hidden="true" Icon="RecordBlue" UI="Primary" runat="server" Text="清除所有记录">
                                <Listeners>
                                    <Click Fn="DeleteRecord"></Click>
                                </Listeners>
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <Store>
                    <ext:Store ID="store1" runat="server" AutoLoad="true" PageSize="25" RemoteSort="true" RemoteFilter="true">
                        <Model>
                            <ext:Model ID="Model1" Name="storeModel" runat="server">
                                <Fields>
                                    <ext:ModelField Name="id"></ext:ModelField>
                                    <ext:ModelField Name="stockBinFrom"></ext:ModelField>
                                    <ext:ModelField Name="matnr"></ext:ModelField>
                                    <ext:ModelField Name="linePoint"></ext:ModelField>
                                    <ext:ModelField Name="assLine"></ext:ModelField>
                                    <ext:ModelField Name="insertTime" DateFormat="Y-M-d HH:i:s"></ext:ModelField>
                                </Fields>
                            </ext:Model>
                        </Model>
                        <Proxy>
                            <ext:AjaxProxy Json="true" Url="/PullTransportation/GetTableData/" SimpleSortMode="true">
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
                        <ext:Column ID="Column2" Align="Center" Width="30" Hidden="false" DataIndex="stockBinFrom" Text="Bin" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column8" Align="Center" Width="30" Hidden="false" DataIndex="matnr" Text="物料码" runat="server">
                        </ext:Column>


                        <ext:Column ID="Column3" Align="Center" Width="30" Hidden="false" DataIndex="linePoint" Text="linePoint" runat="server" />
                        <ext:Column ID="Column4" Align="Center" Width="30" Hidden="false" DataIndex="assLine" Text="assLine" runat="server"></ext:Column>

                        <ext:DateColumn ID="DateColumn2" Align="Center" Width="50" Hidden="false" Format="Y-M-dd HH:i:s" DataIndex="insertTime" Text="日期" runat="server"></ext:DateColumn>
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
    <script type="text/javascript">

        var DeleteRecord = function () {
            Ext.Msg.confirm('提示', '是否确认删除?', function (btn) {
                if (btn == 'yes') {
                    Ext.Ajax.request({
                        url: "/Operation/DeleteRecord/",
                        waitMsg: '正在删除...',
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
        var template = '<span style="color:{0};">{1}</span>';
        var RendererState = function (value) {
            return Ext.String.format(template, (value == 0) ? "green" : "red", (value == 0) ? "成功" : "失败");
        }
        /*表格搜索*/
        var SearchWhere = function (a, b, c) {

            App.seachForm.submit({
                url: '/PullTransportation/SearchWhere',
                submitEmptyText: false,
                method: 'POST',
                success: function () {
                    App.store1.reload();

                },
                failure: function () {

                }
            });
        }
    </script>
</body>
</html>
