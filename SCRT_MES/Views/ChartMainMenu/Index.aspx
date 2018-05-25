<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>可视化界面选择</title>
    <link href="../../Content/Css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../Content/Css/style.css">
    <style>
        .bin_box_title {
            font-family: 'Microsoft JhengHei';
            font-weight: bold;
            margin: 0;
        }

        .bin_box {
            border: 0.5em solid #454444;
            opacity: 0.8;
        }

            .bin_box:hover {
                cursor: pointer;
                color: white;
                opacity: 1;
            }

        .bin_box_title img {
            height: 5em;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <a href="/dataView" class="col-lg-6 bin_box bin_box_blue">
                <div class="bin_box_title col-lg-6">
                    <img src="../../Content/Images/grid.png" />
                </div>
                <div class="bin_box_title col-lg-6">
                    <h1>毛坯现场详情</h1>
                </div>
            </a>
            <a href="/generalAssembly" class="col-lg-6 bin_box bin_box_blue">
                <div class="bin_box_title col-lg-6">
                    <img src="../../Content/Images/chart.png">
                </div>
                <div class="bin_box_title col-lg-6">
                    <h1>齿条现场详情</h1>
                </div>
            </a>
            <a href="/newchartview" class="col-lg-6 bin_box bin_box_blue">
                <div class="bin_box_title col-lg-6">
                    <img src="../../Content/Images/book.png">
                </div>
                <div class="bin_box_title col-lg-6">
                    <h1>齿条现场概览</h1>
                </div>
            </a>
            <a href="/kline" class="col-lg-6 bin_box bin_box_blue">
                <div class="bin_box_title col-lg-6">
                    <img src="../../Content/Images/line.png">
                </div>
                <div class="bin_box_title col-lg-6">
                    <h1>齿条日K线</h1>
                </div>
            </a>
            <a href="/ProblemAnalysis" class="col-lg-6 bin_box bin_box_blue">
                <div class="bin_box_title col-lg-6">
                    <img src="../../Content/Images/wtfx.png">
                </div>
                <div class="bin_box_title col-lg-6">
                    <h1>问题分析</h1>
                </div>
            </a>
        </div>
    </div>

    <script src="../../Content/Script/jquery.min.js"></script>
    <script src="../../Content/Script/bootstrap.min.js"></script>
</body>
</html>