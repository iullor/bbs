<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commons/logon.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<h3>BBS-Student</h3>
<p class="pull-right" style="margin-top: -40px;margin-right: 30px">
    <a href="${pageContext.request.contextPath}/admin/logon"><span>管理员访问</span></a>
</p>

<div class="container">
    <div class="form-logon">
        <form action="${pageContext.request.contextPath}/checkLogon" method="get">
            <p class="text-red" id="logon-info"></p>
            <lable><strong>用户名</strong></lable>
            <input type="text" class="form-control" name="username">
            <label>密码</label>
            <span class="text-right"><a href="${pageContext.request.contextPath}/resetPassword"><small
                    class="pull-right">忘记密码？</small></a></span>
            <input type="password" class="form-control" name="password">
            <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
            <span><a href="${pageContext.request.contextPath}/index">游客访问</a></span>
            <span><a href="${pageContext.request.contextPath}/register">新用户注册</a></span>

        </form>
    </div>
    <p class="mt-5 mb-3 text-muted">&copy; 学生论坛版权所有<span><a href="#" data-toggle="modal" data-target="#exampleModal">&nbsp;&nbsp;&nbsp;联系管理员</a></span>
    </p>
    <!--添加模态框，当点击联系管理员时弹出-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">填写以下条目</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="username" class="control-label">用户名</label>
                            <input type="text" class="form-control" name="username" id="username">
                        </div>
                        <div class="form-group">
                            <label for="email" class="control-label">邮箱</label>
                            <input type="text" class="form-control" id="email">
                        </div>
                        <div class="form-group">
                            <label class="control-label">选择遇到的问题</label>
                            <select class="form-control">
                                <option value="-1">------------请选择------------</option>
                                <option value="0">账户被冻结</option>
                                <option value="1">系统问题反馈</option>
                                <option value="2">匿名举报</option>
                                <option value="3">调皮一下</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="control-label">详细描述</label>
                            <textarea class="form-control" id="message-text" cols="10" rows="10"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Send</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        var logon_infos = "${USER_STATUS}";
        if (logon_infos === "101") {
            $("#logon-info").html("用户不存在");
        } else if (logon_infos === "102") {
            $("#logon-info").html("密码错误");
        } else if (logon_infos === "103") {
            $("#logon-info").html("用户未激活");
        } else if (logon_infos === "105") {
            $("#logon-info").html("用户不存在");
        } else if (logon_infos === "1") {
            window.setInterval(function () {
               alert(1)
            }, 2000)
        } else if (logon_infos === "-1") {
            $("#logon-info").html("当前用户暂被冻结，请联系管理员！");
        } else {
            $("#logon-info").html("");
        }
    })

</script>
</body>
</html>