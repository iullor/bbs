<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模块</title>
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../css/admin/admin_pages.css">
    <style>

    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row text-right" style="margin-right: 80px;">
        <a href="/admin/notice" class="btn btn-info">历史记录</a>
        <a href="/admin/notice/input/0" class="btn btn-primary">
            添加 <span class="glyphicon glyphicon-plus"></span>
        </a>
    </div>
    <div class="row">
        <h3>历史记录</h3>
        <table class="table table-striped table-hover">
            <thead>
            <th>id</th>
            <th>标题</th>
            <th>添加时间</th>
            <th>
                到期时间
            </th>
            <th>首页显示</th>
            </thead>
            <tbody>
            <c:forEach items="${notices}" var="notice" varStatus="i">
                <tr>
                    <td>
                            ${i.index+1}
                    </td>
                    <td>
                        <a href="/admin/notice/${notice.id}" target="_blank">${notice.noticeTitle}</a>
                    </td>
                    <td>
                        <f:formatDate value="${notice.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>

                    </td>
                    <td>
                        <f:formatDate value="${notice.toTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                    <td>
                        <c:if test="${notice.state!=1}">
                            <a href="#" noticeId='${notice.id}' class="btn btn-info notice-show">显示</a>
                        </c:if>
                        <c:if test="${notice.state==1}">
                            <a href="#" noticeId='${notice.id}' class="btn btn-warning notice-cancel">撤销</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>
    $(function () {
        //更改告示的状态
        $(".notice-show").on("click", function () {
            let id = $(this).attr("noticeId");
            $.ajax({
                url: '/admin/notice/update?option=1&&id=' + id,
                type: 'get',
                success:function (data) {
                    if (data==200) {
                        window.location.href='/admin/notice';
                    }
                }
            })
        })
        $(".notice-cancel").on("click", function () {
            let id = $(this).attr("noticeId");
            $.ajax({
                url: '/admin/notice/update?option=0&&id=' + id,
                type: 'get',
                success:function (data) {
                    if (data==200) {
                        window.location.href='/admin/notice';
                    }
                }
            })
        })
    })
</script>
</body>
</html>