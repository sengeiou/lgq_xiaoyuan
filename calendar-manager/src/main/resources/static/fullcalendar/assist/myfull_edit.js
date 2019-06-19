var FullEdit = function () {

    let _saveFullFormUrl = "/fullcalendar/saveFullFrom.json";


    let _initFullcalendar = function () {
        $(".datepicker").datepicker();
        $("#isallday").click(function () {
            if ($("#sel_start").css("display") == "none") {
                $("#sel_start,#sel_end").show();
            } else {
                $("#sel_start,#sel_end").hide();
            }
        });

        $("#isend").click(function () {
            if ($("#p_endtime").css("display") == "none") {
                $("#p_endtime").show();
            } else {
                $("#p_endtime").hide();
            }
            $.fancybox.resize();//调整高度自适应
        });

        //提交表单
        /*$('#add_form').ajaxForm({
            beforeSubmit: showRequest, //表单验证
            success: showResponse //成功返回
        });*/

        //删除事件
        $("#del_event").click(function () {
            if (confirm("您确定要删除吗？")) {
                var eventid = $("#eventid").val();
                $.post("EventDoServlet?action=del", {id: eventid}, function (msg) {
                    if (msg == 1) {//删除成功
                        $.fancybox.close();
                        $('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据
                    } else {
                        alert(msg);
                    }
                });
            }
        });
    };

    let  _saveFullFrom = function () {
        $.ajax({
            url:_saveFullFormUrl,
            data: $("#full_form").serialize(),
            success:function (data) {
                console.log(data);
            }
        })
    }
    
    function showRequest() {
        var events = $("#event").val();
        if (events == '') {
            alert("请输入日程内容！");
            $("#event").focus();
            return false;
        }
    }

    function showResponse(responseText, statusText, xhr, $form) {
        if (statusText == "success") {
            if (responseText == 1) {
                $.fancybox.close();
                $('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据
            } else {
                alert(responseText);
            }
        } else {
            alert(statusText);
        }
    }

    return {
        init: function () {
            _initFullcalendar();
        },
        showBtn: function () {
            _saveFullFrom();
        }
    }
}();
FullEdit.init();
