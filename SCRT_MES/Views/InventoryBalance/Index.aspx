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
                    <ext:Toolbar ID="Toolbar1" runat="server">
                        <Items>
                            <ext:FormPanel runat="server" BodyStyle="background-color: #d6e6f2;" Frame="true" ID="seachForm" Layout="HBoxLayout">
                                <Items>
                                    <ext:ComboBox ID="ComboBox3" LabelWidth="30" Width="120" Name="Bin" runat="server" Editable="false" FieldLabel="Bin" EmptyText="搜索Bin" ValueField="Value" DisplayField="Text" PaddingSpec="0 0 0 5">
                                        <Items>
                                            <ext:ListItem Text="B001" Value="B001"></ext:ListItem>
                                            <ext:ListItem Text="B002" Value="B002"></ext:ListItem>
                                        </Items>
                                    </ext:ComboBox>
                                    <ext:NumberField runat="server" MinValue="0" LabelWidth="50" Name="week" FieldLabel="第几周" EmptyText="搜索周" Width="160" PaddingSpec="0 0 0 10"></ext:NumberField>
                                    <ext:ToolbarSeparator Width="10"></ext:ToolbarSeparator>
                                    <ext:DateField ID="DateField1" LabelWidth="40" Width="190" runat="server" Name="StartTime" Format="Y-M-d H:i:s" SubmitFormat="Y-M-d HH:i:s" FieldLabel="日期" EmptyText="请选择开始日期" PaddingSpec="0 0 0 10"></ext:DateField>
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
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <Store>
                    <ext:Store ID="store1" runat="server" AutoLoad="true" PageSize="25" RemoteSort="true" RemoteFilter="true">
                        <Model>
                            <ext:Model ID="Model1" Name="storeModel" runat="server">
                                <Fields>
                                    <ext:ModelField Name="Id"></ext:ModelField>
                                    <ext:ModelField Name="Bin"></ext:ModelField>
                                    <ext:ModelField Name="MatrnCount"></ext:ModelField>
                                    <ext:ModelField Name="MatrnNumber"></ext:ModelField>
                                    <ext:ModelField Name="RecordTime"></ext:ModelField>
                                    <ext:ModelField Name="week"></ext:ModelField>
                                    <ext:ModelField Name="RecordTime" DateFormat="Y-M-d HH:i:s"></ext:ModelField>
                                </Fields>
                            </ext:Model>
                        </Model>
                        <Listeners>
                            <Load Fn="StoreBeforeLoad"></Load>
                        </Listeners>
                        <Proxy>
                            <ext:AjaxProxy Json="true" Url="/InventoryBalance/GetTableData/" SimpleSortMode="true">
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
                        <ext:Column ID="Column8" Align="Center" Width="30" Hidden="false" DataIndex="Bin" Text="Bin" runat="server">
                        </ext:Column>

                        <ext:Column ID="Column2" Align="Center" Width="30" Hidden="false" DataIndex="MatrnCount" Text="数量" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column3" Align="Center" Width="30" Hidden="false" DataIndex="week" Text="周" runat="server" />
                        <ext:DateColumn ID="DateColumn2" Align="Center" Width="50" Hidden="false" Format="Y-M-dd HH:i:s" DataIndex="RecordTime" Text="日期" runat="server"></ext:DateColumn>
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

        var template = '<span style="color:{0};">{1}</span>';
        var RendererState = function (value) {
            return Ext.String.format(template, (value == 0) ? "green" : "red", (value == 0) ? "成功" : "失败");
        }
        /*表格搜索*/
        var SearchWhere = function (a, b, c) {

            App.seachForm.submit({
                url: '/InventoryBalance/SearchWhere',
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