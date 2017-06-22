### 演示效果：[http://www.erdangjiade.com/js/136.html](http://www.erdangjiade.com/js/136.html)


### 简介二当家的素材网整理提供
教程如下：
HTML
首先我们遍历出所有的许愿列表：
$query = mysql_query("select * from wishing_wall order by id desc limit 0, 50"); 
while ($row = mysql_fetch_array($query)) { 
    list($left, $top, $zindex) = explode('|', $row['xyz']); 
    $time = strtotime($row['addtime']); 
 
    $notes .= "<dl class='paper a" . $row['color'] . "'  style='left:" . $left . "px;top:" . $top . "px;z-index:" . $zindex . "' data-id=" . $row['id'] . "> 
<dt><span class='username'>" . $row['name'] . "</span><span class='num'>" . $row['id'] . "</span></dt> 
<dd class='content'>" . $row['content'] . "</dd> 
<dd class='bottom'><span class='time'>" . tranTime($time) . "</span><a class='close' href='javascript:void(0);'></a></dd> 
</dl>";
接着我们把许愿列表放到.container里面：
<div class="container"style="position: relative"> 
  <?php echo $notes; ?> 
</div>
jQuery
通过jQueryUI拖动许愿墙悬浮层代码如下：
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
PHP
保存位置：
$act = htmlspecialchars($_GET['act']); 
if ($act == 'update_position') { 
    if (!is_numeric($_GET['id']) || !is_numeric($_GET['x']) || !is_numeric($_GET['y']) || !is_numeric($_GET['z'])) 
        die("0"); 
 
    $id = intval($_GET['id']); 
    $x = intval($_GET['x']); 
    $y = intval($_GET['y']); 
    $z = intval($_GET['z']); 
 
    mysql_query("UPDATE wishing_wall SET xyz='" . $x . "|" . $y . "|" . $z . "' WHERE id=" . $id); 
 
    echo "1"; 
}
我们再看下添加许愿代码：
<div class="add"> 
      <a href="add_note.html" id="fancy" class="add_note"></a> 
</div>
通过fancybox插件弹出add_note.html，add_note.html表单代码如下：
<div id='send-form'> 
    <p class='title'><span>许下你的愿望</span><a  id='box_close'></a></p> 
    <form action="" name='wish'> 
        <div class="per"> 
            <label for="username">昵称：</label> 
            <input type="text" name='username' id='username'/> 
        </div> 
        <div class="per"> 
            <label for="content">愿望：(您还可以输入 <span id='font-num'>50</span> 个字)</label> 
            <textarea name="content" id='content'>
添加许愿jQuery代码：
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
            if (parseInt(msg)) { 
                var str = "<dl class='paper a" + color_id + " ui-draggable' data-id='" + msg + "' style='left:" + left + "px;top:" + top + "px;z-index:" + zIndex + "'>\n\ 
<dt><span class='username'>" + username + "</span><span class='num'>6</span></dt>\n\ 
<dd class='content'>" + txt + "</dd><dd class='bottom'><span class='time'>刚刚</span>\n\ 
<a class='close' href='javascript:void(0);'></a></dd></dl>"; 
                $(".container").append(str); 
                make_draggable($('dl')); 
                $.fancybox.close(); 
            } else { 
                alert(msg); 
            } 
        }); 
        e.preventDefault(); 
    });


### 官网
[http://www.erdangjiade.com](http://www.erdangjiade.com)

演示下载也以参考这里：[http://www.erdangjiade.com/php/2744.html](http://www.erdangjiade.com/php/2744.html)

更多商城企业源码，尽在[http://www.erdangjiade.com/source](http://www.erdangjiade.com/source)

更多原创模板，尽在   [http://www.erdangjiade.com/templates](http://www.erdangjiade.com/templates)

更多网页特效下载：[http://www.erdangjiade.com/js](http://www.erdangjiade.com/js)

更多PHP/Mysql：[http://www.erdangjiade.com/php/js](http://www.erdangjiade.com/php)

     
### 网站开发QQ群 368848856


我们会非常负责的对我们提供的资源认真阅读和检查，
                       
请一直支持我们，我们会不停的提供最好的素材资源，程序员，你不是一个人在前行！

网站负责人QQ:826096331(微信和QQ同一个号)  Mail:boliufengvip@163.com



友情提示：                        
======================================================================
“学生”或“还没有工作的童鞋”可以无条件享用本站所有素材资源

======================================================================



