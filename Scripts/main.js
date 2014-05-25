Ext.application({
    name: "HelloExt",
    launch: function () {
        Ext.create('Ext.panel.Panel', {
            width: 1024,
            height: 720,
            layout: 'border',
            items: [{
                region: 'north',
                xtype: 'panel',
                height: 100,
                html: '<h>系统信息实时监控系统</h>',
                margins: '0 5 5 5'
            }, {
                region: 'south',
                xtype: 'panel',
                height: 20,
                split: false,
                html: '欢迎登录!',
                margins: '0 5 5 5'
            }, {
                title: '菜单栏',
                region: 'west',
                layout:'anchor',
                xtype: 'panel',
                margins: '5 0 0 5',
                width: 200,
                collapsible: true,
                id: 'west-region-container',
                layout: 'fit',
                items: [
                    {
                        xtype: 'button',
                        text: 'click me',
                        height: 50,
                        scale: 'medium',
                        handler: function() {
                            alert("you clicked the button");
                        }
                    }, {
                        xtype: 'button',
                        text: 'click me2',
                        scale: 'medium',
                        handler: function () {
                            alert("you clicked the button");
                        }
                    },
                    {
                        xtype: 'button',
                        text: 'click me3',
                        scale: 'medium',
                        handler: function () {
                            alert("you clicked the button");
                        }
                    }, {
                        xtype: 'button',
                        text: 'click me4',
                        scale: 'medium',
                        handler: function () {
                            alert("you clicked the button");
                        }
                    }

                ]
            }, {
                title: '内容',
                region: 'center',
                xtype: 'panel',
                layout: 'fit',
                margins: '5 5 0 0',
                html: '这是中间'
            }],
            renderTo: Ext.getBody()
        });
    }
});