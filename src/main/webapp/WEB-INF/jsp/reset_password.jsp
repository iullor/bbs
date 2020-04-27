<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>重置密码</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/random-code.js"></script>
    <!--重置密码的样式-->
    <style>
        body {
            background-color: #f5f5f5;
        }

        .row:first-child {
            margin-top: 8%;
        }

        .row .col-md-3 {
            margin-top: 10%;
        }

        .form-group > .col-md-7 > label {
            margin-top: 10%;
            margin-left: -7%;
        }

        .form-group > .col-md-7 > input {
            margin-left: -7%;
        }

        .form-group:last-child {
            margin-top: 40px;
            padding-left: 30px;
        }

        .form-group:last-child > button {
            margin-left: 20px;

        }

        .info {
            position: absolute;
            left: 35%;
            bottom: 50px;
            color: black;
            padding: 10px;
        }

        #codeImg {
            width: auto;
            margin-top: 25px;
            margin-left: -20px;
            font-family: Arial, 宋体;
            font-style: italic;
            font-size: 16px;
            color: green;
            border: 0;
            padding: 2px 3px;
            letter-spacing: 3px;
            font-weight: bolder;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-offset-2 col-md-2">
            <h3 class="text-warning">重置密码</h3>
        </div>
        <div class="col-md-3">
            <form action="${pageContext.request.contextPath}/user/resetPassword" method="post">
                <div class="form-group">
                    <label for="myUsername">用户名</label>
                    <input type="text" class="form-control" name="username" id="myUsername">
                </div>
                <div class="form-group">
                    <label for="myEmail">预留邮箱</label>
                    <input type="email" name="email" id="myEmail" class="form-control">
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-7">
                            <label for="inputCode">验证码</label>
                            <input type="text" class="form-control" id="inputCode">
                        </div>
                        <div class="col-md-5">
                            <input type="button" id="codeImg" onclick="createCode()" style="width:60px"
                                   title='点击更换验证码'/>
                            <span><a href="#" onclick="createCode()">换一张</a></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-info">重置</button>
                    <button type="reset" class="btn btn-info"> 取消</button>
                </div>
            </form>
        </div>
    </div>
    <div class="info text-center">
        <h4>我们将根据您的账号和预留的邮箱，为您重置密码。 <br> 稍后请登录您的邮箱，请注意查看！</h4>
    </div>
</div>
</body>
</html>