<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模块</title>
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../css/admin/admin_pages.css">
    <style>
        .public-container {
            height: auto;
            min-height: 1000px;
            border: 1px solid silver;
            margin-top: -20px;
            padding-top: 30px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="public-container">
        <div class="row text-right" style="margin-right: 80px;">
            <a href="/admin/notice" class="btn btn-info">历史记录</a>
            <a href="/admin/notice/input/0" class="btn btn-primary">
                添加 <span class="glyphicon glyphicon-plus"></span>
            </a>
        </div>
        <h2 class="text-center">公告</h2>
        <form role="form" action="/admin/notice" method="post" style="margin-top: 50px;">
            <div class="row form-group">
                <div class="col-md-offset-2 col-md-8">
                    <label>公告标题
                        <small>(字数10字以内)</small>
                    </label>
                    <input type="text" class="form-control" name="noticeTitle">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-md-offset-2 col-md-4">
                    <label>类型
                        <small>(必须)</small>
                    </label>
                    <select name="noticeType" class="form-control">
                        <option value="-1">请选择</option>
                        <option value="1">紧急通知</option>
                        <option value="2">寻物</option>
                        <option value="3">最新政策</option>
                    </select>
                </div>
            </div>
            <div class="row form-group">
                <h4 style="margin-left: 270px">持续时间</h4>
                <div class="col-md-offset-2 col-md-2">
                    <span style="margin-left: 220px">从</span>
                    <input type="date" class="form-control" name="fromTime">
                </div>
                <div class="col-md-2">
                    <span>到</span>
                    <input type="date" class="form-control" name="toTime">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-md-offset-2 col-md-8">
                    <label>理由
                        <small>(字数100字以内)</small>
                    </label>
                    <textarea name="noticeReason" cols="30" rows="5" class="form-control"></textarea>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-md-offset-2 col-md-8">
                    <label>内容
                        <small>(字数200字以内)</small>
                    </label>
                    <textarea name="noticeContent" cols="30" rows="10" class="form-control"></textarea>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-md-offset-2 col-md-8">
                    <label>脚注
                        <small>(字数20字以内)</small>
                    </label>
                    <input type="text" class="form-control" name="noticeRemakes">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-md-offset-2 col-md-8">
                    <button type="reset" class="btn btn-default">重置</button>
                    <button type="submit" class="btn btn-primary">添加</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    $(function () {

    })
</script>
</body>
</html>