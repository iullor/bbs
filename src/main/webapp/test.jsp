<%--
  Created by IntelliJ IDEA.
  User: gyl
  Date: 19-3-13
  Time: 下午7:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            url: "/panel/fileUpload",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                console.log(data);
                window.clearInterval(timer);
                console.log("over..");
            },
            error: function (e) {
                alert("错误！！");
                window.clearInterval(timer);
            }
        });
        get();//此处为上传文件的进度条
        console.log(form)
    }
</script>
</body>
</html>
