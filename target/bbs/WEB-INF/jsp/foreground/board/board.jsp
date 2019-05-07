<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>一个panel</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/css/panel/panel.css">
    <!--引入一些样式-->
    <link rel="stylesheet" href="/css/commons/top.css">
    <link rel="stylesheet" href="/css/modal/modal_login.css">
    <link rel="stylesheet" href="/css/commons/sidebar_left.css">
    <link rel="stylesheet" href="/css/board/board.css">

    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/sidebar-left-control.js"></script>
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
                    <a class="navbar-brand" href="/index.jsp"
                       style="background-image: url('/images/bg/1554629378_742229.png');width: 500px">
                    </a>
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
                <div class="col-md-2  nav-addon">
                    <a href="/public"><span class="glyphicon glyphicon-cloud">&nbsp;话题广场</span></a>
                    <c:if test="${not empty sessionScope.CURRENT_USER}">
                        <a href="/person/myCircle/${sessionScope.CURRENT_USER.id}"><span
                                class="glyphicon glyphicon-globe">&nbsp;我的圈子</span></a>
                    </c:if>
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
        <div class="row">
            <!--路径导航栏-->
            <div class="row border-nav">
                <ol class="breadcrumb">
                    <li><a href="/index">首页</a></li>
                    <li class="active">${panel.title}</li>
                </ol>
            </div>
            <div id="main">
                <div id="collapseParent" class="panel-group">
                    <div class="panel">
                        <div class="row panel-message">
                            <div class="col-md-4">
                                <div class="panel-logo text-center">
                                    <img src="" alt="" value="${panel.logoPath}" class="showUserHeadImg" width="250"
                                         height="250">
                                    <br>
                                    <div class="logo-title">
                                        ${panel.title}
                                    </div>
                                </div>
                                <div class="panel-detail">
                                    <div>
                                        <p>
                                            简介：${panel.info}
                                        </p>
                                    </div>
                                    <div>
                                        <p>
                                            详细信息：${panel.detail}
                                        </p>
                                    </div>
                                    <div>
                                        <p>
                                            创建时间：<f:formatDate value="${panel.createTime}" pattern="yyyy-MM-dd HH:mm"/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8" style="margin-left: 50px;background-color: white;">
                                <div class="text-left">
                                    <h2><a href="#">河南中医药大学六十周年庆</a></h2>
                                </div>
                                <div class="hotPost">
                                    <c:forEach items="${panel.hotPosts}" var="post">
                                        <p>
                                        <span>
                                            <a href="/post/${post.id}"><span
                                                    class="glyphicon glyphicon-option-vertical"></span>
                                                    ${post.postTitle}
                                            </a>
                                        </span>
                                        <span class="pull-right">
                                            [${post.boardTitle}]
                                        </span>
                                        </p>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${not empty panel.boards}">
                            <c:forEach items="${panel.boards}" var="b" varStatus="i">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <span class="lead"><a href="/board/${b.id}">${b.boardTitle}</a></span>
                                        <div class="pull-right">
                                            <a role="button" data-toggle="collapse" href="#collapse${i.index}"
                                               aria-expanded="true"
                                               aria-controls="collapseOne" style="font-size: 18px">抽屉<span
                                                    class="caret"></span></a>
                                        </div>
                                    </div>
                                    <div id="collapse${i.index}" class="panel-collapse collapse in">
                                        <div class="panel-body panel-border">
                                            <c:forEach items="${b.areas}" var="a">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <a href="/area/${a.id}">[${a.areaTitle}]</a>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <p class="text-info">[贴子数]:1354</p>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <p>
                                                            <small>
                                                                <f:formatDate value="${a.createTime}"
                                                                              pattern="yyyy-MM-dd HH:mm:ss"/>
                                                            </small>
                                                        </p>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <span>暂时为空</span>
                                    <div class="drop_span pull-right">
                                        <a role="button" data-toggle="collapse" href="#collapse1"
                                           aria-expanded="true"
                                           aria-controls="collapseOne"><span class="caret"></span></a>
                                    </div>
                                    </button>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div id="foot" class="container">
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
</div>
<script>
    $(function () {

        $(".panel-detail").hide()

        $(".panel-logo").mouseover(function () {
            $(".logo-title").hide()
            $(".panel-detail").show()
        }).mouseleave(function () {
            $(".logo-title").show()
            $(".panel-detail").hide()
        })


        $(".panel-border .row:even").css("border-left", "blue solid 3px")
        $(".panel-border .row:odd").css("border-left", "red solid 3px")
    })
</script>
</body>
</html>