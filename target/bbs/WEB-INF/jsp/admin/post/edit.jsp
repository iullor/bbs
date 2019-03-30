<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>贴子增加</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../../css/admin/admin_pages.css">
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <style>
        .input-group {
            bottom: 40px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">贴子增加</h2>
    <br>
    <div class="row">
        <div class="col-md-4">
            <div>
                <h3>添加分类</h3>
            </div>
            <form action="/admin/postType" method="post">
                <input type="hidden" name="id">
                <div class="form-group">
                    <input type="text" class="form-control" name="name">
                    <button type="submit" class="btn btn-info">提交</button>
                    <button type="reset" class="btn btn-default">重置</button>
                </div>
            </form>
        </div>
        <div class="col-md-offset-2 col-md-4">
            <div>
                <h3>现有分类</h3>
            </div>
            <table class="table">
                <thead>
                <th>序号</th>
                <th>名字</th>
                <th colspan="2">操作</th>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty types}">
                        <c:forEach items="${types}" var="t" varStatus="i">
                            <tr>
                                <td>
                                        ${i.index+1}
                                </td>
                                <td>
                                        ${t.name}
                                </td>
                                <td>
                                    <a class="edit" href="/admin/postType/${t.id}">编辑</a>
                                </td>
                                <td>
                                <td>
                                    <a class="delete" href="/admin/postType/${t.id}">删除</a>
                                </td>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr class="text-center">
                            <td colspan="4">
                                空空，请添加
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
    <hr>
</div>
<script>
    $(function () {
        $(".edit").on("click", function () {
            alert($(this).attr("href"))
            return false;
        })
        $(".delete").on("click", function () {
            alert($(this).attr("href"))
            return false;
        })
    })
</script>
</body>
</html>