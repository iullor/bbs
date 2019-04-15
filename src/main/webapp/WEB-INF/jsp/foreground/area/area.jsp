<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>分区</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/panel/panel.css">

    <!--引入一些样式-->
    <link rel="stylesheet" href="/css/commons/sidebar_left.css">
    <link rel="stylesheet" href="/css/commons/top.css">
    <link rel="stylesheet" href="/css/modal/modal_login.css">
    <link rel="stylesheet" href="/css/commons/commons.css">
    <link rel="stylesheet" href="/css/board/board.css">
    <link rel="stylesheet" href="/css/board/board_post_list.css">

    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/bootstrap.min.js"></script>
    <script src="/js/sidebar-left-control.js"></script>
    <style>
        .area-nav {
            position: fixed;
            top: 50px;
            z-index: 2;
            width: 100%;
            float: left;
        }

        .area-list {
            margin-top: 35px;
        }

        .panel-title > p:first-child {
            margin-left: 10px;
            text-align: left;
        }

        .panel-title > p:nth-child(2) {
            margin-left: 10px;
            text-align: left;
            display: block;
        }

        .panel-title > p {
            text-align: right;
        }
    </style>
</head>
<body>
<header class="navbar navbar-fixed-top navbar-default">
    <nav class="navbar">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-4 navbar-header">
                    <button type="button" class="navbar-toggle collapsed glyphicon glyphicon-menu-hamburger"
                            data-toggle="collapse"
                            data-target="#sidebar-wrapper" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">BBS-Student</a>
                </div>
                <div class="col-md-5">
                    <div class="row" style="margin-top: 6px">
                        <form>
                            <div class="form-group col-md-6">
                                <input type="text" class="form-control" id="search" placeholder="Search">
                            </div>
                            <div class="form-group col-md-6">
                                <button type="submit" class="btn btn-default"><span
                                        class="glyphicon glyphicon-search"></span>Search
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-2 nav-addon">
                    <a href="/person/myCreat"><span class="glyphicon glyphicon-cloud">&nbsp;公共</span></a>
                    <a href="/person/myFriends"><span class="glyphicon glyphicon-globe">&nbsp;圈子</span></a>
                </div>
                <c:choose>
                    <c:when test="${empty sessionScope.CURRENT_USER}">
                        <div class="col-md-1" style="margin-top: 13px;font-size: 18px">
                            <a id="login" href="#" data-toggle="modal" data-target="#loginModal" data-keyboard="true">
                                请登录
                                <span class="glyphicon glyphicon-log-in"></span>
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-md-1">
                            <div class="myAccount img-circle">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="false">
                                    <img src="" width="40" height="40"
                                         value='${sessionScope.CURRENT_USER.userBaseInfo.headImage}'
                                         class="showUserHeadImg"/>
                                    <span class="caret" style="margin-left: 13px;"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="/person/basic/account">账户</a></li>
                                    <li><a href="/person/basic/info">基本信息</a></li>
                                    <li><a href="#">我的创作</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">添加</a></li>
                                    <li><a href="#">维修</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="/person/basic/account">设置</a></li>
                                    <li><a id="logout" href="/logout">注销<span class="glyphicon glyphicon-log-in"></span></a>
                                    </li>
                                </ul>
                                <br>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</header>
