JKXT = {
    north: new Ext.panel.Panel({
        region: 'north',
        contentEl: 'main-north',
        height: 100,
        html: '<h1>系统信息实时监控系统</h1>',
        margins: '0 5 5 5'
    }),
    south: new Ext.panel.Panel({
        region: 'south',
        contentEl: 'main-south',
        height: 20,
        split: false,
        html: '欢迎登录!',
        margins: '0 5 5 5'
    }),
    west: new Ext.panel.Panel({
        title: '菜单栏',
        region: 'west',
        contentEl: 'main-west',
        margins: '5 0 0 5',
        width: 200,
        collapsible: true,
        id: 'west-region-container',
        layout: 'fit',
        items: []
    }),
    center: new Ext.panel.Panel({
        title: '内容',
        region: 'center',
        contentEl: 'main-center',
        id: 'center',
        layout: 'fit',
        margins: '5 5 0 0',
        html: '这是中间'
    }),
    menuData: [
        {
            name: '系统基本信息',
            href: 'http://www.asp.net/cn'
        }, {
            name: '菜单2',
            href: ''
        }
    ],
    clearMainPanel: function () {
        alert("clear");
        var items = JKXT.center.items;
        for (var i = items.count() - 1; i >= 0; i--) {
            JKXT.center.remove(items.get(i), true);
        }
        JKXT.center.items.clear();
        JKXT.center.body.update("");
    },
    mainPanelLoad: function (url) {
        alert("load");
        JKXT.clearMainPanel();
        Ext.get("center").mask("loading");
        JKXT.center.load({
            url: url,
            nocache: true,
            text: '载入中……',
            timeout: 30,
            scripts: true
        });
        JKXT.center.doLayout();
    }
}

Ext.onReady(function () {
    //菜单显示
    var menuPanel = new Ext.Panel({
        region: 'center',
        bodyStyle: "background-color: white; padding: 0 4px",
        border: false
    });
    for (var i = 0; i < JKXT.menuData.length; i++) {
        var menuItem = new Ext.button.Button({
            width: 190,
            height: 50,
            scale: 'large',
            text: JKXT.menuData[i].name,
            handler: function () {
                Ext.Ajax.Request({
                    url: 'returnCPUInfo.aspx',
                    method: 'GET',
                    type: 'text/html',
                    async: false,
                    success: function (response, options) {
                        alert("success");
                        //JKXT.center.body.load();
                        var ss = document.getElementById('main-center'); 
                        ss.innerHTML = 'a';
                    }
                });
            }
        });
        menuPanel.add(menuItem);
    }
    JKXT.west.add(menuPanel);
    //主界面显示
    var viewport = new Ext.Viewport({
        layout: 'border',
        renderTo: Ext.getBody(),
        items: [
			JKXT.north,
            JKXT.west,
            JKXT.center,
            JKXT.south
		]
    });
});

