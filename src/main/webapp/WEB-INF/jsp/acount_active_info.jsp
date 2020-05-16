<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>激活</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
    <style>
        body {
            position: absolute;
            top: 50px;
            left: 30%
        }
    </style>
</head>
<body>
<h4>请去您的邮箱激活账号，3s后自动跳转到<a href="localhost:8080/${pageContext.request.contextPath}/logon">登录主页</a></h4>
</body>
<script>
    window.setTimeout(function () {
        window.location.href = "/bbs/logon"
    }, 3000)
</script>

</html>