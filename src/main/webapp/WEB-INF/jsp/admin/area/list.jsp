<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>区</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="/css/admin/admin_pages.css">
</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">区列表</h2>
    <hr style="margin-top: 70px;margin-bottom:10px;">
    <%--操作栏--%>
    <div class="row text-center">
        <div class="col-md-offset-5 col-md-1">
            <a href="/admin/area/input/0">
                <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span> 增加分区
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
        <form action="/area/searchByAreaTitle" method="get">
            <div class="col-md-2">
                <div class="form-group">
                    <input type="text" class="form-control" name="inputPanelTitle" placeholder="分区名">
                </div>
            </div>
            <div class="col-md-1">
                <button id="search" type="submit" class="btn btn-default">查找<span
                        class="glyphicon glyphicon-search"></span></button>
            </div>
        </form>
        <div class="col-md-1" style="margin-top: -15px">
            <button type="button" class="btn btn-default" id="searchAll">显示全部 <span
                    class="glyphicon glyphicon-menu-hamburger"></span></button>
        </div>
    </div>
    <%--状态栏--%>
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
                    <th>板块名</th>
                    <th>区主</th>
                    <th>分区简介</th>
                    <th>分区详情</th>
                    <th>创建时间</th>
                    <th>修改</th>
                    <th>删除</th>
                    </thead>
                    <tbody>
                    <%--如果是超级管理员，全部显示--%>
                    <c:if test="${sessionScope.ADMIN_USER.userAccountStatus.role==1}">
                        <c:choose>
                            <c:when test="${not empty areas}">
                                <c:forEach items="${areas}" var="a" varStatus="i">
                                    <tr>
                                        <td><a href="#">${i.index+1}</a></td>
                                        <td><a href="#">${a.areaTitle}</a></td>
                                        <td>
                                            <c:if test="${not empty a.board.boardTitle}">
                                                ${a.board.boardTitle}
                                            </c:if>
                                            <c:if test="${empty a.board.boardTitle}">
                                                &nbsp;&nbsp;&nbsp;---
                                            </c:if>
                                        </td>
                                        <td><a href="#">${a.user.username}</a></td>
                                        <td><a href="#">${a.info}</a></td>
                                        <td><a href="#">${a.details}</a></td>
                                        <td><a href="#">
                                            <f:formatDate value="${a.createTime}" pattern="yyyy-MM-dd"/>
                                        </a></td>
                                        <td><a href="/admin/area/input/${a.id}">编辑</a></td>
                                        <td>
                                            <a class="delete" href="/admin/area/${a.id}">删除</a>
                                        </td>
                                        <form action="" method="POST">
                                            <input type="hidden" name="_method" value="DELETE"/>
                                        </form>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="7" class="text-center text-info text-lg">
                                        当前还没有板块,请去 <a href="/admin/area/input/0">添加</a>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    <%--如果是普通的管理员，就让他管理下的area--%>
                    <c:if test="${sessionScope.ADMIN_USER.userAccountStatus.role<4 && sessionScope.ADMIN_USER.userAccountStatus.role>1}">
                        <c:choose>
                            <c:when test="${not empty areas}">
                                <c:forEach items="${areas}" var="a" varStatus="i">
                                    <tr>
                                        <td><a href="#">${i.index+1}</a></td>
                                        <td><a href="#">${a.areaTitle}</a></td>
                                        <td>
                                            <c:if test="${not empty a.board.boardTitle}">
                                                ${a.board.boardTitle}
                                            </c:if>
                                            <c:if test="${empty a.board.boardTitle}">
                                                &nbsp;&nbsp;&nbsp;---
                                            </c:if>
                                        </td>
                                        <td><a href="#">${a.user.username}</a></td>
                                        <td><a href="#">${a.info}</a></td>
                                        <td><a href="#">${a.details}</a></td>
                                        <td><a href="#">
                                            <f:formatDate value="${a.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </a></td>
                                        <td><a href="/admin/area/input/${a.id}">编辑</a></td>
                                        <td>
                                            <a class="delete" href="/admin/area/${a.id}">删除</a>
                                        </td>
                                        <form action="" method="POST">
                                            <input type="hidden" name="_method" value="DELETE"/>
                                        </form>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="7" class="text-center text-info text-lg">
                                        当前还没有板块,请去 <a href="/admin/area/input/0">添加</a>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    </tbody>
                </table>
            </div>
            <div id="foot" class="row panel-footer panel-default">
                <div class="col-md-offset-4 col-md-4">
                    <nav class="Page navigation">
                        <ul class="pagination">
                            <li id="firstPage" style="margin-right: 20px">
                                <a href="javascript:goPage(1)" aria-label="Previous">
                                    <span aria-hidden="true">首页</span>
                                </a>
                            </li>
                            <li id="prevPage">
                                <a href="javascript:goPage(1)" aria-label="Previous">
                                    上一页
                                </a>
                            </li>
                            <c:forEach begin="${pageResult.beginIndex}" end="${pageResult.endIndex}" var="pageNumber">
                                <li class="${pageNumber==pageResult.currentPage?'active':''}">
                                    <a href="javascript:goPage(${pageNumber})">${pageNumber}</a>
                                </li>
                            </c:forEach>
                            <%--class="${pageResult.endIndex==pageResult.totalPage?'disabled':''}"--%>
                            <li id="nextPage">
                                <a href="javascript:goPage(${pageResult.nextPage})" aria-label="Previous">
                                    下一页
                                </a>
                            </li>
                            <li id="lastPage" class="${pageResult.endIndex==pageResult.totalPage?'disabled':''}">
                                <a href="javascript:goPage(${pageResult.totalPage})">
                                    末页
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-md-2" style="margin-left:-70px;height: 78px;padding-top: 10px;">
                    <%--跳转的框--%>
                    <form id="goPage" action="/admin/area" method="get">
                        <input type="hidden" name="currentPage">
                        <input type="hidden" name="pageSize">
                    </form>
                    <div id="toPage">
                        <input type="text" name="toPage" class="form-text">&nbsp;/&nbsp;${pageResult.totalPage}
                        <button type="button" class="btn btn-success">跳转</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    function goPage(pageNumber) {
        $(":hidden[name='currentPage']").val(pageNumber);
        $(":hidden[name='pageSize']").val(10);
        $("#goPage").submit();
    }

    $(function () {
        //分页一些东西的隐藏与显示
        let search = ${pageResult.totalPage};
        //如果只有一页,隐藏所有
        if (search < 2) {
            $("#foot").hide();
        }
        //如果当前页等于第一页,那么隐藏上一页的按钮
        let currentPage =${pageResult.currentPage};
        if (currentPage === 1) {
            $("#prevPage").hide();
        }
        //如果当前页,等于最后一页,那么隐藏下一页
        let endPages = ${pageResult.endIndex};
        if (endPages === currentPage) {
            $("#nextPage").hide();
        }
        $("#toPage>button").on("click", function () {
            let toPage = $("input[name='toPage']").val();
            if (toPage !== null && toPage !== '' && toPage !== 'undefined') {
                let endPage = ${pageResult.totalPage};
                if (endPage + 1 > toPage) {
                    goPage(toPage);
                } else {
                    alert("请输入正确的页码");
                }
            } else {
                alert("请输入页码");
            }
        });


        //删除确认
        $(".delete").on("click", function () {
            var i = confirm("你确定要删除?");
            if (i) {
                var href = $(this).attr("href");
                $("form").attr("action", href).submit();
            }
            return false;
        })
    })

</script>
</body>
</html>