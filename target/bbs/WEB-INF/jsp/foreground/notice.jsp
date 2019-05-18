<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>公告</title>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <style>
        body {
            background-color: #13422a;
        }

        .container {
            border: 1px solid gray;
            background-color: white;
            color: black;
            width: 50%;
        }

        .notice-show {
            height: auto;
            min-height: 1000px;
        }

        .notice-show p {
            font-size: 18px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="notice-show">
        <p class="text-center" style="font-size: 30px;margin-top: 50px">公告</p>
        <div style="margin-top: 50px;">
            <p class="text-center">
                ${notice.noticeTitle}
            </p>
        </div>
        <div style="height: 500px;margin-top:100px;text-indent: 2em;">
            <p class="text-left">
                ${notice.noticeContent}
            </p>
            <hr>
            <p class="text-left">
                ${notice.noticeRemakes}
            </p>
        </div>
        <p class="text-right" style="margin-right: 50px">
            <small>
                <label>发布时间</label>
                <f:formatDate value="${notice.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </small>
        </p>
    </div>
</div>
<script>
</script>
</body>
</html>