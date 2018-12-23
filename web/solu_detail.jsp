<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.pwk.com" prefix="pwk" %>
<c:set value="${pwk:getSolutionById(param.id)}" var="solution"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/index.css">
    <title>${solution.title}-解决方案</title>
</head>
<body class="top_bg" >
<jsp:include page="include/top.jsp" flush="true"/>
	<c:set value="${pwk:getPics(solution.pic)}" var="pic"/>
	<div style="margin: 0 auto;"><img id="pic" src="${pageContext.request.contextPath}/${pic[0]}" width="100%" /></div>
	<div class="solu_detail_note">
		<div class="container">
		${solution.description}
		</div>
	</div>
	<div style="margin: 0 auto;"><img id="flow" src="${pageContext.request.contextPath}/images/flow.png" width="100%" /></div>
	
	
<jsp:include page="include/bottom.jsp" flush="true"/>
<script>
	$(document).ready(function(){
		var image=new Image();
		image.src=$("#flow").attr('src');
		var newWidth = document.body.clientWidth;
		var newHeight = ((document.body.clientWidth)/this.width)*this.height;
		$(this).css('width',newWidth);
		$(this).css('height',newHeight);

		image=new Image();
		image.src=$("#pic").attr('src');
		newWidth = document.body.clientWidth;
		newHeight = ((document.body.clientWidth)/this.width)*this.height;
		$(this).css('width',newWidth);
		$(this).css('height',newHeight);
	});
</script>
</body>
</html>
