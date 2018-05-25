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
    </style>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager1" runat="server"></ext:ResourceManager>

    <ext:Viewport ID="Viewport1" runat="server" Region="Center" Layout="FitLayout">
        <Items>
            <ext:GridPanel UI="Primary" ID="GridPanel1" runat="server" ForceFit="true" Region="Center">
                <TopBar>
                    <ext:Toolbar ID="Toolbar1" runat="server" AutoScroll="true">
                        <Items>
                            <ext:FormPanel runat="server" BodyStyle="background-color: #d6e6f2;" Frame="true" ID="seachForm" Layout="HBoxLayout">
                                <Items>
                                    <ext:ComboBox ID="ComboBox3" LabelWidth="50" Width="150" Name="plantFrom" runat="server" Editable="false" FieldLabel="Plant" EmptyText="搜索Plant" ValueField="Value" DisplayField="Text" PaddingSpec="0 0 0 10">
                                        <Store>
                                            <ext:Store ID="store3" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
                                                <Model>
                                                    <ext:Model ID="Model4" Name="storeModel" runat="server">
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
                                    </ext:ComboBox>
                                    <ext:ComboBox ID="ComboBox5" LabelWidth="50" Width="150" Name="stockFrom" runat="server" Editable="false" FieldLabel="Stock" EmptyText="搜索Stock" ValueField="Value" DisplayField="Text" PaddingSpec="0 0 0 10">
                                        <Store>
                                            <ext:Store ID="store2" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
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
                                    </ext:ComboBox>
                                    <ext:ComboBox ID="ComboBox4" LabelWidth="30" Width="120" Name="binFrom" runat="server" Editable="false" FieldLabel="Bin" EmptyText="搜索Bin" ValueField="Value" DisplayField="Text" PaddingSpec="0 0 0 5">
                                        <Store>
                                            <ext:Store runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
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
                                        </Store>
                                    </ext:ComboBox>
                                    <ext:TextField runat="server" Name="exidv" EmptyText="搜索SKU" LabelWidth="30" FieldLabel="SKU" Width="150">
                                    </ext:TextField>
                                    <ext:ToolbarSeparator Width="10"></ext:ToolbarSeparator>
                                    <ext:ComboBox ID="ComboBox1" LabelWidth="40" Width="150" Name="action" runat="server" Editable="false" FieldLabel="Action" EmptyText="搜索Action" ValueField="Value" DisplayField="Text" PaddingSpec="0 0 0 5">
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
                                    <ext:ComboBox ID="ComboBox2" LabelWidth="35" Width="150" Name="processingState" runat="server" Editable="false" FieldLabel="状态" EmptyText="搜索状态" ValueField="Value" DisplayField="Text" PaddingSpec="0 0 0 5">
                                        <Items>
                                            <ext:ListItem Text="成功" Value="1"></ext:ListItem>
                                            <ext:ListItem Text="失败" Value="2"></ext:ListItem>
                                            <ext:ListItem Text="全部" Value="0"></ext:ListItem>
                                        </Items>
                                    </ext:ComboBox>
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

                            <ext:Button ID="Button1" Icon="RecordBlue" UI="Primary" runat="server" Text="清除所有记录">
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
                                    <ext:ModelField Name="rfidKey"></ext:ModelField>
                                    <ext:ModelField Name="action"></ext:ModelField>
                                    <ext:ModelField Name="plantTo"></ext:ModelField>
                                    <ext:ModelField Name="stockTo"></ext:ModelField>
                                    <ext:ModelField Name="binTo"></ext:ModelField>
                                    <ext:ModelField Name="plantFrom"></ext:ModelField>
                                    <ext:ModelField Name="stockFrom"></ext:ModelField>
                                    <ext:ModelField Name="binFrom"></ext:ModelField>
                                    <ext:ModelField Name="matnr"></ext:ModelField>
                                    <ext:ModelField Name="exidv"></ext:ModelField>
                                    <ext:ModelField Name="processingState"></ext:ModelField>
                                    <ext:ModelField Name="messageHints"></ext:ModelField>
                                    <ext:ModelField Name="recordTime" DateFormat="Y-M-d HH:i:s"></ext:ModelField>
                                </Fields>
                            </ext:Model>
                        </Model>
                        <Proxy>
                            <ext:AjaxProxy Json="true" Url="/Operation/GetTableData/" SimpleSortMode="true">
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
                        <ext:Column ID="Column8" Align="Center" Width="30" Hidden="true" DataIndex="rfidKey" Text="标签码" runat="server">
                        </ext:Column>

                        <ext:Column ID="Column2" Align="Center" Width="30" Hidden="false" DataIndex="plantTo" Text="PlantTo" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column3" Align="Center" Width="30" Hidden="false" DataIndex="stockTo" Text="StockTo" runat="server" />
                        <ext:Column ID="Column4" Align="Center" Width="30" Hidden="false" DataIndex="binTo" Text="BinTo" runat="server"></ext:Column>
                        <ext:Column ID="Column5" Align="Center" Width="30" Hidden="false" DataIndex="plantFrom" Text="PlantFrom" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column6" Align="Center" Width="30" Hidden="false" DataIndex="stockFrom" Text="StockFrom " runat="server">
                        </ext:Column>
                        <ext:Column ID="Column7" Align="Center" Width="30" Hidden="false" DataIndex="binFrom" Text="BinFrom" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column9" Align="Center" Width="50" Hidden="false" DataIndex="matnr" Text="物料号" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column11" Align="Center" Width="50" Hidden="false" DataIndex="exidv" Text="SKU" runat="server">
                            <%-- <Items>
                                <ext:TextField ID="PriceFilter" runat="server">
                                    <Listeners>
                                        <Change Handler="applyFilter(this);" Buffer="250" />
                                    </Listeners>
                                    <Plugins>
                                        <ext:ClearButton ID="ClearButton1" runat="server" />
                                    </Plugins>
                                </ext:TextField>
                            </Items>--%>
                        </ext:Column>
                        <ext:Column ID="Column10" Align="Center" Width="30" Hidden="false" DataIndex="action" Text="Action" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column12" Align="Center" Width="50" Hidden="false" DataIndex="processingState" Text="状态" runat="server">
                            <Renderer Fn="RendererState"></Renderer>
                        </ext:Column>
                        <ext:Column ID="Column13" Align="Center" Width="50" Hidden="false" DataIndex="messageHints" Text="消息" runat="server">
                        </ext:Column>
                        <ext:DateColumn ID="DateColumn2" Align="Center" Width="50" Hidden="false" Format="Y-M-dd HH:i:s" DataIndex="recordTime" Text="操作时间" runat="server"></ext:DateColumn>
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
                url: '/Operation/SearchWhere',
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