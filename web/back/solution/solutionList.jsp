<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.pwk.com" prefix="pwk" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set value="${pwk:getSolutionTotal()}" var="total"/>
<html>
<head>
    <title>解决方案列表</title>
</head>
<body>
<div class="container">
    <a href="${pageContext.request.contextPath}/back/solution/solutionAdd.jsp" class="btn btn-danger">添加解决方案</a>
    <h4>解决方案列表</h4>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped table-hover">
        <tr>
            <th>排序</th>
            <th>类型</th>
            <th>标题</th>
            <th>介绍</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pwk:getSolutionByList(param.p, param.s)}" var="solution" varStatus="vs">
            <tr>
                <td class="td2">${vs.count}</td>
                <td class="td2">${solution.type eq '1'?'立体投影':solution.type eq '2'?'动画':solution.type eq '3'?'展厅多媒体':solution.type eq '4'?'数字舞台':solution.type eq '5'?'平面设计':''}</td>
                <td class="td2"><a href="${pageContext.request.contextPath}/solu_detail_${solution.id}.html" target="_blank">${solution.title}</a> </td>
                <td class="td2">${fn:substring(solution.description,0 ,100 )}...</td>
                <td class="td2">
                    <a href="${pageContext.request.contextPath}/back/solution/solutionUpdate.jsp?id=${solution.id}" class="btn btn-danger">修改</a>
                    <a href="javascript:if(confirm('确定要删除吗？')){window.location.href='${pageContext.request.contextPath}/solution/delete.do?id=${solution.id}'}" class="btn btn-success">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div id="page"></div>
<script type='text/javascript'>
    var options = {
        alignment: 'center',
        currentPage: ${empty param.p?1:param.p},
        totalPages: ${(total+10)/10},
        pageUrl: function (type, page, current) {
            return "${pageContext.request.contextPath}/back/solution/solutionList.jsp?s=10&p=" + page;
        }
    };

    $('#page').bootstrapPaginator(options);
</script>
<jsp:include page="../exclude/message.jsp"/>

</body>
</html>