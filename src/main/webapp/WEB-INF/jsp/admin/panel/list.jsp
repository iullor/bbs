<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模块</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin_pages.css">
    <style>

    </style>
</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">模块列表</h2>
    <hr style=" margin-top: 70px;margin-bottom: 15px;">
    <%--操作栏--%>
    <div class="row">
        <div class="col-md-1">
            <c:if test="${sessionScope.ADMIN_USER.userAccountStatus.role==1}">
                <a href="${pageContext.request.contextPath}/admin/panel/input/0">
                    <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span> 增加
                    </button>
                </a>
            </c:if>
        </div>
        <form action="${pageContext.request.contextPath}/admin/panel/searchByPanelTitle" method="get">
            <div class="col-md-offset-7 col-md-2">
                <div class="form-group">
                    <input type="text" class="form-control" name="inputPanelTitle" placeholder="模块名">
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
    <hr style="margin-top: 5px">
    <%--状态栏--%>
    <div class="panel-group">
        <div class="panel panel-warning" id="allPanels">
            <div class="panel-heading">
                <div class="panel-title">
                    状态信息
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-striped text-left">
                    <thead>
                    <th>模块数</th>
                    <th>logo</th>
                    <th>标题</th>
                    <th>管理者</th>
                    <th>模块简介</th>
                    <th>创建时间</th>
                    <th>修改</th>
                    <th>删除</th>
                    <th>预览</th>
                    <th>增加板块</th>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty panels}">
                            <tr>
                                <td colspan="7" class="text-center text-info text-lg">
                                    当前还没有模块,请去 <a href="${pageContext.request.contextPath}/admin/panel/input/0">添加</a>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${panels}" var="p" varStatus="i">
                                <tr>
                                    <td>
                                            ${i.index+1}
                                    </td>
                                    <td>
                                        <img src="" class="showUserHeadImg"
                                             value='${p.logoPath}' alt="logo"
                                             width="30px"
                                             path="${pageContext.request.contextPath}"
                                             height="30px">
                                    </td>
                                    <td><a href="#">${p.title}</a></td>
                                    <td>${p.userList[0].username}</td>
                                    <td>${p.info}</td>
                                    <td>
                                        <f:formatDate value="${p.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </td>
                                    <td><a href="${pageContext.request.contextPath}/admin/panel/input/${p.id}">编辑</a></td>
                                    <td><a class="delete" href="${pageContext.request.contextPath}/admin/panel/${p.id}">删除</a></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/panel/${p.id}">查看</a>
                                    </td>
                                    <td><a class="addBoard" href="${pageContext.request.contextPath}/admin/board/addBoardToPanel/${p.id}">添加</a></td>
                                    <form id="deleteForm" action="" method="POST">
                                        <input type="hidden" name="_method" value="DELETE"/>
                                    </form>
                                </tr>
                            </c:forEach>
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
                    <form id="goPage" action="${pageContext.request.contextPath}/admin/panel" method="get">
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
    //显示图片
    $(".showUserHeadImg").each(function () {
        var headImg = $(this).attr("value");
        var path = $(this).attr("path");
        // let beginIndex = headImg.indexOf("/webapp/") + 7;
        // let endIndex = headImg.length;
        // let src = headImg.substring(beginIndex, endIndex);
        $(this).attr("src", path+headImg);
    })

    function goPage(pageNumber) {
        $(":hidden[name='currentPage']").val(pageNumber);
        $(":hidden[name='pageSize']").val(2);
        $("#goPage").submit();
    }

    $(function () {
        $("#searchAll").on("click", function () {
            window.location.href = "/bbs/admin/panel"
        });
        //删除确认
        $(".delete").on("click", function () {
            var i = confirm("危险！！！\n您真想清空，该模块下的所有内容吗？");
            if (i) {
                var href = $(this).attr("href");
                $("#deleteForm").attr("action", href).submit();
            }
            return false;
        });

        var operationStatus = '${operationStatus}';
        if (operationStatus === "2002") {
            alert("操作失败，您不能删除该模块,该模块包含有内容，请联系管理员")
        }
        if (operationStatus === "2003") {
            alert("删除成功")
        }
        if (operationStatus === "2005") {
            alert("更新成功")
        }

        //分页一些东西的隐藏与显示
        let search = '${pageResult.totalPage}';
        //如果只有一页,隐藏所有
        if (search < 2) {
            $("#foot").hide();
        }
        //如果当前页等于第一页,那么隐藏上一页的按钮
        let currentPage = '${pageResult.currentPage}';
        if (currentPage === 1) {
            $("#prevPage").hide();
        }
        //如果当前页,等于最后一页,那么隐藏下一页
        let endPages = '${pageResult.endIndex}';
        if (endPages === currentPage) {
            $("#nextPage").hide();
        }
        $("#toPage>button").on("click", function () {
            let toPage = $("input[name='toPage']").val();
            if (toPage !== null && toPage !== '' && toPage !== 'undefined') {
                let endPage = '${pageResult.totalPage}';
                //alert(endPage)
                if (endPage + 1 > toPage) {
                    goPage(toPage);
                } else {
                    alert("请输入正确的页码");
                }
            } else {
                alert("请输入页码");
            }
        });

        /*搜索词回显*/
        let keyword = '${keyword}';
        if (keyword != null && keyword !== '' && keyword !== 'undefind') {
            $(":text[name='inputPanelTitle']").val(keyword);
        }
    })
</script>
</body>
</html>