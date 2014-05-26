<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxTest.aspx.cs" Inherits="AjaxTest" %>

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
    Ext.require('Ext.chart.*');

    Ext.onReady(function () {
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

        /*new Ext.Button({
        //renderTo: "div1",
        text: "后台Ajax提交",
        region:'north',
        handler: function () {
        Ext.Ajax.request({
        url: 'Ajax_Func1',
        headers: {
        'userHeader': 'userMsg'
        },
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
        });*/
    });
 </script>