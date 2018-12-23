<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.pwk.com" prefix="pwk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pwk:getCaseById(param.id)}" var="case"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/flexSlider/jquery.flexslider-min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/flexSlider/flexslider.css">
<title>${case.title}-过往案例</title>
</head>

<body class="top_bg" >
	<jsp:include page="include/top.jsp" flush="true"/>
    <c:set value="${pwk:getPics(case.pic)}" var="pics"/>
    <c:if test="${not empty pics}">
        <div id="slider" class="flexslider" style="width: 1440px;margin:0 auto;">
            <ul class="slides" style="MARGIN-RIGHT: auto; MARGIN-LEFT: auto;">
                <c:forEach items="${pics}" var="pic1">
                    <li><img src="${pageContext.request.contextPath}/${pic1}" style="max-height: 600px;"/></li>
                </c:forEach>
            </ul>
        </div>
        <div id="carousel" class="flexslider" style="width: 1440px;margin:0 auto;">
            <ul class="slides">
                <c:forEach items="${pics}" var="pic2">
                    <li><img src="${pageContext.request.contextPath}/${pic2}" style="max-height: 80px;"/></li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
	<div class="past_case_big">
		<div class="container">
			<div style="margin-left: -100px;">
                <c:if test="${not empty case.video}">
                        <embed src="${case.video}" allowFullScreen="true" quality="high" width="971" height="541" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>
                </c:if>
			</div>
			<br /><br />
			<div>
				${case.description}
			</div>
		</div>
	</div>
	
	
<jsp:include page="include/bottom.jsp" flush="true"/>
</body>
<script>
    $(window).load(function(){
        $('#carousel').flexslider({
            animation: "slide",
            controlNav: false,
            animationLoop: false,
            slideshow: false,
            itemWidth: 210,
            itemMargin: 5,
            asNavFor: '#slider'
        });
        $('#slider').flexslider({
            animation: "slide",
            controlNav: false,
            animationLoop: false,
            slideshow: false,
            sync: "#carousel",
            start: function(slider){
                $('body').removeClass('loading');
            }
        });
    });
</script>
</html>
