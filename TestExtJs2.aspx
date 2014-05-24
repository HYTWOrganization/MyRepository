<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestExtJs2.aspx.cs" Inherits="TestExtJs2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Scripts/extjs-4.2.1/resources/css/ext-all.css" rel="stylesheet" />
    <!--<script type="text/javascript" src="Scripts/extjs-4.2.1/ext-all.js"></script>-->
    <script type="text/javascript" src="Scripts/extjs-4.2.1/bootstrap.js"></script>
</head>
<body>
<!--<image src="Images/Desert.jpg" ></image>-->
<script type="text/javascript">
    function init_ext() {
        Ext.MessageBox.alert("ExtJS", "Hello ExtJS");
    }
    //alert("1");
    Ext.onReady(init_ext);
    //alert("2");
    </script>
</body>
</html>
