<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录状态</title>

<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="/css/admin/admin_pages.css">
    <style>

    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">登录信息</h2>
    <br>
    <div class="row">
        <div class="col-md-1" style="margin-top: 10px;margin-bottom: 30px;">
            <a href=""><span class="glyphicon glyphicon-arrow-left" id="back">返回</span></a>
        </div>
    </div>
    <div class="panel-group">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="panel-title">
                    <h4>${user.username}登录信息</h4>
                    <%--
                        这里的想法:用户没登录一次，就在登录信息的表中存储一次他的信息，这里呈现的是一个集合,后期完善
                    --%>
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-striped text-left">
                    <thead>
                    <th>序号</th>
                    <th>最近上线时间</th>
                    <th>最近下线时间</th>
                    <th>历史登录次数</th>
                    <th>IP地址</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td><a href="#">1</a></td>
                        <td>
                            <a href="#"><f:formatDate value="${user.userLoginInfo.accessTime}"
                                                      pattern="yyyy-MM-dd HH:mm:ss"></f:formatDate> </a>
                        </td>
                        <td><a href="#">
                            <f:formatDate value="${user.userLoginInfo.leftTime}"
                                          pattern="yyyy-MM-dd HH:mm:ss"></f:formatDate></a></td>
                        <td><a href="#">${user.userLoginInfo.accessNum}</a></td>
                        <td><a href="#">${user.userLoginInfo.ipAdreess}</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $("#back").click(function () {
            window.history.go(-1)
            return false;
        })
    })
</script>
</body>
</html>