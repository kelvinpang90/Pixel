<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.pwk.com" prefix="pwk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pwk:getCaseById(param.id)}" var="case"/>
<html>
<head>
    <title>修改案例</title>
    <link href="${pageContext.request.contextPath}/js/uploadify/uploadify.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ckfinder/ckfinder.js"></script>
    <script>

        function deletePic(){
            $("#casePic").empty();
            $("#pic").attr("value", "");
            $("#picDiv").append("<div class='controls' id='upload'> <div id='fileQueue'></div><input type='file' name='caseUpload' id='caseUpload'/></div>");
            $("#caseUpload").uploadify({
                'fileObjName': 'caseUpload',
                'fileTypeDesc': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;',
                'swf': '${pageContext.request.contextPath}/js/uploadify/uploadify.swf',
                'uploader': '${pageContext.request.contextPath}/imageUpload?type',
                'onUploadSuccess': function (file, data, response) {
                    var picPath = $("#pic").val();
                    picPath += data;
                    $("#pic").attr("value", picPath);
                    $("#casePic").append("<img src=" + "${pageContext.request.contextPath}/" + data + " style='max-width: 300px;'><br>");
                }
            });
        }
    </script>
</head>

<body>
<div class="container">
<form action="${pageContext.request.contextPath}/case/update.do" method="post" class="form-horizontal" onsubmit="return validateForm()"
      id="theForm">
    <input type="hidden" name="id" value="${case.id}">
    <div class="control-group">
        <label class="control-label" for="title">案例名称</label>

        <div class="controls">
            <input type="text" name="title" id="title" class="input-xxlarge" placeholder="项目名称" value="${case.title}">
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="type">类型</label>

        <div class="controls">
            <select name="type" id="type">
                <option value="1" ${case.type eq 1?'selected':''}>立体投影</option>
                <option value="2" ${case.type eq 2?'selected':''}>动画</option>
                <option value="3" ${case.type eq 3?'selected':''}>展厅多媒体</option>
                <option value="4" ${case.type eq 4?'selected':''}>数字舞台</option>
                <option value="5" ${case.type eq 5?'selected':''}>平面设计</option>
            </select>
        </div>
    </div>

    <div class="control-group"  id="picDiv">
        <label class="control-label">案例图片</label>
        <input type="hidden" id="pic" name="pic" value="${case.pic}">

        <div class="controls" id="casePic">
            <c:forEach items="${pwk:getPics(case.pic)}" var="pic">
                <img src="${pageContext.request.contextPath}/${pic}" style="max-width: 300px;"/>
            </c:forEach>
            <a href="javascript:deletePic()">删除图片</a>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="video">案例视频</label>

        <div class="controls">
            <input type="text" name="video" id="video" class="input-xxlarge" placeholder="视频路径" value="${case.video}">
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="description">案例介绍</label>
    </div>
    <textarea rows="30" cols="50" name="description" id="description">${case.description}</textarea>
    <script type="text/javascript">
        var editor;
        $(document).ready(function () {
            editor = CKEDITOR.replace('description');
        })
    </script>

    <div class="control-group">
        <input type="submit" value="保存" class="btn btn-danger"/>
    </div>
</form>
</div>
<jsp:include page="../exclude/message.jsp"/>
<script>
    function validateForm(){
        $("#description").attr("value",editor.document.getBody().getHtml()) ;
        return true;
    }
</script>
</body>
</html>
