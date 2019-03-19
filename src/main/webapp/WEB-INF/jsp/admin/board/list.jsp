<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>板块</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <script src="../../../../lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../css/admin/admin_pages.css">
    <style>

    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">板块列表</h2>
    <hr style="margin-top: 70px;margin-bottom:15px">
    <%--操作栏--%>
    <div class="row text-center">

        <div class="col-md-offset-5 col-md-1">
            <a href="/board/input/0">
                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> 增加板块
                </button>
            </a>
        </div>
        <div class="col-md-1" style="margin-top: 7px;line-height: 20px;font-size: 15px;">
            时间&nbsp;&nbsp;<a href="#"><span class="glyphicon glyphicon-sort-by-attributes"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#"><span class="glyphicon glyphicon-sort-by-attributes-alt"></span></a>
        </div>
        <div class="col-md-1" style="margin-top: 7px;line-height: 20px;font-size: 15px;">
            热度&nbsp;&nbsp;<a href="#"><span class="glyphicon glyphicon-sort-by-attributes"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#"><span class="glyphicon glyphicon-sort-by-attributes-alt"></span></a>
        </div>
        <form action="/board/searchByBoardTitle" method="get">
            <div class="col-md-2">
                <div class="form-group">
                    <input type="text" class="form-control" name="inputBoardTitle" placeholder="模块名">
                </div>
            </div>
            <div class="col-md-1">
                <button id="search" type="submit" class="btn btn-default">查找<span
                        class="glyphicon glyphicon-search"></span></button>
            </div>
        </form>
        <div class="col-md-1" style="margin-top: -13px">
            <button type="button" class="btn btn-default" id="searchAll">显示全部 <span
                    class="glyphicon glyphicon-menu-hamburger"></span></button>
        </div>
    </div>
    <hr style="margin-top: 5px;">
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
                                    <td><a href="#">${i.index+1}</a></td>
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
            <div class="panel-footer">
                <nav class="Page navigation text-center">
                    <ul class="pagination">
                        <li class="disabled">
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">7</a></li>
                        <li><a href="#">8</a></li>
                        <li><a href="#">9</a></li>
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li>
                            <input type="text" class="form-text">&nbsp;/100
                            <input type="button" class="btn btn-success" value="跳转"/>
                        </li>
                    </ul>
                </nav>
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