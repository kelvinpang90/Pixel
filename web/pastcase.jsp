<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/index.css">
    <title>过往案例</title>
</head>

<body class="top_bg" >
	<jsp:include page="include/top.jsp" flush="true"/>
	
	<div class="past_case_first">
		<a href="pastcase_detail_3.html"><img id="case1" src="${pageContext.request.contextPath}/upload/common/20150208/1423393760540(min).jpg" width="480" height="243" style="width: 480px;height: 243px;"/></a>
        <a href="pastcase_detail_5.html"><img id="case2" src="${pageContext.request.contextPath}/upload/common/20150208/1423394838182(min).jpg" width="945" height="243" style="width: 945px;height: 243px;"/></a>
        <a href="pastcase_detail_4.html"><img id="case3" src="../images/cases_p3.jpg" style="width: 832px;height: 195px;"></a>
        <a href="pastcase_detail_6.html"><img id="case4" src="${pageContext.request.contextPath}/upload/common/20150208/1423394979626(min).jpg" style="width: 591px;height: 195px;" /></a>
	</div>
	<div class="clear"></div>
	<Div class="past_case_title">
		<div class="bt">PAST CASES <br />过往项目</div>
	</Div>
	<div class="past_case_list">
		<div class="container" style="padding-top:20px;">
			<div class="case_li"><a href="pastcase_detail_3.html">2012GAFA先锋音乐会</a></div>
			<div class="case_li"><a href="pastcase_detail_4.html">2013温碧泉年度会议</a></div>
			<div class="case_li"><a href="pastcase_detail_5.html">2013丰田新车发布会</a></div>
			<div class="case_li"><a href="pastcase_detail_6.html">2015友邦启动大会</a></div>
			<div class="case_li"><a href="pastcase_detail_7.html">三安光电展厅</a></div>
			<div class="case_li"><a href="pastcase_detail_8.html">2012奥运英伦巴士立体投影</a></div>
			<div class="case_li"><a href="pastcase_detail_9.html">2014广州国际灯光节</a></div>
			<div class="case_li"><a href="pastcase_detail_10.html">时空猎人网络及电视广告</a></div>
			<div class="clear"></div>
			<br>
			<br>
			<br>
			<div class="case_li1">富田菊</div>
			<div class="case_li1">2011广州亚运景观设计</div>
			<div class="case_li1">柱体造型影像</div>
			<div class="case_li1">神魔</div>
			<div class="case_li1">HYPER酒吧影像设计</div>
			<div class="case_li1">777酒吧</div>
			<div class="case_li1">7-11 周年庆典多媒体</div>
			<div class="case_li1">VIVO产品发布会</div>
			<div class="case_li1">2012海心沙跨年倒数</div>
			<div class="case_li1">NIKE夜跑活动多媒体</div>
			<div class="case_li1">2013碧桂园年会</div>
			<div class="case_li1">2014南国书香节骑楼投影</div>
			<div class="case_li1">黄陵县展馆多媒体</div>
			<div class="case_li1">2013腾讯大粤网年会</div>
			<div class="case_li1">2014温碧泉产品发布会</div>
			<div class="case_li1">新疆塔县展馆多媒体</div>
			<div class="case_li1">罗琦2015全国巡回演唱会</div>
			<div class="case_li1">中建四局展馆多媒体</div>
			<div class="case_li1">粤电展厅多媒体</div>
			<div class="case_li1">福特野马酷跑团活动多媒体</div>
			<div class="case_li1">华信十周年晚会</div>
			<div class="case_li1">安踏厦门新店庆典</div>
			<div class="case_li1">贵州铜仁酒吧</div>
			<div class="case_li1">汇丰展厅多媒体</div>
			<div class="case_li1">福特野马酷跑团活动多媒体</div>
			<div class="case_li1">无限极五四宣导大会</div>
			<div class="case_li1">雅丽洁2014年度庆功盛会</div>
		</div>
	</div>
	
	
<jsp:include page="include/bottom.jsp" flush="true"/>
	<script>
		$(document).ready(function(){
			var image=new Image();
			var img = $("#case1");
			image.src=img.attr('src');
			var newWidth = document.body.clientWidth*0.33;
			var newHeight = ((document.body.clientWidth*0.33)/this.width)*this.height;
			$(img).css('width',newWidth);
			$(img).css('height',newHeight);

			image=new Image();
			img = $("#case2");
			image.src=img.attr('src');
			newWidth = document.body.clientWidth*0.67;
			newHeight = ((document.body.clientWidth*0.67)/this.width)*this.height;
			$(img).css('width',newWidth);
			$(img).css('height',newHeight);

			image=new Image();
			img = $("#case3");
			image.src=img.attr('src');
			newWidth = document.body.clientWidth*0.58;
			newHeight = ((document.body.clientWidth*0.58)/this.width)*this.height;
			$(img).css('width',newWidth);
			$(img).css('height',newHeight);

			image=new Image();
			img = $("#case4");
			image.src=img.attr('src');
			newWidth = document.body.clientWidth*0.42;
			newHeight = ((document.body.clientWidth*0.42)/this.width)*this.height;
			$(img).css('width',newWidth);
			$(img).css('height',newHeight);
		});
	</script>
</body>
</html>
