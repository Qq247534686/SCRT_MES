<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>E-Call 系统登录</title>
    <link href="../../Content/Css/pace-theme-flash.css" rel="stylesheet" />
    <link href="../../Content/Css/login.css" rel="stylesheet" />
    <link href="../../Content/PlugCSS/toastr.min.css" rel="stylesheet" />
</head>
<body id="Body1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" Theme="Default"></ext:ResourceManager>
    <ext:FormPanel runat="server" ID="LoginForm" Url="/Login/CheckLogin" Width="250px">
        <Items>
            <ext:TextField
                ID="userName"
                AutoFocus="true"
                AllowBlank="false"
                BlankText="请填写用户名"
                Icon="User"
                Name="UserName"
                Text=""
                runat="server"
                FieldLabel="用户名">
                <Listeners>
                    <SpecialKey Fn="enter_submit" />
                </Listeners>
            </ext:TextField>
            <ext:TextField
                ID="userPassword"
                runat="server"
                AllowBlank="false"
                BlankText="请填写密码"
                Icon="Key"
                InputType="Password"
                Name="UserPassword"
                Text=""
                FieldLabel="登录密码"
                Flex="1">
                <Listeners>
                    <SpecialKey Fn="enter_submit" />
                </Listeners>
            </ext:TextField>
            <ext:Button ID="Button1" UI="Success" Cls="btn btn-primary" runat="server" Text="登录">
                <LoadingState Text="正在登录..." />
                <Listeners>
                    <Click Fn="submitForm" />
                </Listeners>
            </ext:Button>
            <ext:Button ID="Button2" Hidden="false" UI="Info" runat="server" Text="重置">
                <Listeners>
                    <Click Fn="resetForm" />
                </Listeners>
            </ext:Button>
        </Items>
    </ext:FormPanel>
    <script src="../../Content/Script/jquery-3.2.1.min.js"></script>
    <script src="../../Content/Script/pace.min.js"></script>
    <script src="../../Content/PlugScript/toastr.js"></script>
      <script src="../../Content/Script/login.js"></script>
</body>
</html>

