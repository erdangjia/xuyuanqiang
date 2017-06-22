<?php
include_once('connect.php');

$notes = '';
$left = '';
$top = '';
$zindex = '';
$query = mysql_query("select * from wishing_wall order by id desc limit 0, 50");
while ($row = mysql_fetch_array($query)) {
    list($left, $top, $zindex) = explode('|', $row['xyz']);
    $time = strtotime($row['addtime']);

    $notes .= "<dl class='paper a" . $row['color'] . "'  style='left:" . $left . "px;top:" . $top . "px;z-index:" . $zindex . "' data-id=" . $row['id'] . ">
<dt><span class='username'>" . $row['name'] . "</span><span class='num'>" . $row['id'] . "</span></dt>
<dd class='content'>" . $row['content'] . "</dd>
<dd class='bottom'><span class='time'>" . tranTime($time) . "</span><a class='close' href='javascript:void(0);'></a></dd>
</dl>";
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
        <title>PHP+jQuery+Ajax漂亮的许愿墙</title>
        <meta name="keywords" content="许愿墙,jQueryUI拖动" />
        <meta name="description" content="之前我们讲了PHP+MySQL+jQueryUI完美便签条http://www.erdangjiade.com/js/70.html，今天我们在此基础上做一个漂亮的许愿墙效果。" />
        <link rel="stylesheet" type="text/css" href="css/fancybox.css" />
        <link rel="stylesheet" href="css/index.css" />
    </head>
    <body>
        <div class="add">
            <a href="add_note.html" id="fancy" class="add_note"></a>
        </div>
        <div class="container"style="position: relative">
            <?php echo $notes; ?>
        </div>

        <script type="text/javascript" src="http://www.erdangjiade.com/Public/js/other/jquery.js"></script> 
        <script type='text/javascript' src='js/jquery-ui.min.js'></script>
        <script type="text/javascript" src="js/jquery.fancybox-1.3.1.pack.js"></script>
        <script type="text/javascript" src="js/global.js"></script>
    </body>
</html>
<?php
/* 时间转换函数 */

function tranTime($stime) {
    $rtime = date("m-d H:i", $stime);
    $htime = date("H:i", $stime);

    $day_time = date("j", $stime);
    $today = date("j", time());
    $ds = $today - $day_time;

    $time = time() - $stime;

    if ($time < 60) {
        $str = '刚刚';
    } elseif ($time < 60 * 60) {
        $min = floor($time / 60);
        $str = $min . '分钟前 ' . $htime;
    } elseif ($time < 60 * 60 * 24) {
        $h = floor($time / (60 * 60));
        $str = $h . '小时前 ' . $htime;
        if ($ds == 1)
            $str = '昨天 ' . $rtime;
    }
    elseif ($time < 60 * 60 * 24 * 2) {
        $str = '昨天 ' . $rtime;
        if ($ds == 2)
            $str = '前天 ' . $rtime;
    }elseif ($time < 60 * 60 * 24 * 3) {
        $str = '前天 ' . $rtime;
        if ($ds > 2)
            $str = $rtime;
    }
    else {
        $str = $rtime;
    }
    return $str;
}
?>

<!-- 以下是统计及其他信息，与演示无关，不必理会 -->
<div style="width:728px;margin:0 auto">
    <script type="text/javascript">
        /*700*90 创建于 2015-06-27*/
        var cpro_id = "u2176575";
    </script>
    <script src="http://cpro.baidustatic.com/cpro/ui/c.js" type="text/javascript"></script>
</div>