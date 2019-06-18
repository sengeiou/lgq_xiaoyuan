$(function () {
    //页面加载完初始化日历
    $('#calendar').fullCalendar({
        //设置日历头部信息
        customButtons: {
            myCustomButton: {
                text: '自定义按钮',
                click: function() {
                    alert('点击了自定义按钮!');
                }
            }
        },
        header: {
            left: 'prevYear,prev,next,nextYear myCustomButton today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        businessHours: {
            dow: [1, 2, 3, 4 ], // 周一 - 周四
            start: '10:00', // 上午10点开始
            end: '18:00', // 下午18点结束
        },
        firstDay: 1,//每行第一天为周一
        editable: true,//启用拖动
        events: 'JsonServlet.json',
        //点击某一天时促发
        dayClick: function (date, allDay, jsEvent, view) {
            var selDate = $.fullCalendar.formatDate(date, 'yyyy-MM-dd');
            $.fancybox({
                'type': 'ajax',
                'href': '/fullcalendar/initEditPage.do?selDate=' + selDate
            });
        },
        //单击事件项时触发
        eventClick: function (calEvent, jsEvent, view) {
            console.log(calEvent);
            console.log(jsEvent);
            console.log(view);
            $.fancybox({
                'type': 'ajax',
                'href': '/fullcalendar/initEditPage.do?selDate' + calEvent.id
                //'href': 'event.jsp?action=edit&id=' + calEvent.id
            });
        },

        //拖动事件
        eventDrop: function (event, dayDelta, minuteDelta, allDay, revertFunc) {
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
        },

        selectable: true, //允许用户拖动
        select: function (startDate, endDate, allDay, jsEvent, view) {
            var start = $.fullCalendar.formatDate(startDate, 'yyyy-MM-dd');
            var end = $.fullCalendar.formatDate(endDate, 'yyyy-MM-dd');
            $.fancybox({
                'type': 'ajax',
                'href': '/fullcalendar/initEditPage.do?selDate=' + start + '&end=' + end
                //'href': 'event.jsp?action=add&date=' + start + '&end=' + end
            });
        }
    });
});