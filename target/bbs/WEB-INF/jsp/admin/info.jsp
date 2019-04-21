<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理页面首页</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <link rel="stylesheet" href="/css/admin/admin_pages.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <style>
        .footer {
            position: fixed;
            height: 20px;
            width: 100%;
            background-color: green;
            bottom: 2px;
            font-size: 17px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="text-danger text-center">
        <h2>系统信息</h2>
    </div>
    <div class="row">
        <div class="col-md-4">
            <span class="glyphicon glyphicon-user"></span> 在线人数: <span id="online-account" class="text-grey">15120</span>
        </div>
        <div class="col-md-4">
            <span class="glyphicon glyphicon-th"></span> 板块数: <span id="" class="text-grey">150</span>

        </div>
        <div class="col-md-4">
            <span class="glyphicon glyphicon-flag"></span>帖子数:<span class="text-grey">15120</span>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-4">
            管理员
        </div>
        <div class="col-md-4">
            审核员
        </div>
        <div class="col-md-4">
            帖子数
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-4">
            热门贴子
        </div>
        <div class="col-md-4">
            热门板块
        </div>
        <div class="col-md-4">
            热门话题
        </div>
    </div>
    <div class="footer">
        <div class="col-md-4">
            系统状态
        </div>
        <div class="col-md-4">
            系统状态
        </div>
        <div class="col-md-4">
            系统状态
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        $("body").css("height", "890px");
        $("div:last-child").css(("bottom", "10px")).css("position", "fixed");

    })
</script>
</html>