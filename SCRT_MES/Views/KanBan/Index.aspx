<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>现场看板</title>
    <link href="../../Content/KanBan/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        body {
            background: #454444;
        }

        h1 {
            font-weight: bold!important;
        }

        .block_title {
            color: white;
            padding: 0 0.2em;
            font-family: 'Microsoft JhengHei';
        }

        .bin_box {
            color: white;
            padding: 2.2em;
            border: 0.1em solid #454444;
        }

        .bin_box_blue {
            background-color: #0088df;
        }

        .bin_box_green {
            background-color: #119100;
        }

        .bin_box_red {
            background-color: #ff4242;
        }

        .bin_box_deepblue {
            background-color: #0251e3;
        }

        .bin_box_orange {
            background-color: #ff4e00;
        }

        .bin_box_purple {
            background-color: #b701be;
        }

        .bin_box_gray {
            background-color: #00b5b3;
        }

        .bin_box_title {
            font-size: 1.5em;
            font-weight: bold;
        }

        .num_box {
            font-size: 3.5em;
            font-weight: bold;
            text-align: center;
        }

        .msg_box {
            text-align: right;
            font-size: 2em;
            list-style: none;
            margin-top: 0.1em;
            font-weight: bold;
        }

        .msg_main_box {
            margin-top: 0.8em;
        }

        .bin_box_title {
            font-family: 'Microsoft JhengHei';
            font-weight: bold;
            margin: 0;
        }

        .bin_box {
            border: 0.5em solid #454444;
        }

        .bin_box_title img {
            height: 5em;
        }

        .num_box {
            text-align: right;
        }

        .map_box {
            height: 20em;
        }
    </style>
    <script type="text/javascript" src="../../Content/KanBan/jquery.min.js"></script>
    <script type="text/javascript" src="../../Content/KanBan/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../Content/KanBan/echarts.js"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 bin_box bin_box_blue">
                <div class="bin_box_title col-lg-6">
                    <h1>今日入库数量</h1>
                </div>
                <div class="bin_box_title col-lg-6 num_box">
                    <h1>0</h1>
                </div>
            </div>
            <div class="col-lg-6 bin_box bin_box_blue">
                <div class="bin_box_title col-lg-6">
                    <h1>今日出库数量</h1>
                </div>
                <div class="bin_box_title col-lg-6 num_box">
                    <h1>0</h1>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 bin_box bin_box_blue ">
                <div class="bin_box_title col-lg-6">
                    <h1>实时: 2018-01-22 23:26:01 入库铁质料架1个</h1>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 bin_box bin_box_blue ">
                <div id="day_chart_in" class="map_box"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 bin_box bin_box_blue ">
                <div id="day_chart_out" class="map_box"></div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            var day_chart_in = echarts.init(document.getElementById('day_chart_in'));
            var day_chart_out = echarts.init(document.getElementById('day_chart_out'));

            var option_in = {
                title: {
                    text: '今日入库分时统计',
                    textStyle: {
                        color: '#fff',
                        fontSize: 32
                    }
                },
                color: ['white'],
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [
					{
					    type: 'category',
					    data: ['8:00 ~ 9:00', '9:00 ~ 10:00', '10:00 ~ 11:00', '11:00 ~ 12:00', '12:00 ~ 13:00', '13:00 ~ 14:00', '14:00 ~ 15:00', '15:00 ~ 16:00', '16:00 ~ 17:00', '17:00 ~ 18:00'],
					    axisTick: {
					        alignWithLabel: true
					    },
					    axisLabel: {
					        show: true,
					        interval: 0,
					        textStyle: {
					            color: '#fff',
					            fontSize: 14
					        }
					    },
					    axisLine: {
					        lineStyle: {
					            color: '#fff',
					            width: 2
					        }
					    }

					}
                ],
                yAxis: [
					{
					    type: 'value',
					    axisLabel: {
					        show: true,
					        textStyle: {
					            color: '#fff',
					            fontSize: 14
					        }
					    },
					    axisLine: {
					        lineStyle: {
					            color: '#fff',
					            width: 2
					        }
					    }
					}
                ],
                series: [
					{
					    name: '入库',
					    type: 'bar',
					    barWidth: '60%',
					    data: [10, 52, 200, 334, 390, 330, 220, 390, 330, 220, ]
					}
                ]
            };

            day_chart_in.setOption(option_in);

            var option_out = {
                title: {
                    text: '今日出库分时统计',
                    textStyle: {
                        color: '#fff',
                        fontSize: 32
                    }
                },
                color: ['white'],
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [
					{
					    type: 'category',
					    data: ['8:00 ~ 9:00', '9:00 ~ 10:00', '10:00 ~ 11:00', '11:00 ~ 12:00', '12:00 ~ 13:00', '13:00 ~ 14:00', '14:00 ~ 15:00', '15:00 ~ 16:00', '16:00 ~ 17:00', '17:00 ~ 18:00'],
					    axisTick: {
					        alignWithLabel: true
					    },
					    axisLabel: {
					        show: true,
					        interval: 0,
					        textStyle: {
					            color: '#fff',
					            fontSize: 14
					        }
					    },
					    axisLine: {
					        lineStyle: {
					            color: '#fff',
					            width: 2
					        }
					    }

					}
                ],
                yAxis: [
					{
					    type: 'value',
					    axisLabel: {
					        show: true,
					        textStyle: {
					            color: '#fff',
					            fontSize: 14
					        }
					    },
					    axisLine: {
					        lineStyle: {
					            color: '#fff',
					            width: 2
					        }
					    }
					}
                ],
                series: [
					{
					    name: '出库',
					    type: 'bar',
					    barWidth: '60%',
					    data: [10, 52, 200, 334, 390, 330, 220, 390, 330, 220, ]
					}
                ]
            };

            day_chart_out.setOption(option_out);
        });
	</script>
</body>
</html>