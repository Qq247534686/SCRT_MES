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

        #TextField2 .x-form-text-default {
            color: #2a6496;
        }

        .x-btn-inner-default-toolbar-small {
            color: white;
        }

        .fontColor {
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            -ms-border-radius: 3px;
            -o-border-radius: 3px;
            border-radius: 3px;
            padding: 3px 3px 3px 3px;
            border-width: 1px;
            border-style: solid;
            background-color: #054980;
        }
    </style>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager1" runat="server"></ext:ResourceManager>
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
            <ext:AjaxProxy Json="true" Url="/TagManage/GetComBoxDataRfidKey" SimpleSortMode="true">
                <Reader>
                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                </Reader>
            </ext:AjaxProxy>
        </Proxy>
    </ext:Store>
    <ext:Store ID="store4" runat="server" AutoLoad="true" PageSize="25" RemoteSort="true" RemoteFilter="true">
        <Model>
            <ext:Model ID="Model3" Name="storeModel" runat="server">
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
                                    <ext:TextField ID="TextField8" runat="server" Name="Code" Hidden="true" EmptyText="搜索标签码" Width="150" LabelAlign="Left" LabelWidth="45" FieldLabel="标签码">
                                    </ext:TextField>

                                    <ext:TextField ID="TextField10" runat="server" Name="tagFirst" EmptyText="搜索tagFirst" Width="150" LabelAlign="Left" LabelWidth="45" FieldLabel="tagFirst">
                                    </ext:TextField>
                                    <ext:ToolbarSeparator Width="10"></ext:ToolbarSeparator>
                                    <ext:TextField ID="TextField11" runat="server" Name="tagLast" EmptyText="搜索tagLast" Width="150" LabelAlign="Left" LabelWidth="45" FieldLabel="tagLast">
                                    </ext:TextField>
                                    <ext:ToolbarSeparator Width="10"></ext:ToolbarSeparator>
                                    <ext:TextField ID="TextField4" runat="server" Name="Exidv" EmptyText="搜索SKU" Width="150" LabelAlign="Left" LabelWidth="35" FieldLabel="SKU">
                                    </ext:TextField>
                                    <ext:ToolbarSeparator Width="10"></ext:ToolbarSeparator>
                                    <ext:ComboBox ID="ComboBox3" LabelWidth="20" Width="100" Name="binCode" runat="server" Editable="false" FieldLabel="Bin" EmptyText="搜索Bin" ValueField="Value" StoreID="store4" DisplayField="Text" PaddingSpec="0 0 0 10">
                                    </ext:ComboBox>
                                    <ext:ToolbarSeparator Width="10"></ext:ToolbarSeparator>

                                    <ext:DateField ID="DateField1" Hidden="true" LabelWidth="60" Width="190" runat="server" Name="StartTime" Format="Y-M-d H:i:s" SubmitFormat="Y-M-d HH:i:s" FieldLabel="创建日期" EmptyText="请选择开始日期" PaddingSpec="0 0 0 10"></ext:DateField>
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
                    <ext:Store ID="store1" runat="server" AutoLoad="true" PageSize="25" RemoteSort="true" RemoteFilter="true">
                        <Model>
                            <ext:Model ID="Model1" Name="storeModel" runat="server">
                                <Fields>
                                    <ext:ModelField Name="Id"></ext:ModelField>
                                    <ext:ModelField Name="Code"></ext:ModelField>
                                    <ext:ModelField Name="Actived" Type="Int"></ext:ModelField>
                                    <ext:ModelField Name="Matnr"></ext:ModelField>
                                    <ext:ModelField Name="Exidv"></ext:ModelField>
                                    <ext:ModelField Name="BinCode"></ext:ModelField>
                                    <ext:ModelField Name="Bounded"></ext:ModelField>
                                    <ext:ModelField Name="tagFirst"></ext:ModelField>
                                    <ext:ModelField Name="tagLast"></ext:ModelField>
                                    <ext:ModelField Name="Created" DateFormat="Y-M-d HH:i:s" Type="Date"></ext:ModelField>
                                </Fields>
                            </ext:Model>
                        </Model>
                        <Listeners>
                            <Load Fn="StoreBeforeLoad"></Load>
                        </Listeners>
                        <Proxy>
                            <ext:AjaxProxy Json="true" Url="/TagManage/GetTableData/" SimpleSortMode="true">
                                <Reader>
                                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                                </Reader>
                            </ext:AjaxProxy>
                        </Proxy>
                    </ext:Store>
                </Store>
                <ColumnModel ID="ColumnModel1" runat="server" EnableColumnHide="false" Flex="2" AnchorHorizontal="100%">
                    <Columns>
                        <ext:Column Align="Center" Width="120" Hidden="true" DataIndex="Id" Text="ID" runat="server" />
                        <ext:Column Align="Center" Width="70" Hidden="false" DataIndex="Code" Text="标签码" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column15" Align="Center" Width="70" Hidden="false" DataIndex="tagFirst" Text="tagFirst" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column16" Align="Center" Width="70" Hidden="false" DataIndex="tagLast" Text="tagLast" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column11" Align="Center" Width="40" Hidden="false" DataIndex="Matnr" Text="物料码" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column12" Align="Center" Width="40" Hidden="false" DataIndex="Exidv" Text="SKU" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column13" Align="Center" Width="20" Hidden="false" DataIndex="BinCode" Text="Bin" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column14" Align="Center" Width="30" Hidden="false" DataIndex="Bounded" Text="绑定状态" runat="server">
                            <Renderer Fn="BoundedMethod"></Renderer>
                        </ext:Column>
                        <ext:Column Align="Center" Width="50" Hidden="true" DataIndex="Actived" Text="激活状态" runat="server">
                            <Renderer Fn="ActivedMethod"></Renderer>
                        </ext:Column>
                        <ext:DateColumn ID="DateColumn2" Align="Center" Width="50" Hidden="true" Format="Y-M-d HH:i:s" DataIndex="Created" Text="创建日期" runat="server"></ext:DateColumn>

                        <ext:CommandColumn runat="server" Text="操作" MaxWidth="65" Flex="1">
                            <Commands>
                                <ext:GridCommand Icon="CogEdit" MinWidth="50" Cls="fontColor" Text="操作">
                                    <Menu EnableScrolling="false">
                                        <Items>
                                            <ext:MenuCommand Text="手动编辑" Icon="BuildingEdit" CommandName="CogEdit" />
                                            <ext:MenuCommand Text="查看记录" Icon="BookMagnify" CommandName="Record" />
                                        </Items>
                                    </Menu>
                                </ext:GridCommand>
                            </Commands>
                            <Listeners>
                                <Command Fn="SelectButtonMethod" />
                            </Listeners>
                        </ext:CommandColumn>
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
    <ext:Window runat="server" Title="操作" Hidden="true" ID="winCog" Modal="true" Width="320" Height="250" Layout="BorderLayout">
        <Items>
            <ext:FormPanel PaddingSpec="5 0 0 0" BodyStyle="border-width:0px;" ID="FormCog" runat="server" Region="Center" Frame="true" ColumnWidth="1.0" Method="POST">
                <Items>
                    <ext:FieldSet ID="FieldSet2" runat="server" MaxWidth="290" Layout="ColumnLayout" Height="160" Title="操作信息" MarginSpec="5 8 5 12" ButtonAlign="Right">
                        <Defaults>
                            <ext:Parameter Name="LabelWidth" Value="90" />
                        </Defaults>
                        <Items>
                            <ext:TextField ID="TextField9" LabelWidth="50" Hidden="true" Width="250" Icon="TagRed" EmptyText="请输入物料号" AllowBlank="true" Name="Code" runat="server" FieldLabel="物料号" PaddingSpec="0 0 10 10"></ext:TextField>
                            <ext:ComboBox ID="ComboBox1" LabelWidth="50" Width="250" Name="rfidKey" runat="server" Editable="false" FieldLabel="RfidKey" EmptyText="搜索RfidKey" ValueField="Value" StoreID="store3" AllowBlank="false" DisplayField="Text" PaddingSpec="0 0 10 10">
                            </ext:ComboBox>
                            <ext:TextField ID="TextField5" LabelWidth="50" Width="250" EmptyText="请输入物料号" AllowBlank="true" Name="Matnr" runat="server" FieldLabel="物料号" PaddingSpec="0 0 10 10"></ext:TextField>
                            <ext:TextField ID="TextField6" LabelWidth="50" Width="250" EmptyText="请输入SKU" AllowBlank="true" Name="Exidv" runat="server" FieldLabel="SKU" PaddingSpec="0 0 10 10"></ext:TextField>
                            <ext:NumberField ID="TextField7" LabelWidth="50" Width="250" EmptyText="请输入数量" AllowBlank="true" Name="qty" runat="server" MinValue="0" FieldLabel="数量" PaddingSpec="0 0 10 10"></ext:NumberField>
                        </Items>
                    </ext:FieldSet>
                </Items>
                <Defaults>
                    <ext:Parameter Name="AllowBlank" Value="false" Mode="Raw" />
                    <ext:Parameter Name="MsgTarget" Value="side" />
                </Defaults>
                <Listeners>
                    <ValidityChange Fn="IsValidFormCog" />
                </Listeners>
            </ext:FormPanel>
        </Items>
        <FooterBar>
            <ext:Toolbar ID="Toolbar2" runat="server">
                <Items>
                    <ext:ToolbarFill ID="ToolbarFill3" runat="server"></ext:ToolbarFill>
                    <ext:Button ID="ButtonCog" Text="保存" UI="Primary" Icon="Accept" runat="server">
                        <Listeners>
                            <Click Fn="EditSaveCogMethod"></Click>
                        </Listeners>
                    </ext:Button>
                    <ext:Button ID="Button11" Text="取消" UI="Primary" Icon="Cross" runat="server">
                        <Listeners>
                            <Click Handler="#{FormCog}.reset();#{winCog}.hide();"></Click>
                        </Listeners>
                    </ext:Button>
                </Items>
            </ext:Toolbar>
        </FooterBar>
    </ext:Window>
    <ext:Window runat="server" Title="编辑" Hidden="true" ID="win" Modal="true" Width="950" Height="550" Layout="BorderLayout">
        <Items>
            <ext:FormPanel PaddingSpec="5 0 0 0" BodyStyle="border-width:0px;" ID="tableDataForm" runat="server" Region="North" Height="75" Frame="true" ColumnWidth="1.0" Method="POST">
                <Items>
                    <ext:FieldSet ID="FieldSet1" runat="server" MaxWidth="940" Layout="ColumnLayout" Height="55" Title="标签信息" MarginSpec="5 8 5 5" ButtonAlign="Right">
                        <Defaults>
                            <ext:Parameter Name="LabelWidth" Value="90" />
                        </Defaults>
                        <Items>
                            <ext:Panel ID="Panel1"
                                runat="server"
                                ColumnWidth="0.6"
                                Height="90">
                                <Items>
                                    <ext:TextField ID="TextField1" Name="Id" DataIndex="Id" Hidden="true" runat="server" FieldLabel="编号" />
                                    <ext:TextField ID="TextField2" MinWidth="330" Icon="TagRed" EmptyText="请输入标签码" AllowBlank="false" Name="Code" runat="server" FieldLabel="标签码">
                                    </ext:TextField>
                                    <ext:TextField ID="TextField3" MinWidth="330" EmptyText="请输入空箱货位" AllowBlank="true" IndicatorText="" IndicatorCls="red-text" Name="Empty_pt" Hidden="true" runat="server" FieldLabel="空箱货位">
                                    </ext:TextField>
                                </Items>
                            </ext:Panel>
                            <ext:Panel ID="Panel3"
                                runat="server"
                                ColumnWidth="0.4"
                                Height="90">
                                <Items>

                                    <ext:ComboBox ID="Actived" Hidden="true" MinWidth="270" Name="Actived" Mode="Local" AllowBlank="false" runat="server" Editable="false" FieldLabel="激活状态" EmptyText="请选择激活状态" ValueField="Value" DisplayField="Text">
                                        <Items>
                                            <ext:ListItem Text="已激活" Value="1"></ext:ListItem>
                                            <ext:ListItem Text="未激活" Value="2"></ext:ListItem>
                                        </Items>
                                    </ext:ComboBox>
                                    <ext:DateField ID="DateField5" MinWidth="270" runat="server" Name="Created" AllowBlank="false" Format="Y-M-d HH:i:s" SubmitFormat="Y-M-d HH:i:s" FieldLabel="创建日期" EmptyText="请选择创建日期">
                                    </ext:DateField>
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
            <ext:GridPanel UI="Primary" ID="GridPanel2" runat="server" ForceFit="true" Region="Center">
                <TopBar>
                    <ext:Toolbar ID="Toolbar3" runat="server">
                        <Items>
                            <ext:FormPanel runat="server" BodyStyle="background-color: #d6e6f2;" Frame="true" ID="boundForm" Layout="HBoxLayout">
                                <Items>
                                    <ext:DateField ID="DateField3" LabelWidth="60" Width="190" runat="server" Name="StartTime" Format="Y-M-d H:i:s" SubmitFormat="Y-M-d HH:i:s" FieldLabel="创建日期" EmptyText="请选择开始日期" PaddingSpec="0 0 0 10"></ext:DateField>
                                    <ext:DateField ID="DateField4" LabelWidth="10" Width="140" runat="server" Name="EndTime" Format="Y-M-d H:i:s" SubmitFormat="Y-M-d HH:i:s" FieldLabel="至" EmptyText="请选择结束日期"></ext:DateField>
                                    <ext:Button ID="Button7" Icon="Magnifier" runat="server" Text="搜索" MarginSpec="0 0 0 10">
                                        <Listeners>
                                            <Click Fn="SearchWhereBound"></Click>
                                        </Listeners>
                                    </ext:Button>
                                    <ext:ToolbarSeparator></ext:ToolbarSeparator>
                                    <ext:Button ID="Button8" Icon="ArrowRefresh" runat="server" Text="重置" MarginSpec="0 0 0 10">
                                        <Listeners>
                                            <Click Handler="#{boundForm}.reset();SearchWhereBound();"></Click>
                                        </Listeners>
                                    </ext:Button>
                                </Items>
                            </ext:FormPanel>
                            <ext:ToolbarFill ID="ToolbarFill2" runat="server"></ext:ToolbarFill>
                            <ext:Button ID="Button5" Text="保存" UI="Primary" Icon="Accept" runat="server">
                                <Listeners>
                                    <Click Fn="EditSaveMethod"></Click>
                                </Listeners>
                            </ext:Button>
                            <ext:Button ID="Button6" Text="取消" UI="Primary" Icon="Cross" runat="server">
                                <Listeners>
                                    <Click Handler="#{tableDataForm}.reset();#{win}.hide();"></Click>
                                </Listeners>
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <Store>
                    <ext:Store ID="store2" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
                        <Model>
                            <ext:Model ID="Model2" Name="storeModel" runat="server">
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
                            <ext:AjaxProxy Json="true" Url="/TagBind/GetTableDataToId" SimpleSortMode="true">
                                <Reader>
                                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                                </Reader>
                            </ext:AjaxProxy>
                        </Proxy>
                    </ext:Store>
                </Store>
                <ColumnModel ID="ColumnModel2" runat="server" EnableColumnHide="false" Flex="2" AnchorHorizontal="100%">
                    <Columns>
                        <ext:Column ID="Column1" Align="Center" Width="120" Hidden="true" DataIndex="Id" Text="ID" runat="server" />
                        <ext:Column ID="Column10" Align="Center" Width="50" Hidden="true" DataIndex="Tag_id" Text="关联RFID_TAG中的ID" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column2" Align="Center" Width="80" Hidden="false" DataIndex="Werks" Text="工厂" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column3" Align="Center" Width="100" Hidden="false" DataIndex="Zpltn" Text="生产线" runat="server" />
                        <ext:Column ID="Column4" Align="Center" Width="100" Hidden="false" DataIndex="Matnr" Text="物料编号" runat="server"></ext:Column>
                        <ext:Column ID="Column5" Align="Center" Width="80" Hidden="false" DataIndex="Exidv" Text="SKU号" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column6" Align="Center" Width="100" Hidden="false" DataIndex="Pt" Text="当前库位 " runat="server">
                        </ext:Column>
                        <ext:Column ID="Column7" Align="Center" Width="100" Hidden="false" DataIndex="Bin" Text="当前货道" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column8" Align="Center" Width="100" Hidden="false" DataIndex="Bounded" Text="是否绑定" runat="server">
                            <Renderer Fn="BoundedMethod"></Renderer>
                        </ext:Column>
                        <ext:Column ID="Column9" Align="Center" Width="100" Hidden="true" DataIndex="Inbin" Text="是否已入库" runat="server">
                            <Renderer Fn="InbinMethod"></Renderer>
                        </ext:Column>

                        <ext:DateColumn ID="DateColumn1" Align="Center" Width="150" Hidden="false" Format="Y-M-d HH:i:s" DataIndex="Intime" Text="入库时间" runat="server"></ext:DateColumn>
                    </Columns>
                </ColumnModel>
                <SelectionModel>
                    <ext:CheckboxSelectionModel ID="CheckboxSelectionModel2" runat="server" Mode="Simple">
                    </ext:CheckboxSelectionModel>
                </SelectionModel>
                <BottomBar>
                    <ext:PagingToolbar ID="PagingToolbar2" StoreID="store2" runat="server">

                        <Plugins>
                            <ext:ProgressBarPager ID="ProgressBarPager2" runat="server" />
                        </Plugins>
                    </ext:PagingToolbar>
                </BottomBar>
            </ext:GridPanel>
        </Items>
    </ext:Window>
    <ext:Window runat="server" Title="查看记录" Hidden="true" ID="Window1" Modal="true" Width="950" Height="550" Layout="BorderLayout" Icon="BookTabs">
        <Items>
            <ext:GridPanel UI="Primary" ID="GridPanel3" runat="server" ForceFit="true" Region="Center">
                <TopBar>
                    <ext:Toolbar ID="Toolbar4" runat="server" AutoScroll="true">
                        <Items>
                            <ext:FormPanel runat="server" BodyStyle="background-color: #d6e6f2;" Frame="true" ID="seachFormOperation" Layout="HBoxLayout">
                                <Items>
                                    <ext:TextField runat="server" Name="rfidKey" Hidden="true" ID="rfidKeyText">
                                    </ext:TextField>
                                    <ext:ComboBox ID="ComboBox2" LabelWidth="50" Width="150" Name="plantFrom" runat="server" Editable="false" FieldLabel="Plant" EmptyText="搜索Plant" ValueField="Value" DisplayField="Text" PaddingSpec="0 0 0 10">
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
                                            <ext:Store ID="Store7" runat="server" AutoLoad="true" PageSize="15" RemoteSort="true" RemoteFilter="true">
                                                <Model>
                                                    <ext:Model ID="Model7" Name="storeModel" runat="server">
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
                                    <ext:TextField ID="TextField12" runat="server" Name="exidv" EmptyText="搜索SKU" LabelWidth="30" FieldLabel="SKU" Width="150">
                                    </ext:TextField>
                                    <ext:ToolbarSeparator Width="10"></ext:ToolbarSeparator>
                                    <ext:ComboBox ID="ComboBox6" LabelWidth="40" Width="150" Name="action" runat="server" Editable="false" FieldLabel="Action" EmptyText="搜索Action" ValueField="Value" DisplayField="Text" PaddingSpec="0 0 0 5">
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
                                    <ext:ComboBox ID="ComboBox7" LabelWidth="35" Width="150" Name="processingState" runat="server" Editable="false" FieldLabel="状态" EmptyText="搜索状态" ValueField="Value" DisplayField="Text" PaddingSpec="0 0 0 5">
                                        <Items>
                                            <ext:ListItem Text="成功" Value="1"></ext:ListItem>
                                            <ext:ListItem Text="失败" Value="2"></ext:ListItem>
                                            <ext:ListItem Text="全部" Value="0"></ext:ListItem>
                                        </Items>
                                    </ext:ComboBox>
                                    <ext:DateField ID="DateField6" LabelWidth="60" Width="190" runat="server" Name="StartTime" Format="Y-M-d H:i:s" SubmitFormat="Y-M-d HH:i:s" FieldLabel="操作日期" EmptyText="请选择开始日期" PaddingSpec="0 0 0 10"></ext:DateField>
                                    <ext:DateField ID="DateField7" LabelWidth="10" Width="140" runat="server" Name="EndTime" Format="Y-M-d H:i:s" SubmitFormat="Y-M-d HH:i:s" FieldLabel="至" EmptyText="请选择结束日期"></ext:DateField>
                                    <ext:Button ID="Button9" Icon="Magnifier" runat="server" Text="搜索" MarginSpec="0 0 0 10">
                                        <Listeners>
                                            <Click Fn="SearchWhereOperation"></Click>
                                        </Listeners>
                                    </ext:Button>
                                    <ext:ToolbarSeparator></ext:ToolbarSeparator>
                                    <ext:Button ID="Button10" Icon="ArrowRefresh" runat="server" Text="重置" MarginSpec="0 0 0 10">
                                        <Listeners>
                                            <Click Fn="RefreshOperation"></Click>
                                        </Listeners>
                                    </ext:Button>
                                </Items>
                            </ext:FormPanel>
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <Store>
                    <ext:Store ID="store8" runat="server" AutoLoad="false" PageSize="25" RemoteSort="true" RemoteFilter="true">
                        <Model>
                            <ext:Model ID="Model8" Name="storeModel" runat="server">
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
                            <ext:AjaxProxy Json="true" Url="/TagManage/GetTableDataOperation/" SimpleSortMode="true">
                                <Reader>
                                    <ext:JsonReader RootProperty="data" TotalProperty="total" ModelName="storeModel"></ext:JsonReader>
                                </Reader>
                            </ext:AjaxProxy>
                        </Proxy>
                    </ext:Store>
                </Store>
                <ColumnModel ID="ColumnModel3" runat="server" EnableColumnHide="false" Flex="2" AnchorHorizontal="100%">
                    <Columns>
                        <ext:Column ID="Column17" Align="Center" Width="120" Hidden="true" DataIndex="id" Text="ID" runat="server" />
                        <ext:Column ID="Column18" Align="Center" Width="30" Hidden="true" DataIndex="rfidKey" Text="标签码" runat="server">
                        </ext:Column>

                        <ext:Column ID="Column19" Align="Center" Width="30" Hidden="false" DataIndex="plantTo" Text="PlantTo" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column20" Align="Center" Width="30" Hidden="false" DataIndex="stockTo" Text="StockTo" runat="server" />
                        <ext:Column ID="Column21" Align="Center" Width="30" Hidden="false" DataIndex="binTo" Text="BinTo" runat="server"></ext:Column>
                        <ext:Column ID="Column22" Align="Center" Width="30" Hidden="false" DataIndex="plantFrom" Text="PlantFrom" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column23" Align="Center" Width="30" Hidden="false" DataIndex="stockFrom" Text="StockFrom " runat="server">
                        </ext:Column>
                        <ext:Column ID="Column24" Align="Center" Width="30" Hidden="false" DataIndex="binFrom" Text="BinFrom" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column25" Align="Center" Width="50" Hidden="false" DataIndex="matnr" Text="物料号" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column26" Align="Center" Width="50" Hidden="false" DataIndex="exidv" Text="SKU" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column27" Align="Center" Width="30" Hidden="false" DataIndex="action" Text="Action" runat="server">
                        </ext:Column>
                        <ext:Column ID="Column28" Align="Center" Width="50" Hidden="false" DataIndex="processingState" Text="状态" runat="server">
                            <Renderer Fn="RendererState"></Renderer>
                        </ext:Column>
                        <ext:Column ID="Column29" Align="Center" Width="50" Hidden="false" DataIndex="messageHints" Text="消息" runat="server">
                        </ext:Column>
                        <ext:DateColumn ID="DateColumn3" Align="Center" Width="50" Hidden="false" Format="Y-M-dd HH:i:s" DataIndex="recordTime" Text="操作时间" runat="server"></ext:DateColumn>
                    </Columns>
                </ColumnModel>
                <SelectionModel>
                    <ext:CheckboxSelectionModel ID="CheckboxSelectionModel3" runat="server" Mode="Simple">
                    </ext:CheckboxSelectionModel>
                </SelectionModel>
                <BottomBar>
                    <ext:PagingToolbar ID="PagingToolbar3" StoreID="store8" runat="server">

                        <Plugins>
                            <ext:ProgressBarPager ID="ProgressBarPager3" runat="server" />
                        </Plugins>
                    </ext:PagingToolbar>
                </BottomBar>
            </ext:GridPanel>
        </Items>
    </ext:Window>
    <script src="../../Content/Script/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        var rfidKeyStatic = '';
        var StoreBeforeLoad = function () {
            $("tr:odd").addClass('trbg');
        }
        var template = '<span style="color:{0};">{1}</span>';
        var RendererState = function (value) {
            return Ext.String.format(template, (value == 0) ? "green" : "red", (value == 0) ? "成功" : "失败");
        }
        var RefreshOperation = function () {
            App.seachFormOperation.reset();
            App.rfidKeyText.setValue(rfidKeyStatic);
            SearchWhereOperation();
        }
        var SearchWhereOperation = function (a, b, c) {
            App.seachFormOperation.submit({
                url: '/TagManage/SearchWhereOperation',
                submitEmptyText: false,
                method: 'POST',
                success: function () {
                    App.store8.reload();
                    App.Window1.show();
                },
                failure: function () {

                }
            });

        }
        var LookRecordMethod = function (a, b, c) {

            rfidKeyStatic = c.data.Code;
            var titleValue = '<span style="color:red;">' + rfidKeyStatic + '</span>';
            titleValue += '<span style="color:black;"> 的记录</span>';
            App.Window1.setTitle(titleValue);
            App.rfidKeyText.setValue(rfidKeyStatic);
            SearchWhereOperation();
        }
        /*表格搜索*/
        var SearchWhere = function (a, b, c) {
            //console.log(App.seachForm.getForm().getValues());
            App.seachForm.submit({
                url: '/TagManage/SearchWhere',
                submitEmptyText: false,
                method: 'POST',
                success: function () {
                    App.store1.reload();
                },
                failure: function () {

                }
            });
        }
        /*表格搜索*/
        var SearchWhereBound = function (a, b, c) {
            var data = App.boundForm.getForm().getValues();
            data.Tag_id = App.TextField1.getValue();
            Ext.Ajax.request({
                url: "/TagBind/SearchWhereToId",
                params: data,
                success: function (response, options) {
                    App.store2.reload();
                },
                failure: function (a, b) {
                }
            });
        }
        /*表单验证*/
        var IsValidForm = function (a, b, c) {
            App.Button5.setDisabled(!b);
        }
        var IsValidFormCog = function (a, b, c) {
            App.ButtonCog.setDisabled(!b);
        }
        /*激活状态*/
        var ActivedMethod = function (value) {
            return '<span' + (value == 1 ? ' style="color:green;">已激活' : ' style="color:red;">未激活') + '</span>';

        }
        /*是否绑定*/
        var BoundedMethod = function (value) {
            return '<span' + (value == '已绑定' ? ' style="color:green;">已绑定' : ' style="color:red;">未绑定') + '</span>';

        }
        /*是否已入库*/
        var InbinMethod = function (value) {
            return '<span' + (value == 1 ? ' style="color:green;">已入库' : ' style="color:red;">未入库') + '</span>';

        }
        /*表格数据的添加方法*/
        var AddMethod = function () {
            App.tableDataForm.reset();
            App.DateField5.setValue(GetDateTime());
            App.win.setTitle("添加");
            SearchWhereBound();
            App.win.show();
            App.Button5.setDisabled(true);
        }
        var CogEditMethod = function (a, b, c) {
            App.FormCog.reset();
            App.FormCog.loadRecord(c);
            //App.TextField9.setValue(records.selected.items[0].data.Code);
            App.winCog.show();
        }
        var EditSaveCogMethod = function () {
            App.FormCog.submit({
                url: '/TagManage/EditSaveCogMethod',
                submitEmptyText: false,
                waitMsg: '正在保存...',
                method: 'POST',
                success: function (a, b) {
                    App.winCog.hide();
                    var data = JSON.parse(JSON.parse(b.response.responseText).message);
                    App.store1.reload();
                    Ext.Msg.alert('提示', data.Code + "，" + data.Msg);
                },
                failure: function (a, b, c) {
                }
            });

        }
        var SelectButtonMethod = function (a, b, c) {
            if (b == 'CogEdit') {
                CogEditMethod(a, b, c);
            }
            if (b == 'Record') {
                LookRecordMethod(a, b, c);
            }
        }
        /*获取当前日期*/
        function GetDateTime() {
            var dateStr = '';
            var date = new Date();
            dateStr += date.getFullYear() + "-";
            dateStr += AppendLength((date.getMonth() + 1)) + "-";
            dateStr += AppendLength(date.getDate());
            dateStr += " ";
            dateStr += AppendLength(date.getHours()) + ":";
            dateStr += AppendLength(date.getMinutes()) + ":";
            dateStr += AppendLength(date.getSeconds());
            return dateStr;
        };
        /*长度变为两位*/
        function AppendLength(number) {

            if (parseInt(number) < 10) {
                number = "0" + number;
            }
            return number;

        }
        /*表格数据的双击方法*/
        var RowsDbClick = function (a, b, c) {
            App.tableDataForm.loadRecord(b);
            SearchWhereBound();
            App.win.setTitle("编辑");
            App.win.show();
        }
        /*表格数据的编辑方法*/
        var EditSaveMethod = function () {
            //console.log(App.tableDataForm.getForm().getValues());
            App.tableDataForm.submit({
                url: '/TagManage/EditSaveMethod',
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
                    Ext.Msg.alert('提示', "操作失败,该标签号已存在");
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
                        url: "/TagManage/DeleteMethod/",
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