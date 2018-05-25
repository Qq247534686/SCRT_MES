<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Index</title>

    <style>
        html, body {
            height: 100%;
            margin: 0px;
            background-color: white;
            font-family: "微软雅黑";
            color: black;
        }

        .tab {
            border-collapse: collapse;
            border: 3px solid #61a0a8;
            width: 92%;
            font-size: 0.8em;
            text-align: center;
            height: 100%;
        }

        th {
            font-size: 1.5em;
        }

        tr {
            font-size: 1.7em;
            height: 2em;
            font-weight: 800;
        }
    </style>
</head>
<body>
    <table style="width: 100%; height: 100%;" border="1" class="tab" id="problemAnalysis">
    </table>
    <script src="../../Content/Script/jquery-3.2.1.min.js"></script>
    <script>
        $(function () {
            var tableHead = '<tr style="background-color: #009688; ">'
           + '<th>标签</th>'
           + '<th>物料号</th>'
           + '<th>SKU</th>'
           + '<th>Action</th>'
           + '<th>PlantTo</th>'
           + '<th>StockTo</th>'
           + '<th>BinTo</th>'
           + '<th>PlantFrom</th>'
           + '<th>StockFrom</th>'
           + '<th>BinFrom</th>'
           + '<th>记录时间</th>'
           + '</tr>';

            function getProblemAnalysis() {
                $.ajax({
                    url: '/ProblemAnalysis/GetProblemAnalysis?count=10',
                    success: function (data) {
                        $('#problemAnalysis').html(tableHead);
                        if (data != null && data.length > 0) {
                            var appendStr = '';
                            for (var i = 0; i < data.length; i++) {
                                appendStr += ((i == 0 || i % 2 == 0) ? '<tr style="background-color:aliceblue;">' : '<tr>');
                                appendStr += '<td>' + (data[i].rfidKey == null ? '' : data[i].rfidKey) + '</td>';
                                appendStr += '<td>' + (data[i].matnr == null ? '' : data[i].matnr) + '</td>';
                                appendStr += '<td>' + (data[i].exidv == null ? '' : data[i].exidv) + '</td>';
                                appendStr += '<td>' + (data[i].action == null ? '' : data[i].action) + '</td>';
                                appendStr += '<td>' + (data[i].plantTo == null ? '' : data[i].plantTo) + '</td>';
                                appendStr += '<td>' + (data[i].stockTo == null ? '' : data[i].stockTo) + '</td>';
                                appendStr += '<td>' + (data[i].binTo == null ? '' : data[i].binTo) + '</td>';
                                appendStr += '<td>' + (data[i].plantFrom == null ? '' : data[i].plantFrom) + '</td>';
                                appendStr += '<td>' + (data[i].stockFrom == null ? '' : data[i].stockFrom) + '</td>';
                                appendStr += '<td>' + (data[i].binFrom == null ? '' : data[i].binFrom) + '</td>';
                                appendStr += '<td>' + (data[i].recordTime == null ? '' : data[i].recordTime) + '</td>';
                                appendStr += '</tr>';
                            }

                            var tableInfo = tableHead + appendStr;
                            $('#problemAnalysis').html(tableInfo);
                        }
                    }

                })
            };
            getProblemAnalysis();
             var clo = window.setInterval(getProblemAnalysis, 3000);

        })
    </script>
</body>
</html>