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
    <!--引入一些样式-->
    <link rel="stylesheet" href="/css/commons/sidebar_left.css">
    <link rel="stylesheet" href="/css/commons/top.css">
    <link rel="stylesheet" href="/css/modal/modal_login.css">
    <link rel="stylesheet" href="/css/board/board.css">
    <link rel="stylesheet" href="/css/panel/panel.css">
    <!--js-->
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
<div class="containe">
    <div class="row">
        <div id="content" class="row">
            <div class="content-inner">
                <span id="open" class="glyphicon glyphicon-menu-hamburger"></span>
                <div id="main" class="container">
                    <!--路径导航栏-->
                    <div class="row" style="border-bottom: grey solid 1px;margin-top: 20px">
                        <ol class="breadcrumb">
                            <li><a href="../../public/index.jsp">Home</a></li>
                            <li class="active">Panel</li>
                            <!--<li class="active">School</li>-->
                        </ol>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-6 col-md-4 column2">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h5 class="panel-title"><span><span class="text-center"><img
                                            src="../../../../images/board/school.svg"
                                            width="25"
                                            height="25"></span>&nbsp;&nbsp;&nbsp;<a
                                            href="../board/board.jsp">学校院系</a></span>
                                        <a href="../board/board.jsp"><span
                                                class="pull-right glyphicon glyphicon-chevron-right"></span></a>
                                    </h5>
                                </div>
                                <div class="panel-body">
                                    <p>
                                        <span><small><a href="#">信息技术学院</a></small></span>
                                        <span><small><a href="#">康复医学院</a></small></span>
                                        <span><small><a href="#">针灸推拿</a></small></span>
                                        <span><small><a href="#">人文</a></small></span>
                                    </p>
                                    <p>
                                        <span><small><a href="#">信息技术学院</a></small></span>
                                        <span><small><a href="#">康复医学院</a></small></span>
                                        <span><small><a href="#">针灸推拿</a></small></span>
                                        <span><small><a href="#">人文</a></small></span>
                                    </p>
                                    <p>
                                        <span><small><a href="#">信息技术学院</a></small></span>
                                        <span><small><a href="#">康复医学院</a></small></span>
                                        <span><small><a href="#">针灸推拿</a></small></span>
                                        <span><small><a href="#">人文</a></small></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 column2 ">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h5 class="panel-title"><span><span class="text-center"><img
                                            src="../../../../images/board/academic.svg"
                                            width="25" height="25"></span>&nbsp;&nbsp;&nbsp;学术</span>
                                        <a href="#"><span
                                                class="pull-right glyphicon glyphicon-chevron-right"></span></a>
                                    </h5>

                                </div>
                                <div class="panel-body">
                                    <p>
                                        <span><small><a href="#">信息技术学院</a></small></span>
                                        <span><small><a href="#">康复医学院</a></small></span>
                                        <span><small><a href="#">针灸推拿</a></small></span>
                                        <span><small><a href="#">人文</a></small></span>
                                    </p>
                                    <p>
                                        <span><small><a href="#">信息技术学院</a></small></span>
                                        <span><small><a href="#">康复医学院</a></small></span>
                                        <span><small><a href="#">针灸推拿</a></small></span>
                                        <span><small><a href="#">人文</a></small></span>
                                    </p>
                                    <p>
                                        <span><small><a href="#">信息技术学院</a></small></span>
                                        <span><small><a href="#">康复医学院</a></small></span>
                                        <span><small><a href="#">针灸推拿</a></small></span>
                                        <span><small><a href="#">人文</a></small></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 column2">
                            <div class="panel panel-danger">
                                <div class="panel-heading panel-info">
                                    <h5 class="panel-title"><span><span class="text-center"><img
                                            src="../../../../images/board/city.svg" width="25" height="25"></span>&nbsp;&nbsp;&nbsp;乡愁</span>
                                        <a href="#"><span
                                                class="pull-right glyphicon glyphicon-chevron-right"></span></a>
                                    </h5>
                                </div>
                                <div class="panel-body">
                                    <p>
                                        <span><small><a href="#">信息技术学院</a></small></span>
                                        <span><small><a href="#">康复医学院</a></small></span>
                                        <span><small><a href="#">针灸推拿</a></small></span>
                                        <span><small><a href="#">人文</a></small></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 column2 ">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h5 class="panel-title"><span><span class="text-center"><img
                                            src="../../../../images/board/academic.svg"
                                            width="25" height="25"></span>&nbsp;&nbsp;&nbsp;学术</span>
                                        <a href="#"><span
                                                class="pull-right glyphicon glyphicon-chevron-right"></span></a>
                                    </h5>

                                </div>
                                <div class="panel-body">
                                    <p>
                                        <span><small><a href="#">信息技术学院</a></small></span>
                                        <span><small><a href="#">康复医学院</a></small></span>
                                        <span><small><a href="#">针灸推拿</a></small></span>
                                        <span><small><a href="#">人文</a></small></span>
                                    </p>
                                    <p>
                                        <span><small><a href="#">信息技术学院</a></small></span>
                                        <span><small><a href="#">康复医学院</a></small></span>
                                        <span><small><a href="#">针灸推拿</a></small></span>
                                        <span><small><a href="#">人文</a></small></span>
                                    </p>
                                    <p>
                                        <span><small><a href="#">信息技术学院</a></small></span>
                                        <span><small><a href="#">康复医学院</a></small></span>
                                        <span><small><a href="#">针灸推拿</a></small></span>
                                        <span><small><a href="#">人文</a></small></span>
                                    </p>
                                </div>
                            </div>
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
                                        <input type="text" class="form-control has-feedback" name="username"
                                               id="username">
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
</div>
<script>

</script>
</body>
</html>