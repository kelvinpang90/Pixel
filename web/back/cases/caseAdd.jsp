<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加案例</title>
    <link href="${pageContext.request.contextPath}/js/uploadify/uploadify.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ckfinder/ckfinder.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#caseUpload").uploadify({
                'fileObjName': 'iconUpload',
                'fileTypeDesc': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;',
                'swf': '${pageContext.request.contextPath}/js/uploadify/uploadify.swf',
                'uploader': '${pageContext.request.contextPath}/imageUpload',
                'onUploadSuccess': function (file, data, response) {
                    var picPath = $("#pic").val();
                    picPath += data;
                    $("#pic").attr("value", picPath);
                    $("#case").append("<img src=" + "${pageContext.request.contextPath}/" + data + " style='max-width: 300px;'><br>");
                }
            });
        });
    </script>
</head>
<body>
<div class="container">
<form action="${pageContext.request.contextPath}/case/add.do" method="post" class="form-horizontal" onsubmit="return validateForm()"
      id="theForm">
    <div class="control-group">
        <label class="control-label" for="title">案例名称</label>

        <div class="controls">
            <input type="text" name="title" id="title" class="input-xxlarge" placeholder="案例名称">
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="type">类型</label>

        <div class="controls">
            <select name="type" id="type">
                <option value="1">立体投影</option>
                <option value="2">动画</option>
                <option value="3">展厅多媒体</option>
                <option value="4">数字舞台</option>
                <option value="5">平面设计</option>
            </select>
        </div>
    </div>

    <div class="control-group" id="casePic">
        <label class="control-label" for="caseUpload">案例图片</label>
        <input type="hidden" id="pic" name="pic">

        <div class="controls">
            <div id="fileQueue"></div>
            <input type="file" name="caseUpload" id="caseUpload"/>
        </div>
        <div class="controls" id="case"></div>
    </div>

    <div class="control-group">
        <label class="control-label" for="video">案例视频</label>

        <div class="controls">
            <input type="text" name="video" id="video" class="input-xxlarge" placeholder="视频路径">
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="description">案例介绍</label>
    </div>
    <textarea rows="30" cols="50" name="description" id="description"></textarea>

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