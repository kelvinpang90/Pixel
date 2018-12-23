<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="menu_logo"><img src="../images/menu_logo.jpg" /></div>
<div id="menu">
<jsp:include page="googAnalysis.html" flush="true"/>
    <ul>
        <li><a href="${pageContext.request.contextPath}/home.html" ${fn:contains(pageContext.request.requestURI,'home' )?'style="color: #008fa6"':''}>NEWS<div>最新动态</div></a></li>
        <li><a href="${pageContext.request.contextPath}/solu.html" ${(fn:contains(pageContext.request.requestURI,'solu'))?'style="color: #008fa6"':''}>SOLUTIONS<div>解决方案</div></a>
            <ul style="left:-150px;">
                <li><a href="${pageContext.request.contextPath}/solu_detail_2.html"><span>3D MAPPING</span><br />立体投影</a></li>
                <li><a href="${pageContext.request.contextPath}/solu_detail_3.html"><span>ANIMATION</span><br />动画</a></li>
                <li><a href="${pageContext.request.contextPath}/solu_detail_4.html"><span>DIGITAL GALLERY</span><br />展厅多媒体</a></li>
                <li><a href="${pageContext.request.contextPath}/solu_detail_5.html"><span>DIGITAL STAGE</span><br />数字舞台</a></li>
                <li><a href="${pageContext.request.contextPath}/solu_detail_6.html"><span>GRAPHIC DESIGN</span><br />平面设计</a></li>
            </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/pastcase_1.html" ${(fn:contains(pageContext.request.requestURI,'pastcase'))?'style="color: #008fa6"':''}>PAST CAST<div>过往案例</div></a></li>
        <li><a href="${pageContext.request.contextPath}/introduce.html" ${(fn:contains(pageContext.request.requestURI,'introduce'))?'style="color: #008fa6"':''}>ABOUT US<div>公司简介</div></a></li>
        <li><a href="${pageContext.request.contextPath}/contactus.html" ${(fn:contains(pageContext.request.requestURI,'contact'))?'style="color: #008fa6"':''}>CONTACT US<div>联系我们</div></a></li>
    </ul>
</div>
<script type="text/javascript">
    $(document).ready(
            function(){
                $('#menu li').hover(
                        function()
                        {
                            $(this).children('ul').stop(true,true).slideDown(300);
                            $(this).find('a:first').addClass('hover');
                        },function()
                        {
                            $(this).children('ul').stop(true,true).slideUp(300);
                            $(this).find('a:first').removeClass('hover');
                        }
                );

            });
</script>
