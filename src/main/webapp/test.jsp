<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Title</title>
    <script src="lib/jQuery/jquery-2.1.4.min.js"/>
    <script>
        window.onload = function () {
            var form = new FormData();
            form.append("username", "gyl");
            form.append("password", "123");
        }
    </script>

</head>
<body>
<form id="tf">
    <input type="file" name="img"/>
    <input type="text" name="username"/>
    <input type="button" value="提" onclick="test();"/>
</form>
<script>
    function test() {
        var form = new FormData(document.getElementById("tf"));
        $.ajax({
            url: "${pageContext.request.contextPath}/panel/fileUpload",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                console.log(data.file)
                if (data.status === 200) {
                    alert("上传成功")
                    let realPath = data.file;
                    $(":hidden[name='topicPicture']").val(realPath);
                    let contextPath = $("#showPicture").attr("path")
                    //图片回显
                    $("#showPicture").attr("src", contextPath + realPath);
                }
            }
        });
        get();//此处为上传文件的进度条
        console.log(form)
    }
</script>
</body>
</html>
