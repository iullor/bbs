<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员登录</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commons/logon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commons/commons.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/random-code.js"></script>
    <style>
        body {
            background-image: url("${pageContext.request.contextPath}/images/bg/admin-logon-bg.jpg");
        }
    </style>
</head>
<body>
<h3>Admin-Logon</h3>
<div class="container">
    <div class="form-logon">
        <form action="${pageContext.request.contextPath}/admin/checkLogon" method="post">
            <p class="text-red" id="logon-info"></p>
            <lable><strong>用户名</strong></lable>
            <input type="text" class="form-control" name="username">
            <label>密码</label>
            <input type="password" class="form-control" name="password">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-7">
                        <label for="inputCode">验证码</label>
                        <input type="text" class="form-control" id="inputCode">
                    </div>
                    <div class="col-md-5">
                        <input type="button" id="codeImg" onclick="createCode()"
                               style="margin-top: 30px;margin-left: -25px;font-size: 16px" title='点击更换验证码'/>
                        <span style="margin-left: -5px"><a href="#" onclick="createCode()">换一张</a></span>
                    </div>
                </div>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Logon</button>
        </form>
    </div>
</div>
<script>


    /**
     * 后台登录验证码
     * @returns {boolean}
     */
    function validate2() {
        var inputCode = document.getElementById("inputCode").value.toUpperCase(); //取得输入的验证码并转化为大写
        if (inputCode.length <= 0) {
            alert("请输入验证码！");
            return false;
        } else if (inputCode != code) {
            alert("验证码输入错误，重新输入");
            createCode();//刷新验证码
            document.getElementById("inputCode").value = "";//清空文本框
            return false;
        } else { //输入正确时
            alert("正在登录...");
            return true;
        }
    }

    $(function () {
        createCode();
        $("button[type='submit']").on('click', function () {
            //前台用户名密码验证
            let username = $("input[name='username']").val();
            let password = $("input[name='password']").val();
            if (username != null && username !== '' && password != null && password !== '') {
                if (validate2()) {
                    //如果验证码正确，提交表单，等待后台验证
                    return true;
                }
                return false;
            } else {
                alert("请输入用户名或者密码")
                return false;
            }
            return false;
        });
    });
</script>
</body>
</html>