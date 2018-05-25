$(function () {
    Pace.restart();
    //runInvokTime();
    var chat = $.connection.hubsHelp;
    $.connection.hub.start().done(function () {
        chat.server.getPullData();
        chat.server.getBinStockData();
        chat.server.getGeneralAssemblyMatnr();
        chat.server.getGeneralAssemblyMatnrWeek();
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
    chat.client.setStockDataTable = function (data) {
        if (data.total > 0) {
            $('#tr002 ~ tr').remove();
            for (var i = 0; i < data.total; i++) {
                var wlhs = data.data[i].wlh == ''?'':(data.data[i].wlh + '').split(',');
                var skus = data.data[i].sku == ''?'':(data.data[i].sku + '').split(',');
                var numberImg = '';
                if (data.data[i].stockCode != "6001" && data.data[i].stockCode != "6902") continue;
                for (var j = 0; j < wlhs.length; j++) {
                    
                    var wlh = wlhs[j] == "empty" ? "" : wlhs[j];
                    var sku = skus[j] == "empty" ? "" : skus[j];

                    var info = "background:yellow;";
                    var border = "border:none;";
                    if (wlh == "" || sku == "") {
                        info = "background:#bfbfbf;height:2.53em;";
                        border = "border:none;"
                    }
                    numberImg += "<div style='" + info + "background-size:1.4em 1.4em;width: 7.5em;height:3em;float:right;margin-right:0.2em;margin-top:0.5em'><div style='text-align:center;font-size:0.9em;font-weight:bold;" + border + "'>" + wlh + "</div><div style='" + border + "margin-top:0em;font-weight:bold;font-size:0.9em;text-align:center;border:1px solid gray;'>" + sku + "</div></div>";


                }
                $('#kanTable').append('<tr id="tr' + i + '"><td style="font-weight:bold;font-size:1.6em;padding:1.4em 0;width: 5%;">' + data.data[i].stockCode + '<td style="width: 5%;font-weight:bold;font-size:1.6em">' + data.data[i].binCode + '</td><td  style="width: 5%;"><div class="total_box">' + wlhs.length + '</div></td><td style="text-align:left">' + numberImg + '</td></tr>');

            }
        }
    }
    /*拉动，左边的看板*/
    chat.client.setPullDataTable = function (data) {
        if (data.data.length > 0) {
            $('#tr001 ~ tr').remove();
            for (var i = 0; i < data.data.length; i++) {
                if (data.data[i].stockLocTo != "6902") continue;
                var numberImg = '';
                var arr = data.data[i].matnr.split(',');
                for (var j = 0; j < arr.length; j++) {
                    numberImg += "<div style='float:left;background:yellow;margin-left:0.2em;font-size:0.9em;font-weight:bold'>" + arr[j]+"</div>";
                }
              
                $('#pullTable').append('<tr><td style="font-weight:bold;font-size:1.6em;padding:0.1em 0">' + data.data[i].stockLocFrom + '<br />' + data.data[i].stockBinFrom + '</td><td style="font-weight:bold;font-size:1.6em">' + data.data[i].stockLocTo + '<br />' + isNull(data.data[i].assLine) + '<br />' + isNull(data.data[i].linePoint) + '</td><td style="text-align:center"><div class="total_box">' + arr.length + '</div></td><td>' + numberImg + '</td></tr>');

            }
        }
        else {
            //var str = '';
            //for (var i = 0; i < 2; i++) {
            //    $('#tr001').parent().append('<tr><td></td><td></td><td></td><td></td></tr>');
            //}
        }
    }

    function PrefixInteger(num, n) {
        return (Array(n).join(0) + num).slice(-n);

    }
    /*格式化日期*/
    function formateDate(date) {
        return isAddOneWord(date.getHours()) + ":" + isAddOneWord(date.getMinutes()); //+ ":" + isAddOneWord(date.getSeconds());
    }
    /*一位时间值补零成两位时间值*/
    function isAddOneWord(val) {

        if (val < 10) {
            val = '0' + val;
        }
        return val;
    }
    /*二维数组绑定*/
    function ArrayJoin(array1,array2) {
        var data = new Array();
        for (var i = 0; i < array1.length; i++) {
            data[i] = new Array();
            data[i][0] = new Date(array1[i]);
            data[i][1] = array2[i];
        }
        return data;
    }
    var index = 0;
    var ccv;    
    var tth;
    var m = 1;

    function rollList() {
        if (m >= 20) { m = 1; };
        $("#kanBox").scrollTo('tr#tr' + m++, 1000);
    }

    function timedMaterial() {
       
        
        if (tth.length < 1) return;

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
                data: [tth[index].data[0].Legend]
            },

            grid: {
                bottom: 30,
                left: 25,
                right: 40
            },
            xAxis: [
                {
                    type: 'category',
                    data: tth[index].data[0].X,
                    axisLabel: {
                        formatter: function (data) {

                            var rdate = new Date(Date.parse(data.replace(/-/g, "/")));
                            return rdate.getHours() + ":" + PrefixInteger(rdate.getMinutes(), 2);
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
                    name: tth[index].data[0].Legend,
                    type: 'bar',
                    barMaxWidth: 30,
                    data: tth[index].data[0].Y,
                    itemStyle: {
                        //通常情况下：
                        normal: {
                            //每个柱子的颜色即为colorList数组里的每一项，如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
                            color: ['#27727b']
                            
                        }
                    },
                    markLine: {
                        data: [{ type: 'max', name: 'max' }, { type: 'min', name: 'min' }]
                    }
                }
            ]
        };
        dailyStock.setOption(option1);
        index++;
        if (index >= tth.length)
        {
            index = 0;
        }
        
     
         
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

                                return "W"+data;
                            }
                        }
                    }
                ],
                yAxis: [
                    {
                        minInterval : 1,
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

    var rollTimer;
    window.clearInterval(rollTimer);
    rollTimer = window.setInterval(rollList, 2000);
   
    chat.client.setGeneralAssemblyMatnr = function (data) {

        if (data.data.length > 0) {
            tth = data.data;
            timedMaterial();
            window.clearInterval(t);
            t = window.setInterval(timedMaterial, 5000);

            
        }
    }

    $("#controlRolling").click(function () {
       
        if ($("#controlRolling").text() == "||") {
            window.clearInterval(rollTimer);
            $("#controlRolling").text(">");
        } else {
            window.clearInterval(rollTimer);
            rollTimer = window.setInterval(rollList, 2000);
            $("#controlRolling").text("||");
        }
    });

    chat.client.setGeneralAssemblyMatnrWeek = function (data) {
       
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
            y: '340',
            data: null
        },

        grid: {
            bottom: 70,
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
            y: '340',
            data: null
        },
        grid: {
            bottom: 70,
            left: 25,
            right: 100
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
 

    //$("#kanBox").mouseover(function () {
            
    //    window.clearInterval(rollTimer);
    //    //rollTimer = window.setInterval(rollList, 2000);
    //});

    //$("#kanBox").mouseout(function () {

    //    rollTimer = window.setInterval(rollList, 2000);
    //});

});