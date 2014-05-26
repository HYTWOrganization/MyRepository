<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestCPU.aspx.cs" Inherits="TestCPU" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Scripts/extjs-4.2.1/resources/css/ext-all.css" rel="stylesheet" />
    <!--<script type="text/javascript" src="Scripts/extjs-4.2.1/ext-all.js"></script>-->
    <!--<script type="text/javascript" src="Scripts/extjs-4.2.1/ext-all-dev.js"></script>-->
    <script type="text/javascript" src="Scripts/extjs-4.2.1/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
<script type="text/javascript">
    /*function init_ext() {
    }
    Ext.onReady(init_ext);*/
    //alert("2");
    Ext.require('Ext.chart.*');

    Ext.onReady(function () {
        var chart, timeAxis;

        Ext.create('Ext.Button', {
            text: '获取CPU利用率',
            renderTo: Ext.getBody(),
            handler: function () {
                Ext.Ajax.request({
                    //url: 'AjaxTest.aspx/Ajax_Func2',
                    url: 'returnCPUInfo.aspx',
                    params: { a: 10, b: 20 },
                    method: 'GET',
                    success: function (response, options) {
                        Ext.MessageBox.alert('成功', '从服务端获取结果: ' + response.responseText);
                    },
                    failure: function (response, options) {
                        Ext.MessageBox.alert('失败', '请求超时或网络故障,错误编号：' + response.status);
                    }
                });
            },
            id: "bt1"
        });


        var generateData = (function () {
            var data = [], i = 0,
            last = false,
            date = new Date("April 2 2013 10:10:1"),
            seconds = +date,
            min = Math.min,
            max = Math.max,
            random = Math.random;
            return function () {
                data = data.slice();
                data.push({
                    date: Ext.Date.add(date, Ext.Date.SECOND, i++),
                    visits: min(100, max(last ? last.visits + (random() - 0.5) * 20 : random() * 100, 0))
                });
                last = data[data.length - 1];
                return data;
            };
        })();

        var group = false,
        groupOp = [{
            dateFormat: 'H i s',
            groupBy: 'hour,minute,second',
        }, {
            dateFormat: 'H i s',
            groupBy: 'hour,minute,second',
        }];

        function regroup() {
            group = !group;
            var axis = chart.axes.get(1),
            selectedGroup = groupOp[+group];
            axis.dateFormat = selectedGroup.dateFormat;
            axis.groupBy = selectedGroup.groupBy;
            chart.redraw();
        }

        var store = Ext.create('Ext.data.JsonStore', {
            fields: ['date', 'visits'],
            data: generateData()
        });

        var intr = setInterval(function () {
            var gs = generateData();
            var toDate = timeAxis.toDate,
            lastDate = gs[gs.length - 1].date,
            markerIndex = chart.markerIndex || 0;
            if (+toDate < +lastDate) {
                markerIndex = 1;
                timeAxis.toDate = lastDate;
                timeAxis.fromDate = Ext.Date.add(Ext.Date.clone(timeAxis.fromDate), Ext.Date.SECOND, 1);
                chart.markerIndex = markerIndex;
            }
            store.loadData(gs);
        }, 1000);

       /* var myDate = new Date();  
        myDate.getYear();      //获取当前年份(2位)
        myDate.getFullYear();  //获取完整的年份(4位,1970-????)
        myDate.getMonth();      //获取当前月份(0-11,0代表1月)
        myDate.getDate();      //获取当前日(1-31)
        var myHour = myDate.getHours();      //获取当前小时数(0-23)
        var myMinute = myDate.getMinutes();    //获取当前分钟数(0-59)
        var mySecond = myDate.getSeconds();    //获取当前秒数(0-59)

        var historyDayFromDate = new Date();  //时间轴起始时间
        var historyDaytoDate = new Date();    //时间轴截止时间
        historyDaytoDate.setSeconds(historyDayFromDate.getSeconds()+10);*/

        var win = Ext.create('Ext.window.Window', {
            width: 800,
            height: 600,
            minHeight: 400,
            minWidth: 550,
            maximizable: true,
            title: 'CPU utilization Chart',//表格标题
            autoShow: true,
            layout: 'fit',
            items: [{
                xtype: 'chart',
                style: 'background:#fff',
                itemId: 'chartCmp',
                store: store,
                shadow: false,
                animate: true,
                axes: [{
                    type: 'Numeric',
                    minimum: 0,
                    maximum: 100,
                    position: 'left',
                    fields: ['visits'],
                    title: 'CPU utilization',//纵坐标
                    grid: {
                        odd: {
                            fill: '#dedede',
                            stroke: '#ddd',
                            'stroke-width': 0.5
                        }
                    }
                }, {
                    type: 'Time',
                    position: 'bottom',
                    fields: 'date',  //数据绑定
                    title: 'Time',//横坐标
                    dateFormat: 'H:i:s',
                    groupBy: 'hour,minute,second', //精确度
                    aggregateOp: 'sum',

                    constrain: true,
                    fromDate: new Date("April 2 2013 10:10:1"),
                    toDate: new Date("April 2 2013 10:10:10"),
                    //fromDate: historyDayFromDate,
                    //toDate: historyDaytoDate,
                    grid: true
                }],
                series: [{
                    type: 'line',
                    smooth: false,
                    axis: ['left', 'bottom'],
                    xField: 'date',
                    yField: 'visits',
                    label: {
                        display: 'none',
                        field: 'visits',
                        renderer: function (v) { return v >> 0; },//格式化呈现数据的方法
                        'text-anchor': 'middle'
                    },
                    markerConfig: {
                        radius: 5,  //曲线图上点的样式
                        size: 5
                    }
                }
                    ]
            }]
        });
        chart = win.child('#chartCmp');
        timeAxis = chart.axes.get(1);//初始化时间轴对象
    });
</script>