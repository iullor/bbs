<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>贴子列表</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <link rel="stylesheet" href="/css/admin/admin_pages.css">
    <%--<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>--%>
    <script src="/lib/jQuery/jquery.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <style>
        .post-sort {
            line-height: 20px;
            font-size: 16px;
            padding-top: 8px;
        }

        .form-text {
            line-height: 30px;
            margin-left: 10px;
            width: 60%;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">贴子列表</h2>
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
    <div class="panel panel-warning">
        <div class="panel-heading">
            <div class="panel-title">

                查询结果<span name="postTotal" class="text-danger">&nbsp;&nbsp;&nbsp;共${pageResult.count}条数据</span>
            </div>
        </div>
        <div class="panel-body">
            <c:choose>
                <c:when test="${not empty posts}">
                    <table class="table table-hover table-striped text-left">
                        <thead>
                        <th>id</th>
                        <th>标题</th>
                        <th>作者</th>
                        <th>发布时间</th>
                        <th>发布板块</th>
                        <th>版块内置顶</th>
                        <th>禁止评论</th>
                        <th>隐藏贴子</th>
                        <th>备注</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${posts}" var="p" varStatus="i">
                            <tr>
                                <td><a href="#">${i.index+1}</a></td>
                                <td><a href="/post/${p.id}" target="_blank">${p.postTitle}</a></td>
                                <td><a href="/account/${p.userId}" target="_blank">${p.user.nickName}</a></td>
                                <td>
                                    <f:formatDate value="${p.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                                <td><a href="#">${p.boardTitle}</a></td>
                                <form action="/admin/post/update" method="post">
                                    <td>
                                        <input class='post-up' pid="${p.id}" class="post-up" type="checkbox"
                                               name="up" ${p.up==1?'checked':''}>
                                    </td>
                                    <td>
                                        <input pid="${p.id}" class="banComment" type="checkbox"
                                               name="banComment"  ${p.banComment==2?'checked':''}>
                                    </td>
                                    <td>
                                        <input pid="${p.id}" type="checkbox" class="secret"
                                               name="secret" ${p.secret==2?'checked':''}>
                                    </td>
                                    <td>
                                        <input type="hidden" name="id" value="${p.id}">
                                        <input type="hidden" name="userId" value="${p.userId}">
                                        <select name="remakes" style="height: 30px">
                                            <option value="-1">请选择</option>
                                            <option value="含有攻击性言语">含有攻击性言语</option>
                                            <option value="有违规操作">有违规操作</option>
                                            <option value="文章内容有侵权行为">文章内容有侵权行为</option>
                                        </select>
                                        <button type="submit" class="btn btn-sm btn-info pull-right">确定</button>
                                    </td>
                                </form>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    暂时为空
                </c:otherwise>
            </c:choose>
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
                <form id="goPage" action="/admin/post" method="get">
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
    <br>
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
    })
</script>
</body>
</html>