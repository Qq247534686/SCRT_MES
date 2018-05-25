<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>库存K线图</title>
    <style>
        html,body,#mainBox{
            width:100%;
            height:100%;
            padding:0;
            margin:0;
        }
        #kLineBox {
            width:100%;
            height:90%;
        }

        #filterBox {
            padding:1em;

        }
    </style>
</head>
<body>
    <div id="mainBox">
        <div id="filterBox">
           <center> 零件号：
            <select id="part_num_select">
               
               
            </select>
               </center>
            <a href="/ChartMainMenu" style="float:right;"><img style="height:1em;" src="../../Content/Images/home_black.png" /></a>
        </div>
        <div id="kLineBox"></div>
    </div>

    <script src="../../Content/Script/jquery-1.9.1.min.js"></script>
    <script src="../../Content/PlugScript/echarts.js"></script>
    <script>

        $(function () {
            $.getJSON('/kLine/GetComBox', function (data) {
                var str = ' <option value="0">请选择</option>';
                for (var i = 0; i < data.length; i++) {
                    str += '<option value="' + data[i].Text + '">' + data[i].Text + '</option>';
                }
                $("#part_num_select").html(str);
            });
            var kLine = echarts.init(document.getElementById('kLineBox'));

            $("#part_num_select").change(function () {

                changeData($(this).val());
            });

            var upColor = '#ff4242';
            var upBorderColor = '#8A0000';
            var downColor = '#119100';
            var downBorderColor = '#008F28';

            function changeData(partNum) {
                $.post("/kLine/GetBinmatrnrecordData", { matrnCode: partNum }, function (data) {
                    console.info(data);
                    var dateArr = new Array();
                    var dataArr = new Array();
                    for (var i = 0; i < data.length; i++) {
                        var arr = data[i].split(',');
                        dateArr.push(arr[4]);
                        arr.splice(4, 1);
                        dataArr.push(arr);
                    }
                    var option = {
                        title: {
                            text: '2017年库存日K线图'
                        },
                        tooltip: {
                            trigger: 'axis',
                            formatter: function (params) {
                                var res = params[0].seriesName + ' ' + params[0].name;
                                res += '<br/>  开始 : ' + params[0].value[1] + '  最高 : ' + params[0].value[3];
                                res += '<br/>  结束 : ' + params[0].value[2] + '  最低 : ' + params[0].value[4];
                                return res;
                            }
                        },
                        legend: {
                            data: ['日K线']
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                mark: { show: true },
                                dataZoom: { show: true },
                                dataView: { show: true, readOnly: false },
                                restore: { show: true },
                                saveAsImage: { show: true }
                            }
                        },
                        dataZoom: {
                            show: true,
                            realtime: true,
                            start: 0,
                            end: 100
                        },
                        xAxis: [
                            {
                                type: 'category',
                                boundaryGap: true,
                                axisTick: { onGap: false },
                                splitLine: { show: false },
                                data: dateArr
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value',
                                scale: true,
                                boundaryGap: [0.01, 0.01]
                            }
                        ],
                        series: [
                            {
                                name: '日K线',
                                type: 'k',
                                data: dataArr,
                                itemStyle: {
                                    normal: {
                                        color: upColor,
                                        color0: downColor,
                                        borderColor: upBorderColor,
                                        borderColor0: downBorderColor
                                    }
                                }
                            }
                        ]
                    };

                    kLine.setOption(option);
                });

            }
        });
    </script>
</body>
</html>