<div class="container">
    <div class="row">
        <div id="main">
            <!--路径导航栏-->
            <div class="row area-nav">
                <ol class="breadcrumb">
                    <li><a href="../../public/index.jsp">Home</a></li>
                    <li><a href="../panel/panel.jsp">Panel</a></li>
                    <li><a href="ml">School</a></li>
                    <li class="active">Computer Science</li>
                </ol>
            </div>
            <div class="panel area-list">
                <div class="panel-heading">
                    <div class="panel-title row"
                         style="height: 250px;border-top: 1px blue solid;border-bottom:1px grey solid;margin-top: -10px;padding-top: 20px">
                        <div class="col-md-3 text-vertical-center">
                            <p>
                                <img src="" alt="" value="" width="150" height="150"
                                     style="margin-left: 25px;margin-bottom: 30px;">
                            </p>
                            <p class="text-md text-grey" style="padding-left: 50px">${area.areaTitle}</p>
                        </div>
                        <div class="col-md-7" style="margin-top: 20px;">
                            <p>版主：${area.user.nickName}</p>
                            <p>板块信息：${area.details}</p>
                            <p>创建时间：<f:formatDate value="${area.createTime}" pattern="yyyy-MM-dd"/></p>
                            <p>
                                <span>在线:2 人</span>&nbsp;&nbsp;&nbsp;
                                <span>贴子数:${area.posts.size()}</span>
                            </p>
                            <p><a href="#">Rank&nbsp;100</a></p>
                        </div>
                        <div class="col-md-2">
                            <span id="collectArea"
                                  class="glyphicon glyphicon-star-empty btn btn-info pull-right"
                                  style="margin-top: 5px;"
                                  tempClass="glyphicon glyphicon-star btn btn-success pull-right ">收藏</span>
                            </span>
                            <span class="pull-right  btn btn-default"
                                  style="margin-right: 20px;margin-top: 7px;">
                                        <a href="/post/input/0"><span
                                                class="glyphicon glyphicon-comment">发帖</span></a>
                            </span>
                        </div>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${not empty area.posts}">
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                <th class="row">
                                <td class="col-md-1">楼层</td>
                                <td class="col-md-6  text-center">标题</td>
                                <td class="col-md-1">发帖人</td>
                                <td class="col-md-3">时间</td>
                                <td class="col-md-1">评论</td>
                                </th>
                                </thead>
                                <tbody>
                                <c:forEach items="${area.posts}" var="p" varStatus="i">
                                    <tr class="row">
                                        <td class="col-md-1 text-left">
                                            <c:if test="${p.up==1}">
                                                <button class="label-top">置顶</button>
                                            </c:if>
                                            <c:if test="${p.up!=1}">
                                                ${(pageResult.currentPage-1)*pageResult.pageSize+i.index+1}层
                                            </c:if>
                                        </td>
                                        <td class="col-md-5"><a href="/post/${p.id}">${p.postTitle}</a>
                                        </td>
                                        <td class="col-md-2">
                                            <img src="" class="showUserHeadImg"
                                                 value="${p.user.userBaseInfo.headImage}" width="25"
                                                 height="25" style="margin-left: -10px">
                                                ${p.user.nickName}
                                        </td>
                                        <td class="col-md-2">
                                            <f:formatDate value="${p.createTime}"
                                                          pattern="yyyy-MM-hh HH:mm:ss"/>
                                        </td>
                                        <td class="col-md-2">${p.comm}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div id="footPage" class="row panel-footer panel-default">
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
                                        <c:forEach begin="${pageResult.beginIndex}" end="${pageResult.endIndex}"
                                                   var="pageNumber">
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
                                        <li id="lastPage"
                                            class="${pageResult.endIndex==pageResult.totalPage?'disabled':''}">
                                            <a href="javascript:goPage(${pageResult.totalPage})">
                                                末页
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="col-md-2" style="margin-left:-70px;height: 78px;padding-top: 10px;">
                                    <%--跳转的框--%>
                                <form id="goPage" action="/area/${area.id}" method="get">
                                    <input type="hidden" name="currentPage">
                                    <input type="hidden" name="pageSize">
                                </form>
                                <div id="toPage">
                                    <input type="text" name="toPage"
                                           class="form-text">&nbsp;/&nbsp;${pageResult.totalPage}
                                    <button type="button" class="btn btn-success">跳转</button>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center" style="height:150px;color: red;margin-top: 50px;">
                            <h3>该分区暂时贴子为空</h3>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div id="foot" class="container" style="position: absolute;bottom: 10px;">
            <p class="text-center"><span><a href="#">联系我们</a>&nbsp;&nbsp;<small>--</small></span>友情连接&nbsp;<a
                    href="https://www.baidu.com">百度</a>&nbsp;<a
                    href="https://www.google.com">Google</a>&nbsp;<a
                    href="https://www.github.com">GitHub</a></p>
            <div class="text-center">
                <p>© 学生论坛版权所有</p>
            </div>
        </div>
        <!--游客用户登录的模态框-->
        <div class="modal fade" id="loginModal" tabindex="0" role="dialog" aria-labelledby="loginModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content modal-sm">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title text-center" id="loginModalLabel">
                            <small>请您先登录，再操作</small>
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form action="/checkLogon" method="get">
                            <div class="form-group">
                                <label for="username" class="control-label">
                                    <small>用户名</small>
                                </label>
                                <input type="text" class="form-control has-feedback" name="username" id="username">
                            </div>
                            <div class="form-group">
                                <label for="password" class="control-label">
                                    <small>密码</small>
                                </label>
                                <input type="password" class="form-control" name="password" id="password">
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-md btn-default" data-dismiss="modal">Quit
                                </button>
                                <button type="submit" class="btn btn-md btn-primary">Login</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $("#collectArea").on("click", function () {
            //收藏板块
            let areaId = '${area.id}'
            let obj = {
                areaId: areaId
            };
            let currentClass = $(this).attr("class");
            if (currentClass.match("btn-success") == null) {
                $.ajax({
                    url: "/collection/area/" + 1,
                    type: "post",
                    data: JSON.stringify(obj),
                    contentType: "application/json",
                    success: function (data) {
                        console.log(data)
                        if (data.status === '3004') {
                            alert("收藏成功")
                        } else {
                            alert("网络问题")
                        }
                    }
                })
                $(this).removeClass("glyphicon-star-empty").removeClass("btn-info");
                $(this).addClass("glyphicon-star").addClass("btn-success");
                $(this).html("已收藏")
            } else {
                //取消收藏
                $.ajax({
                    url: "/collection/area/" + 0,
                    type: "post",
                    data: JSON.stringify(obj),
                    contentType: "application/json",
                    success: function (data) {
                        console.log(data)
                        if (data.status === '3005') {
                            alert("已取消")
                        } else {
                            alert("网络问题")
                        }
                    }
                })
                $(this).removeClass("glyphicon-star").removeClass("btn-success");
                $(this).addClass("glyphicon-star-empty").addClass("btn-info");
                $(this).html(" 收藏")
            }
        })

        let curUserId = '${sessionScope.CURRENT_USER.id}'
        let curaAreaId = '${area.id}'
        if (curaAreaId != null && curUserId != null) {
            let obj = {
                currentUserId: curUserId,
                areaId: curaAreaId
            }
            $.ajax({
                url: '/collection/area',
                type: 'post',
                data: JSON.stringify(obj),
                contentType: "application/json",
                success: function (data) {
                    //表明数据库中有值
                    if (data.collectedArea === '1') {
                        $("#collectArea").removeClass("glyphicon glyphicon-heart-empty btn btn-info");
                        $("#collectArea").addClass("glyphicon glyphicon-star btn btn-success");
                        $("#collectArea").html("已收藏")
                    }
                }
            });
        }

    })
    $("tbody>tr").click(function () {
        let href = $(this).children("td:nth-child(2)").children("a").attr("href");
        window.location.href = href;
    })


    //分页的
    function goPage(pageNumber) {
        $(":hidden[name='currentPage']").val(pageNumber);
        $(":hidden[name='pageSize']").val(5);
        $("#goPage").submit();
    }

    $(function () {
        //分页一些东西的隐藏与显示
        let search = ${pageResult.totalPage};
        //如果只有一页,隐藏所有
        if (search < 2) {
            $("#footPage").hide();
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