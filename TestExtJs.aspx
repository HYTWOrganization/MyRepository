<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestExtJs.aspx.cs" Inherits="TestExtJs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Scripts/extjs-4.2.1/resources/css/ext-all-neptune.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/extjs-4.2.1/ext-all-debug.js" type="text/javascript"></script>
    <script src="Scripts/extjs-4.2.1/locale/ext-lang-zh_CN.js" type="text/javascript"></script>
</head>
<body>
        <script type="text/javascript">
            Ext.onReady(function () {
               /* if (Ext.BLANK_IMAGE_URL.substr(0, 4) != "data") {
                    Ext.BLANK_IMAGE_URL = "~/Images/Desert.jpg";
                }*/
                Ext.Msg.alert("提示信息", "Hello World！");
            });
    </script>
</body>
</html>
