// JavaScript Document
$(function() {
    var tmp;
    $('.paper').each(function() {
        tmp = $(this).css('z-index');
        if (tmp > zIndex)
            zIndex = tmp;
    })

    make_draggable($('dl'));

    $("#fancy").fancybox({
        'type': 'ajax',
        'modal': true,
        'titleShow': false,
    });

    $("#color li").live('click', function() {
        $(this).addClass("current").siblings().removeClass("current");
    });

    $("#addbtn").live('click', function(e) {
        var txt = $("#content").val();
        var username = $("#username").val();
        if (txt == "") {
            $("#content").focus();
            return false;
        }
        if (username == "") {
            $("#msg").html("请输入您的姓名！");
            $("#user").focus();
            return false;
        }
        var left = 0;
        var top = 0;
        var color_id = $("#color").children("li.current").attr("data-color-id");
        var data = {
            'zIndex': ++zIndex,
            'content': txt,
            'user': username,
            'left': left,
            'top': top,
            "color_id": color_id
        };
        $.post('ajax.php?act=add', data, function(msg) {
            zIndex = zIndex++;
            if (parseInt(msg) >0) {
                var str = "<dl class='paper a" + color_id + " ui-draggable' data-id='" + msg + "' style='left:" + left + "px;top:" + top + "px;z-index:" + zIndex + "'>\n\
<dt><span class='username'>" + username + "</span><span class='num'>6</span></dt>\n\
<dd class='content'>" + txt + "</dd><dd class='bottom'><span class='time'>刚刚</span>\n\
<a class='close' href='javascript:void(0);'></a></dd></dl>";
                $(".container").append(str);
                make_draggable($('dl'));
                $.fancybox.close();
            }else if(msg == -1){
                alert("该愿望被其他人许愿了！..")
            }else {
                alert(msg);
            }
        });
        e.preventDefault();
    });
    $("#box_close").live('click', function(e) {
        $.fancybox.close();
    });
    $(".close").live('click', function(e) {
        
        var obj_close = $(this);
        var id = obj_close.parents("dl").attr("data-id");
        $.get("ajax.php?act=delete", {id: id}, function(data) {
            if (data == 1) {
                obj_close.parents("dl").fadeOut();
            }else{
                alert("演示地址只有管理员才能删除！");
            }
        })
    });
});

var zIndex = 0;
function make_draggable(elements) {
    elements.draggable({
        handle: 'dt', //拖动把手
        opacity: 0.8,
        containment: 'parent', //拖动范围 
        start: function(e, ui) {
            ui.helper.css('z-index', ++zIndex)
        },
        stop: function(e, ui) {
            $.get('ajax.php?act=update_position', {
                x: ui.position.left,
                y: ui.position.top,
                z: zIndex,
                id: parseInt(ui.helper.attr("data-id"))
            });
        }
    });
}