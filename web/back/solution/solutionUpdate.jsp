<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.pwk.com" prefix="pwk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pwk:getSolutionById(param.id)}" var="solution"/>
<html>
<head>
    <title>修改方案</title>
    <link href="${pageContext.request.contextPath}/js/uploadify/uploadify.css" rel="stylesheet">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/uploadify/jquery.uploadify.min.js"></script>
    <script>
        function deletePic(){
            $("#solutionPic").empty();
            $("#pic").attr("value", "");
            $("#picDiv").append("<div class='controls' id='upload'> <div id='fileQueue'></div><input type='file' name='solutionUpload' id='solutionUpload'/></div>");
            $("#solutionUpload").uploadify({
                'fileObjName': 'solutionUpload',
                'uploadLimit': 1,
                'fileTypeDesc': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;',
                'swf': '${pageContext.request.contextPath}/js/uploadify/uploadify.swf',
                'uploader': '${pageContext.request.contextPath}/imageUpload',
                'onUploadSuccess': function (file, data, response) {
                    var picPath = $("#pic").val();
                    picPath += data;
                    $("#pic").attr("value", picPath);
                    $("#solutionPic").append("<img src=" + "${pageContext.request.contextPath}/" + data + " style='max-width: 300px;'><br>");
                }
            });
        }
    </script>
</head>

<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/solution/update.do" method="post" class="form-horizontal" onsubmit="return validateForm()"
          id="theForm">
        <input type="hidden" name="id" value="${solution.id}">
        <div class="control-group">
            <label class="control-label" for="title">方案名称</label>

            <div class="controls">
                <input type="text" name="title" id="title" class="input-xxlarge" placeholder="方案名称" value="${solution.title}">
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="type">类型</label>

            <div class="controls">
                <select name="type" id="type">
                    <option value="1" ${solution.type eq 1?'selected':''}>立体投影</option>
                    <option value="2" ${solution.type eq 2?'selected':''}>动画</option>
                    <option value="3" ${solution.type eq 3?'selected':''}>展厅多媒体</option>
                    <option value="4" ${solution.type eq 4?'selected':''}>数字舞台</option>
                    <option value="5" ${solution.type eq 5?'selected':''}>平面设计</option>
                </select>
            </div>
        </div>

        <div class="control-group"  id="picDiv">
            <label class="control-label">方案图片</label>
            <input type="hidden" id="pic" name="pic" value="${solution.icon}">

            <div class="controls" id="solutionPic">
                <c:forEach items="${pwk:getPics(solution.pic)}" var="pic">
                    <img src="${pageContext.request.contextPath}/${pic}" style="max-width: 300px;"/>
                </c:forEach>
                <a href="javascript:deletePic()">删除图片</a>
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="description">方案介绍</label>
            <textarea rows="50" cols="30" name="description" id="description">${solution.description}</textarea>
        </div>

        <div class="control-group">
            <input type="submit" value="保存" class="btn btn-danger"/>
        </div>
    </form>
</div>
<jsp:include page="../exclude/message.jsp"/>
<script>
    function validateForm(){
        return true;
    }
</script>
</body>
</html>
