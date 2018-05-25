<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>齿条存储区物料详情</title>
    <link href="../../Content/Css/dataView.css" rel="stylesheet" />
    <link href="../../Content/Css/pace-theme-bar-flash.css" rel="stylesheet" />
</head>

<body>
    <table style="width: 100%; height: 100%; text-align: center">
        <tr style="">
            <td style="width: 100%;"  colspan="2">
                <div style="width: 100%;">
                    <div style="margin-top:0;font-weight:bold">Transport KANBAN(Plant SH00)<a href="/ChartMainMenu" style="float:right;"><img style="height:1em;margin-top:0.6em" src="../../Content/Images/home_black.png" /></a></div>
                    <table class="tab" id="pullTable" style="width: 100%; margin-top:0.2em;">
                        <tr style="height: 10%;" id="tr001">
                            <th style="width: 5%;">From</th>
                            <th style="width: 10%;">To</th>
                            <th style="width: 5%;">Count</th>
                            <th style="width: 80%;"></th>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </td>
            </tr>
        <tr>
            <td style="width: 40%;"  colspan="2">
                <div style="width: 100%;">
                    <div style="margin-top:0;font-weight:bold">Bin Stock(Plant SH00)</div>
                    <table class="tab" style="width: 100%; margin-top:0.2em;">
                         <tr>
                            <th style="width: 5%;">Loc.</th>
                            <th style="width: 5%;">Bin</th>
                            <th style="width: 5%;">Total</th>
                            <th style="width: 85%;">In ------>------>------>------> Out</th>
                        </tr>

                    </table>
                    <div id="kanBox" style="width:100%;overflow-y:scroll;height:28em">
                    <table class="tab" id="kanTable" style="width: 100%;">
                        <tr style="height: 10%;" id="tr002">
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                     </div>
                </div>
            </td>
        </tr>
        <tr >
            <td style="text-align:center" colspan ="2"><span id="controlRolling" style="cursor:pointer;font-weight:bold;color:#808080">||</span></td>
        </tr>
        <tr >
            <td style="width: 50%; height: 100%;">
                <div id="dailyStock" style="width:98%; height: 90%; margin: 0em 0em 0% 0em;">
                </div>
            </td>
            <td style="width: 50%; height: 100%;">
                <div id="stockChange" style="width:98%; height: 90%; margin: 0em 0em 0% 0%;">
                </div>
             
            </td>
        </tr>
    </table>
    <script src="../../Content/Script/jquery-1.9.1.min.js"></script>
    <script src="../../Content/Script/jquery.scrollTo.min.js"></script>
    <script src="../../Content/Script/pace.min.js"></script>
    <script src="../../Content/PlugScript/echarts.js"></script>
    <script src="../../Content/Script/jquery.signalR-2.2.2.min.js"></script>
    <script src="/signalr/hubs"></script>
    <script src="../../Content/Script/generalAssembly.js"></script>
</body>
</html>
