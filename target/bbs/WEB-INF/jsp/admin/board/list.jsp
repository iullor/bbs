<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模块</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <script src="../../../../lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../css/admin/admin_pages.css">
    <style>
        .post-sort {
            line-height: 20px;
            font-size: 16px;
            padding-top: 8px;
        }
    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">模块列表</h2>
    <br>
    <div class="row">
        <div class="col-md-offset-7 col-md-1 text-md post-sort">
            时间&nbsp;&nbsp;<a href="#"><span class="glyphicon glyphicon-sort-by-attributes"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#"><span class="glyphicon glyphicon-sort-by-attributes-alt"></span></a>
        </div>
        <div class="col-md-1 post-sort">
            热度 <span class="glyphicon glyphicon-sort-by-attributes"></span>&nbsp;&nbsp;<span
                class="glyphicon glyphicon-sort-by-attributes-alt"></span>
        </div>
        <div class="col-md-2">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="id/昵称">
                <span class="input-group-btn">
                    <button class="btn btn-default">查找<span class="glyphicon glyphicon-search"></span></button>
            </span>
            </div>
        </div>
        <div class="col-md-1">
            <div class="input-group">
                <button class="btn btn-default">显示全部 <span class="glyphicon glyphicon-menu-hamburger"></span></button>
            </div>
        </div>
    </div>
    <br>
    <div class="panel-group">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="panel-title">
                    状态信息
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-striped text-left">
                    <thead>
                    <th>id</th>
                    <th>标题</th>
                    <th>模块名</th>
                    <th>版主</th>
                    <th>板块简介</th>
                    <th>板块详情</th>
                    <th>创建时间</th>
                    <th>修改</th>
                    <th>删除</th>
                    <th>增加分区</th>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${not empty boards}">
                            <c:forEach items="${boards}" var="b" varStatus="i">
                                <tr>
                                    <td><a href="#">${i.index}</a></td>
                                    <td><a href="#">${b.boardTitle}</a></td>
                                    <td><a href="#">${b.panel.title}</a></td>
                                    <td><a href="#">${b.user.username}</a></td>
                                    <td><a href="#">${b.info}</a></td>
                                    <td><a href="#">${b.details}</a></td>
                                    <td><a href="#">
                                        <f:formatDate value="${b.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </a></td>
                                    <td><a href="/board/input/${b.id}">编辑</a></td>
                                    <td>
                                        <a class="delete" href="/board/${b.id}">删除</a>
                                    </td>
                                    <form action="" method="POST">
                                        <input type="hidden" name="_method" value="DELETE"/>
                                    </form>
                                    <td>
                                        <a href="/addAreaToBoard/${b.id}">添加</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="7" class="text-center text-info text-lg">
                                    当前还没有板块,请去 <a href="/board/input/0">添加</a>
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    //删除确认
    $(".delete").on("click", function () {
        var i = confirm("你确定要删除当前用户吗？");
        if (i) {
            var href = $(this).attr("href");
            $("form").attr("action", href).submit();
        }
        return false;
    })
</script>
</body>
</html>