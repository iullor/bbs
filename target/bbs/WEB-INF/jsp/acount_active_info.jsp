<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新用户账号激活</title>
    <style>
        body {
            position: absolute;
            top: 50px;
            left: 30%
        }
    </style>
</head>
<body>
<h4>请去您的邮箱激活账号，3s后自动跳转到<a href="localhost:8080/logon">登录主页</a></h4>
</body>
<script>
    window.setTimeout(function () {
        window.location.href = "/logon"
    }, 3000)
</script>

</html>