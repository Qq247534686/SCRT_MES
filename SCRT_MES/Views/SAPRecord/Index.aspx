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
    <ext:Viewport ID="Viewport1" runat="server" Region="Center" Layout="FitLayout">
        <Items>
            <ext:GridPanel UI="Primary" ID="GridPanel1" runat="server" ForceFit="true" Region="Center">
                <TopBar>
                    <ext:Toolbar ID="Toolbar1" runat="server" AutoScroll="true">
                        <Items>
                            <ext:FormPanel runat="server" BodyStyle="background-color: #d6e6f2;" Frame="true" ID="seachForm" Layout="HBoxLayout">
                                <Items>
                                    <ext:ComboBox ID="ComboBox1" LabelWidth="30" Width="150" Name="Werks" runat="server" Editable="false" FieldLabel="工厂" EmptyText="搜索工厂" ValueField="Text"  DisplayField="Text" PaddingSpec="0 0 0 10">
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
                                                    <ext:AjaxProxy Json="true" Url="/Plant/GetComBoxDataPlant/" SimpleSortMode="true">
                                                        <Reader>
                                                            <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                                                        </Reader>
                                                    </ext:AjaxProxy>
                                                </Proxy>
                                            </ext:Store>
                                        </Store>
                                    </ext:ComboBox>
                                    <ext:ToolbarSeparator Width="10"></ext:ToolbarSeparator>
                                    <ext:TextField ID="TextField10" runat="server" Name="Zpltn" EmptyText="搜索产线" Width="150" LabelAlign="Left" LabelWidth="30" FieldLabel="产线">
                                    </ext:TextField>
                                    <ext:ToolbarSeparator Width="10"></ext:ToolbarSeparator>
                                    <ext:TextField ID="TextField4" runat="server" Name="Matnr" EmptyText="搜索物料号" Width="150" LabelAlign="Left" LabelWidth="50" FieldLabel="物料号">
                                    </ext:TextField>
                                    <ext:ToolbarSeparator Width="10"></ext:ToolbarSeparator>
                                    <ext:TextField ID="TextField5" runat="server" Name="Exidv" EmptyText="搜索SKU号" Width="160" LabelAlign="Left" LabelWidth="60" FieldLabel="SKU号">
                                    </ext:TextField>
                                    <ext:TextField ID="TextField1" runat="server" Name="ZlgortOri" EmptyText="搜索ZlgortOri" Width="160" LabelAlign="Left" LabelWidth="60" FieldLabel="ZlgortOri">
                                    </ext:TextField>
                                    <ext:TextField ID="TextField2" runat="server" Name="ZlgortTar" EmptyText="搜索ZlgortTar" Width="160" LabelAlign="Left" LabelWidth="60" FieldLabel="ZlgortTar">
                                    </ext:TextField>
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
                    <ext:Store ID="store1" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
                        <Model>
                            <ext:Model ID="Model1" Name="storeModel" runat="server">
                                <Fields>
                                    <ext:ModelField Name="id"></ext:ModelField>
                                    <ext:ModelField Name="Zsjno"></ext:ModelField>
                                    <ext:ModelField Name="Ztype"></ext:ModelField>
                                    <ext:ModelField Name="Werks"></ext:ModelField>
                                    <ext:ModelField Name="Zpltn"></ext:ModelField>
                                    <ext:ModelField Name="Zpoint"></ext:ModelField>
                                    <ext:ModelField Name="Matnr"></ext:ModelField>
                                    <ext:ModelField Name="Exidv"></ext:ModelField>
                                    <ext:ModelField Name="ZlgortOri"></ext:ModelField>
                                    <ext:ModelField Name="ZlgortTar"></ext:ModelField>
                                    <ext:ModelField Name="qty"></ext:ModelField>
                                    <ext:ModelField Name="Created" DateFormat="Y-M-d HH:i:s"></ext:ModelField>

                                </Fields>
                            </ext:Model>
                        </Model>
                        <Listeners>
                            <Load Fn="StoreBeforeLoad"></Load>
                        </Listeners>
                        <Proxy>
                            <ext:AjaxProxy Json="true" Url="/SAPRecord/GetTableData/" SimpleSortMode="true">
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
                        <ext:Column ID="Column2" Align="Center" Width="50" Hidden="false" DataIndex="Zsjno" Text="日志编号" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column3" Align="Center" Width="50" Hidden="false" DataIndex="Ztype" Text="Ztype" runat="server" />
                        <ext:Column ID="Column4" Align="Center" Width="50" Hidden="false" DataIndex="Werks" Text="工厂" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column5" Align="Center" Width="50" Hidden="false" DataIndex="Zpltn" Text="产线" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column6" Align="Center" Width="50" Hidden="false" DataIndex="Zpoint" Text="Zpoint" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column7" Align="Center" Width="50" Hidden="false" DataIndex="Matnr" Text="物料" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column8" Align="Center" Width="50" Hidden="false" DataIndex="Exidv" Text="SKU" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column9" Align="Center" Width="50" Hidden="false" DataIndex="ZlgortOri" Text="ZlgortOri" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column10" Align="Center" Width="50" Hidden="false" DataIndex="ZlgortTar" Text="ZlgortTar" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column11" Align="Center" Width="50" Hidden="false" DataIndex="qty" Text="qty" runat="server">
                        </ext:Column>
                        <ext:DateColumn ID="DateColumn2" Align="Center" Width="50" Hidden="false" Format="Y-M-dd HH:i:s" DataIndex="Created" Text="日期" runat="server"></ext:DateColumn>
                    </Columns>
                </ColumnModel>
                <Listeners>
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
    <script src="../../Content/Script/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        var StoreBeforeLoad = function () {
            $("tr:odd").addClass('trbg');
        }
        /*表格搜索*/
        var SearchWhere = function (a, b, c) {
            //console.log(App.seachForm.getForm().getValues());
            App.seachForm.submit({
                url: '/SAPRecord/SearchWhere',
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
