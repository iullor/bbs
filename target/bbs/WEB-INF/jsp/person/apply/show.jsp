<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>申请贴子置顶</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/ueditor/ueditor.config.js"></script>
    <script src="/lib/ueditor/ueditor.all.js"></script>
    <style>
        .table {
            margin-top: 150px;
            font-size: 20px;
            text-align: left;
        }
    </style>
</head>
<body>
<div class="container">
    <table class="table table-bordered">
        <tr>
            <td colspan="2">
                <h3>
                    详单
                </h3>
            </td>
        </tr>

        <tr>
            <td>
                申请人：
            </td>
            <td>
                <div class="row">
                    <div class="col-md-offset-2 col-md-8">
                        ${option.user.nickName}
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>申请的事项</td>
            <td>
                <div class="row">
                    <div class="col-md-offset-2 col-md-8">
                        申请的事项：${option.applyType}
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>贴子：</td>
            <td>
                <div class="row">
                    <div class="col-md-offset-2 col-md-8">
                        <a href="/post/${option.post.id}">${option.post.postTitle}</a>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                申请理由：
            </td>
            <td>
                <div class="row">
                    <div class="col-md-offset-2 col-md-8">
                        ${option.applyReason}
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                申请时间：
            </td>
            <td>
                <div class="row">
                    <div class="col-md-offset-2 col-md-8">
                        <f:formatDate value="${option.applyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </div>
                </div>
            </td>
        </tr>


    </table>

</div>
</div>
</body>
</html>