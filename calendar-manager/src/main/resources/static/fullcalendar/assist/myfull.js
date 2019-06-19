$(function () {
    //页面加载完初始化日历
    $('#calendar').fullCalendar({
        header: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },//设置日历头部信息
        customButtons: {
            myCustomButton: {
                text: 'custom!',
                click: function () {
                    alert('点击了自定义按钮!');
                }
            }
        },
        businessHours: {
            dow: [1, 2, 3, 4], // 周一 - 周四
            start: '10:00', // 上午10点开始
            end: '18:00', // 下午18点结束
        },
        firstDay: 1,//每行第一天为周一
        events: {
            url: 'JsonServlet.json',
            type: 'get'
        },
        //设置是否显示周六和周日，设为false则不显示
        weekends: true,
        selectable: true, //允许用户拖动
        // 点击多选日期
        select: function (startDate, endDate, allDay, jsEvent, view) {
            var start = $.fullCalendar.formatDate(startDate, 'yyyy-MM-dd');
            var end = $.fullCalendar.formatDate(endDate, 'yyyy-MM-dd');
            console.table(start,end)
            $.fancybox({
                'type': 'ajax',
                'href': '/fullcalendar/initEditPage.do?start=' + start + '&end=' + end
                //'href': 'event.jsp?action=add&date=' + start + '&end=' + end
            });
        },

        //点击某一天时促发
        dayClick: function (date, allDay, jsEvent, view) {
            var selDate = $.fullCalendar.formatDate(date, 'yyyy-MM-dd');
            $.fancybox({
                'type': 'ajax',
                'href': '/fullcalendar/initEditPage.do?selDate=' + selDate
            });
        },

        eventMouseover : function( event ) {
            //do something here...
            console.log('鼠标经过 ...');
            console.log('eventMouseover被执行，选中Event的title属性值为：', event.title);
            // ...
        },
        eventMouseout : function( event ) {
            //do something here...
            console.log('eventMouseout被执行，选中Event的title属性值为：', event.title);
            console.log('鼠标离开 ...');
            // ...
        },

        //单击事件项时触发
        eventClick: function (calEvent, jsEvent, view) {
            console.log('eventClick中选中Event的id属性值为：', calEvent.id);
            console.log('eventClick中选中Event的title属性值为：', calEvent.title);
            console.log('eventClick中选中Event的color属性值为：', calEvent.color);
            console.log('eventClick中选中Event的className属性值为：', calEvent.className);
            console.log(view);
            $.fancybox({
                'type': 'ajax',
                'href': '/fullcalendar/initEditPage.do?selDate = ' + calEvent.id
                //'href': 'event.jsp?action=edit&id=' + calEvent.id
            });
        },

        //Event是否可被拖动或者拖拽
        editable: true,
        //Event被拖动时的不透明度
        dragOpacity: 0.5,
        //拖动事件
        eventDrop: function (event, dayDelta, minuteDelta, allDay, revertFunc) {
            //do something here...
            console.log('eventDrop --- start ---');
            console.log('eventDrop被执行，Event的title属性值为：', event.title);
            if(dayDelta._days != 0){
                console.log('eventDrop被执行，Event的start和end时间改变了：', dayDelta._days+'天！');
            }else if(dayDelta._milliseconds != 0){
                console.log('eventDrop被执行，Event的start和end时间改变了：', dayDelta._milliseconds/1000+'秒！');
            }else{
                console.log('eventDrop被执行，Event的start和end时间没有改变！');
            }
            //revertFunc();
            console.log('eventDrop --- end ---');


            $.post("EventDoServlet?action=drag", {
                id: event.id,
                daydiff: dayDelta,
                minudiff: minuteDelta,
                allday: allDay
            }, function (msg) {
                if (msg != 1) {
                    alert(msg);
                    revertFunc(); //恢复原状
                }
            });
        },

        //日程事件的缩放
        eventResize: function (event, dayDelta, minuteDelta, revertFunc) {
            //do something here...
            console.log(' --- start --- eventResize');
            console.log('eventResize被执行，Event的title属性值为：', event.title);
            if(dayDelta._days != 0){
                console.log('eventResize被执行，Event的start和end时间改变了：', dayDelta._days+'天！');
            }else if(dayDelta._milliseconds != 0){
                console.log('eventResize被执行，Event的start和end时间改变了：', dayDelta._milliseconds/1000+'秒！');
            }else{
                console.log('eventResize被执行，Event的start和end时间没有改变！');
            }
            //revertFunc();
            console.log('--- end --- eventResize');
            // ...

            $.post("EventDoServlet?action=resize", {
                id: event.id,
                daydiff: dayDelta,
                minudiff: minuteDelta
            }, function (msg) {
                if (msg != 1) {
                    alert(msg);
                    revertFunc();
                }
            });
        }

    });
});



/** *
//月视图下日历格子宽度和高度的比例
aspectRatio: 1.35,
//月视图的显示模式，fixed：固定显示6周高；liquid：高度随周数变化；variable: 高度固定
weekMode: 'liquid',
//初始化时的默认视图，month、agendaWeek、agendaDay
defaultView: 'month',
//agenda视图下是否显示all-day
allDaySlot: true,
//agenda视图下all-day的显示文本
allDayText: '全天',
//agenda视图下两个相邻时间之间的间隔
slotMinutes: 30,
//区分工作时间
businessHours: true,
//非all-day时，如果没有指定结束时间，默认执行120分钟
defaultEventMinutes: 120,
//设置为true时，如果数据过多超过日历格子显示的高度时，多出去的数据不会将格子挤开，而是显示为 +...more ，点击后才会完整显示所有的数据
eventLimit: true,
* */