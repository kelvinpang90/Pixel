<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/index.css">

<title>解决方案</title>
</head>
<script>
    $(document).ready(function(){


        $('.solu_cent .pic').hover(
                function()
                {
                    $(this).children('.none_div').stop(true,true).slideDown(300);
                },function()
                {
                    $(this).children('.none_div').stop(true,true).slideUp(300);
                }
        );

    });
</script>
<body class="top_bg" >
	<jsp:include page="include/top.jsp" flush="true"/>
	
	<div class="solu_bg">
		<div class="solu_cent">
			<div class="pic" onclick="location.href='solu_detail_2.html'"><img src="../images/solu_pic1.jpg" width="242" height="145" /><div class="font">3D MAPPING<br />三维图形</div><div class="none_div"><div class="bt">3D MAPPING</div><div class="none_div_con">指屏幕上的视频图像与现实中的立体空间造型结合，获得“裸眼三维”的立体视觉效果。广泛应用与发布会、商业演出、展览展示活动中，拥有极佳的视觉传播和用户体验，是数字娱乐发展的主流趋势。</div></div></div>
			<div class="pic" onclick="location.href='solu_detail_3.html'"><img src="../images/solu_pic2.jpg" width="242" height="145" /><div class="font">ANIMATION<br />动画</div><div class="none_div"><div class="bt">ANIMATION</div><div class="none_div_con">视频动画的应用和传播范围十分广泛。我司的动画制作分为二维矢量动画、二维特效动画、立体三维动画、房地产动画、广告创意动画、影视特效动画六个类别，可充分适应客户的各类型需求。</div></div></div>
			<div class="pic" onclick="location.href='solu_detail_4.html'"><img src="../images/solu_pic3.jpg" width="242" height="145" /><div class="font">3DIGITAL GALLERY<br />数字展厅</div><div class="none_div"><div class="bt">3DIGITAL GALLERY</div><div class="none_div_con">传统的展示方式早已不能满足现代传播的需求，观众需要更直观有趣的体验。数字展厅在2010上海世博会以后，凭借立体动画、全息影像、人机互动、游戏体验的深入人心，正成为展厅的新主流。</div></div></div>
			<div class="pic" style="margin-left:117px;" onclick="location.href='solu_detail_5.html'"><img src="../images/solu_pic4.jpg" width="242" height="145" /><div class="font">DIGITAL STAGE<br />数字舞台</div><div class="none_div"><div class="bt">DIGITAL STAGE</div><div class="none_div_con">数字舞台以LED频幕、投影作为舞台的主要视觉效果，画面丰富细腻，信息承载量巨大，配合裸眼三维动画表演、可以达到震撼奇幻的视听效果，身临其境的舞台体验将让品牌信息更有效地传播。</div></div></div>
			<div class="pic" onclick="location.href='solu_detail_6.html'"><img src="../images/solu_pic5.jpg" width="242" height="145" /><div class="font">GRAPHIC DESIGN<br />平面设计</div><div class="none_div"><div class="bt">GRAPHIC DESIGN</div><div class="none_div_con">我司数字平面设计为客户提供两大类解决方案：一是品牌包装，全面从视觉系统提升品牌形象。二是传媒广告设计，针对电视、网页、印刷媒体、社交媒体，进行平面广告、视频广告的创意和制作。</div></div></div>
		</div>
	</div>

<jsp:include page="include/bottom.jsp" flush="true"/>
</body>
</html>
