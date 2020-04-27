<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户信息查询</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/jd/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin_pages.css">
    <style>
        .options {
            /*border: 2px solid grey;*/
            margin-bottom: 20px;
        }

        .panel-group {
            height: 1000px;
        }

        td > .panel {
            width: 103%;
            margin-left: -22px;
            margin-top: -3px;
            height: 430px;
        }
    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">用户信息</h2>
    <hr style="margin-top: 70px;margin-bottom:15px">
    <%--操作栏--%>
    <div class="row text-center">
        <div class="col-md-1">
            <%-- <a href="${pageContext.request.contextPath}/admin/user/toAdd">
                 <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> 增加管理员
                 </button>
             </a>--%>
        </div>
        <form action="${pageContext.request.contextPath}/admin/user/searchByNickName" method="get">
            <div class="col-md-offset-7 col-md-2">
                <div class="form-group">
                    <input type="text" class="form-control" name="nickName" placeholder="用户名">
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
    <br>
    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    列表
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-hover text-left">
                    <thead>
                    <th>id</th>
                    <th>昵称</th>
                    <th>用户名</th>
                    <th>头像</th>
                    <th>贴子数</th>
                    <th>基本信息</th>
                    <th>登录信息</th>
                    <th>操作</th>
                    </thead>
                    <tbody class="parent-tbody">
                    <c:choose>
                        <c:when test="${empty users}">
                            <tr>
                                <td colspan="7">
                                    当前没有一个用户,前去<a href="${pageContext.request.contextPath}/register">注册</a>吧
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${users}" var="u" varStatus="i">
                                <tr>
                                    <td>${i.index+1}</td>
                                    <td>${u.nickName}</td>
                                    <td>${u.username}</td>
                                    <td>
                                        <a href="" target="_Blank">
                                            <img src="" value='${pageContext.request.contextPath}/${u.userBaseInfo.headImage}'
                                                 width="50"
                                                 height="50" alt="点击查看大图">
                                        </a>
                                    </td>
                                    <td><a href="#">${u.posts.size()}</a></td>
                                    <td><a href="${pageContext.request.contextPath}/admin/user/userBaseInfo/${u.id}">查看</a></td>
                                    <td><a href="${pageContext.request.contextPath}/admin/user/loginStatus/${u.id}">查看</a></td>
                                    <td><a href="${pageContext.request.contextPath}/admin/user/options/${u.id}">修改</a></td>
                                </tr>
                                <tr class="options">
                                    <td colspan="12">
                                        <div class="panel  panel-primary">
                                            <div class="panel-heading">
                                                <div class="panel-title">
                                                    操作
                                                </div>
                                            </div>
                                            <div class="panel-body">
                                                <form action="${pageContext.request.contextPath}/admin/user/updateUserAccountStatus" method="post">
                                                    <table class="table table-hover">
                                                        <input type="hidden" name="id" value="${u.id}"/>
                                                        <thead>
                                                        <th>禁止发帖</th>
                                                        <th>禁止评论</th>
                                                        <th colspan="2">账户状态</th>
                                                        <th>添加警告</th>
                                                        <th>删除</th>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td colspan="1">

                                                                <input type="checkbox" class="checkbox"
                                                                       name="allowPost"
                                                                    ${u.userAccountStatus.allowPost==1?'checked':''}/>
                                                            </td>
                                                            <td colspan="1">

                                                                <input type="checkbox" class="checkbox"
                                                                       name="allowComment"
                                                                    ${u.userAccountStatus.allowComment==1?'checked':''}/>
                                                            </td>
                                                            <td colspan="2">
                                                                <select name="status"
                                                                        class="form-control">
                                                                    <option value="-1" ${u.userAccountStatus.status == -1?'selected':''}>
                                                                        冻结
                                                                    </option>
                                                                    <option value="0" ${u.userAccountStatus.status == 0?'selected':''}>
                                                                        待激活
                                                                    </option>
                                                                    <option value="1" ${u.userAccountStatus.status == 1?'selected':''}>
                                                                        正常
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td colspan="1">
                                                                <a href="#warning-info">添加</a>
                                                            </td>
                                                            <td colspan="1">
                                                                <a class="delete" href="${pageContext.request.contextPath}/admin/user/${u.id}">删除</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">a
                                                                <span>历史</span>
                                                                <div class="well" style="width: 550px">
                                                                    <blockquote>
                                                                        <p>${u.userAccountStatus.warningInfo}</p>
                                                                    </blockquote>
                                                                </div>
                                                            </td>
                                                            <td colspan="2">
                                                                <p>警告信息</p>
                                                                <textarea cols="80" rows="8"
                                                                          name="warningInfo" readonly></textarea>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="7">
                                                                <button type="submit"
                                                                        class="btn btn-sm btn-success pull-right update-option">
                                                                    提交
                                                                </button>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </form>
                                            </div>
                                        </div>
                                    </td>
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
                    <form id="goPage" action="${pageContext.request.contextPath}/admin/user" method="get">
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
</div>
<script>
    function goPage(pageNumber) {
        $(":hidden[name='currentPage']").val(pageNumber);
        $(":hidden[name='pageSize']").val(5);
        $("#goPage").submit();
    }

    //再渲染完页面之后，将一些模块隐藏
    $(".options").hide();
    $(function () {
        //禁止info，logon，options显示
        //点击显示，显示指定的
        $(".parent-tbody>tr:even>td:last-child>a").on("click", function () {
            $(this).parent("td").parent("tr").next("tr").slideToggle(0, function () {
                if ($(this).is(":hidden")) {
                } else {
                    $(".parent-tbody>tr:odd").slideUp();
                    $(this).slideDown();
                }
            });
            return false;
        })
        $("img").each(function () {
            let tmp = $(this).attr("value");
            let beginIndex = tmp.lastIndexOf("/webapp/") + 7;
            let endIndex = tmp.length;
            var realPath = tmp.substring(beginIndex, endIndex);
            $(this).attr("src", realPath);
            $(this).parent("a").attr("href", realPath);
        });

        $("#back").click(function () {
            window.history.go(-1)
            return false;
        })

        //设置textarea可以添加信息
        $("a[href='#warning-info']").click(function () {
            $(this).parents("td").parents("tr").next("tr").children("td").children("textarea").attr("readonly", false);
            return false;
        })

        $("tr textarea").click(function () {
            if ($(this).attr("readonly") === 'readonly') {
                alert("请点击添加，解除封印")
            }
        })

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
        $("#search").on("click", function () {
            let nickName = $(":input[name='nickName']").val();
            if (nickName != null && nickName !== '' && nickName !== 'undefined') {
                return true;
            }
            return false;
        })
        $("#searchAll").on("click", function () {
            window.location.href = "/admin/user"
        })
    })
</script>
</body>
</html>