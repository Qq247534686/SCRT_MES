$(function () {
    // Pace.restart();
    //runInvokTime();
    var chat = $.connection.hubsHelp;
    $.connection.hub.start().done(function () {
        chat.server.getPullData();
        chat.server.getBinStockData();
        chat.server.getMaterialChartData();
        chat.server.getMaterialChartDataWeekly();
    });
    /*判断值是否是null或者undefined*/
    function isNull(value) {
        if (value == null || value == undefined) {
            value = '';
        }
        return value;
    }
    /*定时刷新图表*/
    function runInvokTime() {
        window.setInterval(function () {
            //setOptionStockChange
        }, 10000);
    }
    /*入库绑定，右边的看板*/

    var colors = new Array("#fcce10", "#e87c25", "#b5c334", "#fe8463", "#60c0dd", "#d7504b", "#26c0c0");
    var color_num = 0;
    var mats = new Array();
    chat.client.setStockDataTable = function (data) {
        if (data.total > 0) {
            $('#tr002 ~ tr').remove();
            for (var i = 0; i < data.total; i++) {
                if (data.data[i].stockCode != "1102") continue;
                var wlhs = data.data[i].wlh == '' ? '' : (data.data[i].wlh + '').split(',');
                var skus = data.data[i].sku == '' ? '' : (data.data[i].sku + '').split(',');
                var numberImg = '';

                for (var j = 0; j < wlhs.length; j++) {
                    var wlh = wlhs[j] == "empty" ? "" : wlhs[j];
                    var sku = skus[j] == "empty" ? "" : skus[j];

                    var info = "background:yellow;";
                    var border = "border:none;";
                    if (wlh == "" || sku == "") {
                        info = "background:#bfbfbf;height:2.6em;";
                        border = "border:none;"
                    } else {
                        if (typeof (mats[wlh]) == "undefined") {
                            mats[wlh] = colors[color_num];
                            info = "background:" + colors[color_num] + ";";
                            color_num++;
                            if (color_num >= colors.length) color_num = 0;
                        } else {
                            info = "background:" + mats[wlh] + ";";
                        }
                    }
                    numberImg += "<div style='" + info + "background-size:1.4em 1.4em;width: 7.5em;float:right;margin-right:0.2em;margin-top:0.2em;margin-bottom:0.2em;'><div style='text-align:center;font-size:0.9em;font-weight:bold;" + border + "'>" + wlh + "</div><div style='" + border + "margin-top:0em;font-weight:bold;font-size:0.9em;text-align:center;border:1px solid gray;'>" + sku + "</div></div>";
                }
                $('#kanTable').append('<tr><td style="font-size:large;font-weight:bold">' + data.data[i].stockCode + '<td style="font-size:large;font-weight:bold">' + data.data[i].binCode + '</td><td><div class="total_box">' + wlhs.length + '</div></td><td style="text-align:left">' + numberImg + '</td></tr>');
            }
        }
        $('#trB').addClass("classtrB");
    }
    /*拉动，左边的看板*/
    chat.client.setPullDataTable = function (data) {
        $('#tr001 ~ tr').remove();
        if (data.total > 0) {
            for (var i = 0; i < data.total; i++) {
                if (data.data[i].stockLocFrom != "1102") continue;
                var numberImg = '';
                for (var j = 0; j < data.data[i].totalNumber; j++) {
                    numberImg += '<img src="../../Content/Images/wlu.png" class="transport_icon"/>';
                }
                $('#pullTable').append('<tr><td style="font-size:large;padding:0.1em 0;font-weight:bold">' + data.data[i].stockLocFrom + '<br />' + data.data[i].stockBinFrom + '</td><td style="font-size:large;font-weight:bold"><span>' + data.data[i].stockLocTo + '</span><br />' + isNull(data.data[i].assLine) + '<br />' + isNull(data.data[i].linePoint) + '</td><td style="text-align:center"><div class="total_box">' + data.data[i].totalNumber + '</div></td><td>' + numberImg + '</td></tr>');
            }
        }
        else {
            //var str = '';
            //for (var i = 0; i < 2; i++) {
            //    $('#tr001').parent().append('<tr><td></td><td></td><td></td><td></td></tr>');
            //}
        }
        $('#trA').addClass("classtrA");
    }

    function PrefixInteger(num, n) {
        return (Array(n).join(0) + num).slice(-n);
    }

    function timedMaterial() {
        var item = items[k];
        if (item.data) {
            if (item.data[0].X.length > 0) {
                var option1 = {
                    title: {
                        text: 'Daily Stock',
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        orient: 'horizontal',
                        y: '30',
                        data: [item.bin]
                    },
                    dataZoom: [
                        {
                            show: false,
                            realtime: false,
                            start: 0,
                            end: 100
                        }
                    ],
                    grid: {
                        bottom: 30,
                        left: 25,
                        right: 40
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: item.data[0].X,
                            axisLabel: {
                                formatter: function (data) {
                                    var rdate = new Date(Date.parse(data.replace(/-/g, "/")));
                                    return rdate.getHours() + ":" + PrefixInteger(rdate.getMinutes(), 2);
                                }
                            }
                        }
                    ],
                    toolbox: {
                        show: false,
                        feature: {
                            magicType: { type: ['line'] }
                        }
                    },
                    yAxis: [
                        {
                            minInterval: 1,
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: item.bin,
                            type: 'bar',
                            barMaxWidth: 30,
                            data: item.data[0].Y,
                            color:['#27727b'],
                            //itemStyle: {
                            //    //通常情况下：
                            //    normal: {
                            //        //每个柱子的颜色即为colorList数组里的每一项，如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
                            //        color: function (params) {
                            //            var colorList = ['#27727b'];
                            //            return colorList[params.dataIndex];
                            //        }
                            //    }
                            //},
                            markLine: {
                                data: [{
                                    type: 'max', name: 'max', lineStyle: {
                                        normal: { color: '#27727b' }
                                    }
                                }, {
                                    type: 'min', name: 'min', lineStyle: {
                                        normal: { color: '#27727b' }
                                    }
                                }]
                            }
                        }
                    ]
                };

                dailyStock.setOption(option1);
            }
        }
        k++;
        if (k == items.length) k = 0;
        $('#trC').addClass("classtrC");
    }

    function timedMaterialWeekly() {
        if (kw == itemsw.length) kw = 0;
        var item = itemsw[kw];
        if (item.data[0].X.length > 0) {
            var option2 = {
                title: {
                    text: 'Stock Change',

                    x: 'center'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    orient: 'horizontal',
                    y: '30',
                    data: [item.bin]
                },
                grid: {
                    bottom: 30,
                    left: 25,
                    right: 40
                },
                xAxis: [
                    {
                        type: 'category',
                        data: item.data[0].X,
                        axisLabel: {
                            formatter: function (data) {
                                return "W" + data;
                            }
                        }
                    }
                ],
                yAxis: [
                    {
                        minInterval: 1,
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: item.bin,
                        type: 'line',
                        showSymbol: true,
                        data: item.data[0].Y,
                        itemStyle: {
                            //通常情况下：
                            normal: {
                                //每个柱子的颜色即为colorList数组里的每一项，如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
                                color: function (params) {
                                    var colorList = ['#e87c25'];
                                    return colorList[params.dataIndex];
                                }
                            }
                        }
                    }
                ]
            };
            stockChange.setOption(option2);
        }
        kw++;
    }

    var k = 0;
    var t;
    var items;

    var kw = 0;
    var tw;
    var itemsw;

    /**/
    chat.client.setPullDailyDataForMaterial = function (data) {
        if (data.data.length > 0) {
            window.clearInterval(t);
            items = data.data;
            timedMaterial();
            t = window.setInterval(timedMaterial, 5000);
        }
    }

    chat.client.setMaterialChartDataWeekly = function (data) {
        if (data.data.length > 0) {
            window.clearInterval(tw);
            itemsw = data.data;
            timedMaterialWeekly();
            tw = window.setInterval(timedMaterialWeekly, 5000);
        }
    }

    var min = 0;
    var second = 0;
    var timeArray = new Array();
    while (min <= 23) {
        var timeItem = [min, second];
        timeArray.push(timeItem);
        second = second + 30;
        var timeItem = [min, second];
        timeArray.push(timeItem);
        if (second = 60) {
            second = 0;
            min++;
        }
    }

    var timeStrArr = new Array();
    for (var i = 0; i < timeArray.length; i++) {
        timeStrArr.push(timeArray[i][0].toString() + ":" + pad(timeArray[i][1], 2))
    }

    var weekStrArr = new Array();
    for (var i = 30; i <= 50; i++) {
        weekStrArr.push("W" + i.toString());
    }

    var value01Arr = new Array();
    var value02Arr = new Array();
    var v1 = 14;
    for (var i = 0; i < 48; i++) {
        if (i >= 4 && i <= 18) {
            value01Arr.push(24);
            continue;
        }
        value01Arr.push(Math.round(v1));
        v1 = v1 / 1.2;
        if (v1 < 8) v1 = 24;
    }
    var v2 = 14;
    for (var i = 0; i < 48; i++) {
        if (i >= 12 && i <= 18) {
            value02Arr.push(24);
            continue;
        }
        value02Arr.push(Math.round(v2));
        v2 = v2 / 1.2;
        if (v2 < 8) v2 = 24;
    }

    function pad(num, n) {
        var len = num.toString().length;
        while (len < n) {
            num = "0" + num;
            len++;
        }
        return num;
    }

    var option1 = {
        title: {
            text: 'Daily Stock',
            x: 'center'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            orient: 'horizontal',
            y: '30',
            data: null
        },

        grid: {
            bottom: 30,
            left: 25,
            right: 100
        },
        xAxis: [
            {
                type: 'category',
                data: null,
                axisLabel: {
                    formatter: function (data) {
                        var rdate = new Date(Date.parse(data.replace(/-/g, "/")));
                        return rdate.getHours() + ":" + rdate.getMinutes();
                    }
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
            }
        ],
        series: [
            {
                name: null,
                type: 'bar',
                data: null
            }
        ]
    };
    var dailyStock = echarts.init(document.getElementById('dailyStock'));

    dailyStock.setOption(option1);

    var option2 = {
        title: {
            text: 'Stock Change',

            x: 'center'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            orient: 'horizontal',
            y: '30',
            data: null
        },
        grid: {
            bottom: 100,
            left: 25
        },
        xAxis: [
            {
                type: 'category',
                data: null
            }
        ],
        yAxis: [
            {
                type: 'value'
            }
        ],
        series: [
            {
                name: null,
                type: 'line',
                showSymbol: false,
                data: null
            }
        ]
    };
    var stockChange = echarts.init(document.getElementById('stockChange'));
    stockChange.setOption(option2);
});