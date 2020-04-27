<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>贴子增加</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin_pages.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <style>
        body{
            height: 500px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-10">
            <div>
                <h3>
                    <span>
                        现有分类
                    </span>
                    <a id="addPostType" href="#" class="btn  btn-default" data-target="#myInput" data-toggle="modal">
                        <span class="glyphicon glyphicon-plus"></span>新增
                    </a>
                </h3>
            </div>
            <table class="table table-bordered">
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
                                <td width="50">
                                    <a class="edit" href="${pageContext.request.contextPath}/admin/postType/${t.id}">编辑</a>
                                </td>
                                <td width="50">
                                    <a class="delete" href="${pageContext.request.contextPath}/admin/postType/${t.id}">删除</a>
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
<%--模态框添加类型--%>
<div id="myInput" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/admin/postType" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加分类</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <%--<input type="hidden" name="id">--%>
                       <div class="col-md-10">
                           <div class="form-group">
                               <input type="text" class="form-control" name="name">
                           </div>
                       </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </form>
        </div>
    </div>
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