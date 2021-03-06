﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SystemInfo.aspx.cs" Inherits="SystemInfo" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>@ViewBag.Title</title>
    <link href="~/Scripts/extjs-4.2.1/resources/css/ext-all-neptune.css" rel="stylesheet" type="text/css" />
    <script src="~/Scripts/extjs-4.2.1/ext-all-debug.js" type="text/javascript">
        Ext.define('MyApp.Application', {
            name: 'MyApp',
            extend: 'Ext.app.Application',
            launch: function () {
                Ext.create('Ext.Container.ViewPort', {
                    layout: 'fit',
                    items: [
                    {
                        title: 'Hello Ext',
                        html: 'Hello, welcome to Ext JS!'
                    }
                ]
                });
            }
        });
    </script>
    <script src="~/Scripts/extjs-4.2.1/locale/ext-lang-zh_CN.js" type="text/javascript"></script>
    <!--<script type="text/javascript" src="~/Scripts/extjs-4.2.1/bootstrap.js"></script>-->
</head>
<body>
   <form id="form1" runat="server">
    <div>
         
        <asp:Label ID="Label1" runat="server" Text="机器名称:" 
            meta:resourcekey="Label1Resource1"></asp:Label>
        <asp:Label ID="Label_Name" runat="server" Text="Label" 
            meta:resourcekey="Label_NameResource1"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="IPv4地址:" 
            meta:resourcekey="Label2Resource1"></asp:Label>
        <asp:Label ID="Label_IPv4" runat="server" Text="Label" 
            meta:resourcekey="Label_IPv4Resource1"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="IPv6地址:" 
            meta:resourcekey="Label3Resource1"></asp:Label>
        <asp:Label ID="Label_IPv6" runat="server" Text="Label" 
            meta:resourcekey="Label_IPv6Resource1"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" Text="客户端机器名称:" 
            meta:resourcekey="Label4Resource1"></asp:Label>
        <asp:Label ID="Label_clientname" runat="server" Text="Label" 
            meta:resourcekey="Label_clientnameResource1"></asp:Label>
        <br />
        <asp:Label ID="Label5" runat="server" Text="客户端IP:" 
            meta:resourcekey="Label5Resource1"></asp:Label>
        <asp:Label ID="Label_clientip" runat="server" Text="Label" 
            meta:resourcekey="Label_clientipResource1"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" 
            meta:resourcekey="Button1Resource1" />
        <br />
        <asp:TextBox ID="TextBox_CPU" runat="server" Height="82px" TextMode="MultiLine" 
            meta:resourcekey="TextBox_CPUResource1"></asp:TextBox>
         
    </div>
    </form>

</body>
</html>
