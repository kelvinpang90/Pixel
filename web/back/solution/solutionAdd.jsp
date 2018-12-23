<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加方案</title>
    <link href="${pageContext.request.contextPath}/js/uploadify/uploadify.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ckfinder/ckfinder.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
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
                    $("#solution").append("<img src=" + "${pageContext.request.contextPath}/" + data + " style='max-width: 300px;'><br>");
                }
            });
        });
    </script>
</head>
<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/solution/add.do" method="post" class="form-horizontal" onsubmit="return validateForm()"
          id="theForm">
        <div class="control-group">
            <label class="control-label" for="title">方案名称</label>

            <div class="controls">
                <input type="text" name="title" id="title" class="input-xxlarge" placeholder="方案名称">
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
            <label class="control-label" for="solutionUpload">方案图片</label>
            <input type="hidden" id="pic" name="pic">

            <div class="controls">
                <div id="fileQueue"></div>
                <input type="file" name="solutionUpload" id="solutionUpload"/>
            </div>
            <div class="controls" id="solution"></div>
        </div>

        <div class="control-group">
            <label class="control-label" for="description">方案介绍</label>
            <textarea rows="50" cols="30" name="description" id="description"></textarea>
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