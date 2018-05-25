<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>E-CALL System</title>
    <link href="../../Content/Css/home.css" rel="stylesheet" />
    <link href="../../Content/PlugCss/toastr.min.css" rel="stylesheet" />
    <link href="../../Content/Css/pace-theme-bar-flash.css" rel="stylesheet" />
    <link href="../../Content/textillate/animate.css" rel="stylesheet" />
    <style>
        #hh {
            font-weight: bold;
            font-size: 40px;
            position: absolute;
            top: 50%;
            left: 30%;
            margin: inherit;
            color: #036cc0;
        }

        #menuTree-body > div {
            border-right-color: #157fcc;
            border-right-style: solid;
        }

        .x-toolbar-default {
            background-color: #d6e6f2;
        }

        .x-toolbar-footer {
            background-color: #d6e6f2;
        }

        .x-window-header-default-top {
            background-color: #d6e6f2;
        }

        .x-panel-header-default {
            background-color: #d6e6f2;
        }

        #userName-btnInnerEl {
            font-size: 15px;
        }

        .openAll {
            background-image: url(/icons/arrow_out-png/ext.axd);
            background-repeat: no-repeat !important;
        }

        .closeAll {
            background-image: url(/icons/arrow_in-png/ext.axd);
            background-repeat: no-repeat !important;
        }
    </style>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <ext:TaskManager runat="server">
        <Tasks>
            <ext:Task AutoRun="true" Interval="1000">
                <Listeners>
                    <Update Fn="updateDate"></Update>
                </Listeners>
            </ext:Task>
        </Tasks>
    </ext:TaskManager>
    <ext:Viewport ID="Viewport1" runat="server" Layout="BorderLayout">
        <Items>
            <ext:Panel ID="Panel1" Header="false" runat="server" Title="rf-talk" Region="North" Split="false" Height="75" BodyPadding="0" Collapsible="false">
                <Items>
                    <ext:Toolbar ID="Toolbar1" Height="30" runat="server" AutoScroll="false" BaseCls="cls">
                        <Items>
                            <ext:ToolbarFill ID="ToolbarFill1" runat="server" Y="40" />
                            <ext:Label ID="clock" StyleSpec="border-left:0px solid;border-right:1px solid;padding:0 5px 0 5px;" runat="server">
                            </ext:Label>
                            <ext:ToolbarSeparator Width="5"></ext:ToolbarSeparator>
                            <ext:Label runat="server" Text="欢迎您：" PaddingSpec="0 0 18 0"></ext:Label>
                            <ext:Button ID="userName" Cls="btnBg" Icon="UserSuit" runat="server" StyleSpec="background-color:transparent; border-style:none;" Text="">
                                <Menu>
                                    <ext:Menu ID="Menu1" runat="server">
                                        <Items>
                                            <ext:MenuItem ID="MenuItem1" Icon="UserEdit" runat="server" Text="修改密码">
                                                <Listeners>
                                                    <Click Fn="updateUserInfo"></Click>
                                                </Listeners>
                                            </ext:MenuItem>
                                            <ext:MenuItem ID="MenuItem2" Icon="UserGo" runat="server" Text="安全退出">
                                                <Listeners>
                                                    <Click Fn="SignOut"></Click>
                                                </Listeners>
                                            </ext:MenuItem>
                                        </Items>
                                    </ext:Menu>
                                </Menu>
                                <Listeners>
                                    <AfterRender Handler="GetUserName()"></AfterRender>
                                </Listeners>
                            </ext:Button>
                            <ext:ToolbarSeparator Width="5"></ext:ToolbarSeparator>
                            <ext:Button ID="openAll" Cls="btnBg" IconCls="openAll" runat="server" StyleSpec="background-color:transparent; border-style:none;" Text="打开全屏">
                                <Listeners>
                                </Listeners>
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
                </Items>
            </ext:Panel>
            <ext:TreePanel
                UseArrows="true"
                Frame="false"
                ID="menuTree"
                AutoScroll="true"
                EnableDD="false"
                Animate="true"
                RootVisible="false"
                runat="server"
                Scroll="Vertical"
                Title="导航区"
                Region="West"
                Width="230"
                MinWidth="230"
                MaxWidth="400"
                Collapsible="true">
                <Loader ID="Loader1"
                    Url="/Home/GetMenu"
                    runat="server">
                    <Listeners>
                        <Load
                            Fn="loadNode"
                            Single="true" />
                    </Listeners>
                </Loader>
                <Root>
                    <ext:Node
                        NodeID="-1"
                        Checked="False"
                        Text="Root"
                        Expanded="true" />
                </Root>
                <Listeners>
                    <ItemClick
                        Handler="nodeClick(record,e);">
                    </ItemClick>
                </Listeners>
            </ext:TreePanel>
            <ext:TabPanel ID="TabPanel1" Fixed="true" runat="server" Region="Center" Cls="bgs">
                <Items>
                    <ext:Panel ID="Panel3" runat="server" Title="首页" Icon="UserHome">
                        <Content>
                            <h1 id="hh" class="tlt" data-in-effect="rollIn">欢迎进入E-CALL系统</h1>
                        </Content>
                    </ext:Panel>
                </Items>
                <Plugins>
                    <ext:TabCloseMenu ID="TabCloseMenu1" runat="server" CloseAllTabsText="关闭所有选项卡" CloseOthersTabsText="关闭其他选项卡" CloseTabText="关闭当前选项卡" CloseTabIcon="TagGreen" CloseAllTabsIcon="TagRed" CloseOtherTabsIcon="TagBlue"></ext:TabCloseMenu>
                </Plugins>
            </ext:TabPanel>
        </Items>
    </ext:Viewport>
    <ext:Window ID="userWin" Hidden="true" runat="server" Region="Center" Icon="UserEdit" Layout="BorderLayout" Modal="true" Width="350" Height="220" Title="修改用户信息">
        <Items>
            <ext:FormPanel ID="userForm" Region="Center" Frame="true" Layout="FormLayout" Padding="10" HideBorders="true" Border="false" runat="server" Title="">
                <Defaults>
                    <ext:Parameter Name="MsgTarget" Value="side" />
                </Defaults>
                <Items>
                    <ext:TextField ID="userIDBox" Name="id" runat="server" Hidden="true" FieldLabel="ID" AllowBlank="false" AnchorHorizontal="90%" />
                    <ext:TextField ID="userNameBox" Name="UserName" ReadOnly="true" MaxLength="50" runat="server" FieldLabel="用户名" AnchorHorizontal="90%" AllowBlank="false" />
                    <ext:TextField ID="userPasswordBox" Name="UserPassword" MaxLength="50" InputType="Password" AnchorHorizontal="90%" AllowBlank="false" runat="server" FieldLabel="原密码">
                    </ext:TextField>
                    <ext:TextField ID="inputPassword" Name="InputPassword" MaxLength="50" InputType="Password" AnchorHorizontal="90%" AllowBlank="false" runat="server" FieldLabel="新密码">
                        <Listeners>
                            <ValidityChange Handler="this.next().validate();" />
                            <Blur Handler="this.next().validate();" />
                        </Listeners>
                    </ext:TextField>
                    <ext:TextField ID="confirmPassword" Vtype="password" VtypeText="密码不一致" Name="ConfirmPassword" MaxLength="50" InputType="Password" AnchorHorizontal="90%" AllowBlank="false" runat="server" FieldLabel="确认密码">
                        <CustomConfig>
                            <ext:ConfigItem Name="initialPassField" Value="inputPassword" Mode="Value" />
                        </CustomConfig>
                    </ext:TextField>
                </Items>
                <Listeners>
                    <ValidityChange Fn="IsValidForm"></ValidityChange>
                </Listeners>
            </ext:FormPanel>
        </Items>
        <BottomBar>
            <ext:Toolbar ID="Toolbar2" runat="server">
                <Items>
                    <ext:ToolbarFill ID="ToolbarFill2" runat="server"></ext:ToolbarFill>
                    <ext:Button ID="btn_Save" Icon="Accept" UI="Primary" Text="保存" runat="server">
                        <Listeners>
                            <Click Fn="saveUserInfo" />
                        </Listeners>
                    </ext:Button>
                    <ext:Button ID="btn_Cross" Icon="Cross" UI="Primary" Text="取消" runat="server">
                        <Listeners>
                            <Click Handler="#{userWin}.hide();" />
                        </Listeners>
                    </ext:Button>
                </Items>
            </ext:Toolbar>
        </BottomBar>
    </ext:Window>
    <script src="../../Content/Script/jquery-1.9.1.min.js"></script>
    <script src="../../Content/PlugScript/toastr.js"></script>
    <script src="../../Content/Script/pace.min.js"></script>
    <script src="../../Content/textillate/jquery.fittext.js"></script>
    <script src="../../Content/textillate/jquery.lettering.js"></script>
    <script src="../../Content/textillate/jquery.textillate.js"></script>
    <script src="../../Content/Script/home.js"></script>
    <script src="../../Content/Script/fontAnimate.js"></script>
</body>
</html>