<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            <c:if test="${sessionScope.ADMIN_USER.userAccountStatus.role<3}">
                <a href="/admin/board/input/0">
                    <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> 增加板块
                    </button>
                </a>
            </c:if>
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
                                    <td width="20%">
                                        <c:set var="infoString" value="${b.info}"/>
                                        <c:set var="info1String"
                                               value="${fn:substring(infoString, 0, 15)}"/>
                                        <div class="showMoreInfo">
                                                ${info1String}
                                            <c:if test="${infoString.length()>15}">
                                                ...<a href="#">更多</a>
                                            </c:if>
                                            <c:if test="${infoString.length()<15}">
                                            </c:if>
                                        </div>
                                        <div class="showShortInfo">
                                            &nbsp;&nbsp;${b.info} &nbsp;&nbsp;&nbsp;<a href="#">收起</a>
                                        </div>
                                    </td>
                                    <td width="20%">
                                        <c:set var="detailString" value="${b.details}"/>
                                        <c:set var="detail1String"
                                               value="${fn:substring(detailString, 0, 15)}"/>
                                        <div class="showMoreInfo">
                                                ${detail1String}
                                            <c:if test="${detailString.length()>15}">
                                                ...<a href="#">更多</a>
                                            </c:if>
                                            <c:if test="${detailString.length()<15}">
                                            </c:if>
                                        </div>
                                        <div class="showShortInfo">
                                            &nbsp;&nbsp;${b.details}&nbsp;&nbsp;<a href="#">收起</a>
                                        </div>
                                    </td>
                                    <td><a href="#">
                                        <f:formatDate value="${b.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </a></td>
                                    <td><a href="/admin/board/input/${b.id}">编辑</a></td>
                                    <td>
                                        <a class="delete" href="/admin/board/${b.id}">删除</a>
                                    </td>
                                    <form action="" method="POST">
                                        <input type="hidden" name="_method" value="DELETE"/>
                                    </form>
                                    <td>
                                        <a href="/admin/area/addAreaToBoard/${b.id}">添加</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="7" class="text-center text-info text-lg">
                                    当前还没有板块,请去 <a href="/admin/board/input/0">添加</a>
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
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
                            <%--class="${pageResult.currentPage==1?'disabled':''}"--%>
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
                    <form id="goPage" action="/admin/board" method="get">
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
        $(":hidden[name='pageSize']").val(3);
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
            var i = confirm("你确定要删除当前用户吗？");
            if (i) {
                var href = $(this).attr("href");
                $("form").attr("action", href).submit();
            }
            return false;
        })
        $(".showShortInfo").hide();
        $(".showMoreInfo>a").on("click", function () {
            $(this).parent().siblings("div.showShortInfo").show();
            $(this).parent("div").hide();
            return false;
        })
        $(".showShortInfo>a").on("click", function () {
            $(this).parent().siblings("div.showMoreInfo").show();
            $(this).parent("div").hide();
            return false;
        })
    })
</script>
</body>
</html>