<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>齿条存储区物料监控</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link href="../../Content/Css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../Content/Css/style.css">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <style>
        h3, .h3 {
            font-size: 40px;
        }

        h4, .h4 {
            font-size: 30px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">

        <div class="row">
            <div class="col-lg-6">
                <h3 class="block_title col-lg-12">物料监控 SH00</h3>
                <h4 class="block_title col-lg-12">库存情况 (Bin Stock)&nbsp;&nbsp;&nbsp;<a href="/ChartMainMenu"><img style="height: 0.5em;" src="../../Content/Images/home_white.png" /></a></h4>
            </div>
            <div class="col-lg-6">
                <ul class="msg_main_box" id="inputInfo">
                </ul>
            </div>
        </div>
        <div class="row" id="binStockView">
        </div>
        <div class="row">
            <h4 class="block_title">拉动看板 (Transport KANBAN)</h4>
        </div>
        <div class="row" id="transport_box">
        </div>
    </div>
    <script src="../../Content/Script/jquery.min.js"></script>
    <script src="../../Content/Script/bootstrap.min.js"></script>
    <script src="../../Content/Script/jquery.signalR-2.2.2.min.js"></script>
    <script src="/signalr/hubs"></script>
    <script>
        $(function () {
            var t1 = window.setInterval(animationMethod, 1000);
            function animationMethod() {
                $('div[isAnimation="1"]').fadeToggle(2000, function () {
                    $('div[isAnimation="1"]').each(function (a, b, c) {
                        $(this).attr('isAnimation', "0");
                        $(this).fadeIn();

                    });

                });
            };
            var array = [];
            var chat = $.connection.hubsHelp;
            $.connection.hub.start().done(function () {
                chat.server.getBinStock();
                chat.server.getBinStockTransport();
            });
            chat.client.setInputBinStock = function (data) {
                console.log(data);
                if (array.length >= 3) {
                    array.shift();
                }
                array.push(data);
                var info = '';
                for (var i = 0; i < array.length; i++) {
                    info += '<li class="block_title msg_box">' + array[i].binCode + ' ' + array[i].action + ' ' + array[i].time + '</li>'

                }
                $('#inputInfo').html(info);
            }
            chat.client.setBinStock = function (data) {
                //console.log(data)
                if (data != null && data.length > 0) {
                    var str = '';
                    for (var i = 0; i < data.length; i++) {
                        str += ' <div class="col-lg-3 bin_box bin_box_blue" isAnimation="' + data[i].IsAnimation + '">'
                            + '<div class="col-lg-10"><div class="bin_box_title col-lg-6">LOC:' + data[i].LOC + '</div>'
                            + '<div class="bin_box_title col-lg-6" style="color: lime;">BIN:' + data[i].BIN + '</div>'
                            + '<div class="col-lg-12 bin_box_title">' + data[i].MATNR + '</div>'
                            + '</div><div class="col-lg-2 num_box">' + data[i].COUNT + '</div>'
                            + '</div>';
                    }
                    $('#binStockView').html(str);
                }
            }
            chat.client.setBinStockTransport = function (data) {
                $("#transport_box").html('');
                //console.info(data);
                if (data != null && data.length > 0) {
                    var str = '';
                    for (var i = 0; i < data.length; i++) {
                        var curDate = new Date().getTime();
                        var createDate = new Date(Date.parse(data[i].insertTime)).getTime();
                        var pastTime = (curDate - createDate) / 1000;
                        var classColor = "bin_box_green";
                        if (parseInt(pastTime / 60) > 15 && parseInt(pastTime / 60) < 30) {
                            var classColor = "bin_box_orange";
                        }
                        else if (parseInt(pastTime / 60) >= 30) {
                            classColor = "bin_box_red";
                        }
                        str += '<div class="col-lg-3 bin_box ' + classColor + '"><div class="col-lg-12">'
                        str += '<div class="bin_box_title col-lg-7">FROM:' + data[i].stockLocFrom + '</div>';
                        str += '<div class="bin_box_title col-lg-5">TO:' + data[i].stockLocTo + '</div>';
                        str += '<div class="bin_box_title col-lg-7">' + data[i].matnr + '</div><div class="bin_box_title col-lg-5">BIN:' + data[i].stockBinFrom + '</div>';
                        str += '<div class="bin_box_title col-lg-12 transportTimeBox" createTime ="' + data[i].insertTime + '" id="timeFeed">TIME PAST: ' + PrefixInteger(parseInt(pastTime / 60), 2) + ':' + PrefixInteger(parseInt(pastTime % 60), 2) + '</div>';
                        str += '</div></div>';
                    }
                    $("#transport_box").html(str);
                }

            }
            var checkPastTimer;
            checkPastTimer = window.setInterval(checkPastTime, 1000);

            function checkPastTime() {

                $(".transportTimeBox").each(function (e) {
                    var curDate = new Date().getTime();
                    var createDate = new Date(Date.parse($(this).attr("createTime"))).getTime();
                    var pastTime = (curDate - createDate) / 1000;

                    var classColor = "bin_box_green";
                    if (parseInt(pastTime / 60) > 15 && parseInt(pastTime / 60) < 30) {
                        $(this).parent().parent().removeClass("bin_box_red");
                        $(this).parent().parent().removeClass("bin_box_green");
                        $(this).parent().parent().addClass("bin_box_orange");
                    }
                    else if (parseInt(pastTime / 60) >= 30) {
                        $(this).parent().parent().removeClass("bin_box_red");
                        $(this).parent().parent().removeClass("bin_box_green");
                        $(this).parent().parent().addClass("bin_box_red");
                    }

                    $(this).html("TIME PAST: " + PrefixInteger(parseInt(pastTime / 60), 2) + ':' + PrefixInteger(parseInt(pastTime % 60), 2));
                });
            }

            function PrefixInteger(num, n) {
                return (Array(n).join(0) + num).slice(-n);
            }
        });
    </script>
</body>
</html>