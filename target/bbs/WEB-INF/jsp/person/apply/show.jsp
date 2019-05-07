<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>申请贴子置顶</title>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/ueditor/ueditor.config.js"></script>
    <script src="/lib/ueditor/ueditor.all.js"></script>
    <style>
        body {
            background-color: #f5f5f5;
        }

        .container {
            background-color: white;
            min-height: 1000px;
        }

        .table {
            margin-top: 50px;
            font-size: 20px;
            text-align: left;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/foreground/commons/top-navbar.jsp"/>
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
        <tr style="height: 600px">
            <td>
                申请理由：
            </td>
            <td class="text-center">
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
        <tr>
            <td>
                处理状态：
            </td>
            <td>
                <div class="row">
                    <div class="col-md-offset-2 col-md-8">
                        <!--
                                 * <p>
                                    * 未读              0
                                    * <p>
                                    * 撤销             1
                                    * <p>
                                    * 待审核            2
                                    * <p>
                                    * 审核通过         3
                                    * <p>
                                    * 审核拒绝         4
                                    * <p>
                        -->
                        <c:if test="${option.status==1}">已撤销</c:if>
                        <c:if test="${option.status==2}">待审核</c:if>
                        <c:if test="${option.status==3}">审核通过</c:if>
                        <c:if test="${option.status==4}">拒绝申请</c:if>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>
</div>
</body>
</html>