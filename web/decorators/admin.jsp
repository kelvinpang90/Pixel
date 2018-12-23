<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:if test="${empty sessionScope.admin}">
    <c:redirect url="${pageContext.request.contextPath}/login/index.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
    <title><decorator:title></decorator:title></title>
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-paginator.js"></script>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap/js/html5shiv.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ckfinder/ckfinder.js"></script>
    <decorator:head></decorator:head>
</head>
<body>
<div class="navbar-wrapper">
    <!-- Wrap the .navbar in .container to center it within the absolutely positioned parent. -->
    <div class="container">

        <div class="navbar navbar-inverse">
            <div class="navbar-inner">
                <!-- Responsive Navbar Part 1: Button for triggering responsive navbar (not covered in tutorial). Include responsive CSS to utilize. -->
                <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->
                <div class="nav-collapse collapse">
                    <ul class="nav">
                        <li><a href="${pageContext.request.contextPath}/back/index.jsp">Pixel</a></li>
                        <li><a href="${pageContext.request.contextPath}/back/solution/solutionList.jsp">解决方案</a></li>
                        <li><a href="${pageContext.request.contextPath}/back/cases/caseList.jsp">过往案例</a></li>
                        <li><a href="javascript:imageManagement()">图片管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/back/changePassword.jsp">修改密码</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/loginOut.do">退出登录</a></li>
                    </ul>
                </div><!--/.nav-collapse -->

            </div><!-- /.navbar-inner -->
        </div><!-- /.navbar -->

    </div> <!-- /.container -->
</div><!-- /.navbar-wrapper -->
<script>

    function imageManagement(){
        var finder = new CKFinder();
        finder.BasePath = "/ckfinder/ckfinder.js";  //导入CKFinder的路径
        finder.popup();
    }
</script>
<decorator:body></decorator:body>
</body>
</html>