<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>毛坯存储区物料监控</title>
    <link href="../../Content/Css/dataView.css" rel="stylesheet" />
    <link href="../../Content/Css/pace-theme-bar-flash.css" rel="stylesheet" />
    <style>
           .classtrA {
            height:35%;
        }
        .classtrB {
            height:30%;
        }
          .classtrC {
            height:35%;
        }
    </style>
</head>

<body>
    <table style="width: 100%; height: 100%; text-align: center">
        <tr style="height: 25%" id="trA">
            <td style="width: 100%;" colspan="2">
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
            <tr id="trB">
            <td style="width: 100%;" colspan="2">
                <div style="width: 100%;">
                    <div style="margin-top:0;font-weight:bold">Bin Stock(Plant SH00)</div>
                    <table class="tab" id="kanTable" style="width: 100%; margin-top:0.2em;">
                        <tr style="height: 10%;" id="tr002">
                            <th style="width: 5%;">Loc.</th>
                            <th style="width: 5%;">Bin</th>
                            <th style="width: 5%;">Total</th>
                            <th style="width: 85%;">In ------>------>------>------> Out</th>
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
        <tr id="trC">
            <td style="width: 50%; height: 100%;">
                <div id="dailyStock" style="width:98%; height: 70%; margin: 0em 0em 0% 0em;">
                </div>
            </td>
            <td style="width: 50%; height: 100%;">
                <div id="stockChange" style="width:98%; height: 70%; margin: 0em 0em 0% 0%;">
                </div>
             
            </td>
        </tr>
    </table>
    <script src="../../Content/Script/jquery-1.9.1.min.js"></script>
    <script src="../../Content/Script/pace.min.js"></script>
    <script src="../../Content/PlugScript/echarts.js"></script>
    <script src="../../Content/Script/jquery.signalR-2.2.2.min.js"></script>
    <script src="/signalr/hubs"></script>
    <script src="../../Content/Script/dataView.js"></script>
</body>
</html>
