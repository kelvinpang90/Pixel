<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="三维动画,二维动画,创意策划,数字舞台,裸眼三维,立体投影,动画影视,特效,活动策划,广告,数字展厅,互动,交互,设计,影子舞,立体舞台,3DMapping,投影舞台,春晚舞台,数字动画,开场动画,表演视频,微电影,数字婚礼,户外活动,最牛开场舞,数字,演唱会,李宇春,舞台,影像骑士,VJ,DJ,夜场表演,酒吧投影,幻影成像,全息,虚拟现实,AR技术,全息幕,透明屏,初音演唱会,特效后期,影视制作,原创动画,世博会,多媒体,企业宣传,视频包装,投影表演,互动表演,互动游戏,汽车,发布会"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/index.css">
<title>Pixel</title>
</head>

<body class="home_bg" >
<script type="text/javascript">
	$(document).ready(function(){
		$.get("/index/sleep.do",function(data){
			window.location.href="home.html";
		});
	});
</script>
</body>
</html>