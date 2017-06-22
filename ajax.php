<?php
SESSION_START();
include_once('connect.php');
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
}else if ($act == 'delete') {
    if ($_SESSION['userid'] == 1) {
        $id = intval($_GET['id']);
        mysql_query("DELETE FROM `wishing_wall` WHERE `id` = " . $id . "");
        echo "1";
    } else {
        echo -1;
    }
} else if ($act == 'add') {
    $left = intval($_POST['left']);
    $top = intval($_POST['top']);
    $txt = stripslashes(trim($_POST['content']));
    $txt = htmlspecialchars($txt, ENT_QUOTES);
    $txt = mysql_real_escape_string(strip_tags($txt), $link); //过滤HTML标签，并转义特殊字符
    if (strlen($txt) < 1 || strlen($txt) > 100) {
        echo '内容长度为1~100字符之间';
        exit;
    }

    $user = stripslashes(trim($_POST['user']));
    $user = htmlspecialchars($user, ENT_QUOTES);
    $user = mysql_real_escape_string(strip_tags($user), $link);
    if (strlen($user) < 2 || strlen($user) > 30) {
        echo '姓名长度为2~10字符之间';
        exit;
    }
    $color_id = intval($_POST['color_id']);
    if ($color_id < 0 or $color_id > 5) {
        $color_id = rand(1, 5);
    }
    $time = date('Y-m-d H:i:s');
    $zIndex = $_POST['zIndex'];
    $xyz = '' . $left . '|' . $top . '|' . $zIndex;

    $query = mysql_query("SELECT id FROM wishing_wall WHERE content = '" . $txt . "'");
    $row = mysql_fetch_array($query);
    if ($row) {
        echo -1;
    } else {
        $query = mysql_query("insert into wishing_wall(content,name,color,xyz,addtime)values('$txt','$user','$color_id','$xyz','$time')");
        if ($query) {
            echo mysql_insert_id($link);
        } else {
            echo '出错了！';
        }
    }
}
?>