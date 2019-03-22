<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>一个area</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../css/panel/panel.css">

    <!--引入一些样式-->
    <link rel="stylesheet" href="../../../../css/commons/sidebar_left.css">
    <link rel="stylesheet" href="../../../../css/commons/top.css">
    <link rel="stylesheet" href="../../../../css/modal/modal_login.css">
    <link rel="stylesheet" href="../../../../css/commons/commons.css">
    <link rel="stylesheet" href="../../../../css/board/board.css">
    <link rel="stylesheet" href="../../../../css/board/board_post_list.css">


    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <script src="../../../../js/sidebar-left-control.js"></script>
    <script src="../../../../js/commons.js"></script>
</head>
<body>
<a href="area.jsp">进入该版</a>
<header class="navbar navbar-fixed-top navbar-inverse">
    <nav class="navbar">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-4 navbar-header">
                    <button type="button" class="navbar-toggle collapsed glyphicon glyphicon-menu-hamburger"
                            data-toggle="collapse"
                            data-target="#sidebar-wrapper" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="#">BBS-Student</a>
                    <!--
                        搜索框放在导航栏的头，可以在响应式的时候在上面
                    -->
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <form class="navbar-form row">
                        <div class="form-group col-xs-8 col-sm-8 col-md-8">
                            <input type="text" class="form-control" id="search" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default col-xs-4 col-sm-4 col-md-4"><span
                                class="glyphicon glyphicon-search"></span>Search
                        </button>
                    </form>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-2 row">
                    <a id="login" href="#" data-toggle="modal" data-target="#loginModal" data-keyboard="true">请登录<span
                            class="glyphicon glyphicon-log-in"></span></a>
                </div>
            </div>
        </div>
    </nav>
</header>
<div class="container-fluid">
    <div class="row">
        <div id="left-navbar" class="col-xs-12 col-sm-1 col-md-1">
            <nav id="sidebar-wrapper" class="collapse navbar-fixed-top navbar-collapse"
                 role="navigation">
                <ul class="nav sidebar-nav">
                    <li class="sidebar-brand">
                        <span id="close" class="glyphicon glyphicon-menu-hamburger"></span>
                    </li>
                    <li role="presentation">
                        <img src="../../../../images/路飞.jpg" class="img-circle" width="100" height="100"/>
                    </li>
                    <li role="presentation">
                        <span class="text-danger">路飞</span>
                    </li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-home">&nbsp</span>首页</a>
                    </li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-user">&nbsp</span>基本信息</a></li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-comment">&nbsp</span>消息</a></li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-star">&nbsp</span>收藏夹</a>
                    </li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-user">&nbsp</span>我的贴子</a></li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-question-sign">&nbsp</span>帮助</a></li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-calendar">&nbsp</span>日期</a>
                    </li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-time">&nbsp</span>时间</a>
                    </li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-cog">&nbsp</span>设置</a>
                    </li>
                    <li role="presentation" class="mt-5 mb-3 text-muted">&copy; 学生论坛版权所有</li>
                </ul>
            </nav>
        </div>
        <div id="content" class="col-xs-12 col-sm-11 col-md-11">
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
                            <form action="/login" method="post">
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
                                    <input type="text" class="form-control" id="password">
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
            <div class="content-inner">
                <span id="open" class="glyphicon glyphicon-menu-hamburger"></span>
                <div id="main" class="container">
                    <!--路径导航栏-->
                    <div class="row" style="border-bottom: grey solid 1px;margin-top: 20px;">
                        <ol class="breadcrumb">
                            <li><a href="../../public/index.jsp">Home</a></li>
                            <li><a href="../panel/panel.jsp">Panel</a></li>
                            <li><a href="ml">School</a></li>
                            <li class="active">Computer Science</li>
                        </ol>
                    </div>
                    <hr>
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <p class="text-vertical-center">
                                    <span class="text-md text-grey">Computer Science</span>
                                    <span class="glyphicon glyphicon-star-empty btn btn-info pull-right"
                                          style="margin-top: 5px;"
                                          onclick="changeUpDown(event,this)"
                                          tempClass="glyphicon glyphicon-star btn btn-success pull-right ">收藏</span>
                                    </span>
                                    <span class="pull-right  btn btn-default"
                                          style="margin-right: 20px;margin-top: 7px;">
                                        <a href="/post/input/0"><span
                                                class="glyphicon glyphicon-comment">发帖</span></a>
                                    </span>
                                </p>
                                <p>
                                    <small>板块信息：信息技术学院，计算机科学与技术班</small>
                                </p>
                                <p>
                                    <small>在线:2 人</small>&nbsp;&nbsp;&nbsp;<span>贴子:1000K</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><a
                                        href="#">Rank&nbsp;100</a></span>
                                </p>
                                <p>
                                    <span>版主：路飞</span>
                                </p>

                            </div>
                        </div>
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
                                <tr class="row">
                                    <td class="col-md-1 text-left">
                                        <button class="label-top">置顶</button>
                                    </td>
                                    <td class="col-md-6"><a href="/post">计算机行业的现状及发展</a></td>
                                    <td class="col-md-1"><img src="../../../../images/路飞.jpg" width="25" height="25">
                                    </td>
                                    <td class="col-md-2">2018//10/12</td>
                                    <td class="col-md-2">20</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="panel-footer panel-default">
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
                <div id="foot" class="container">
                    <p class="text-center"><span><a href="#">联系我们</a>&nbsp;&nbsp;<small>--</small></span>友情连接&nbsp;<a
                            href="https://www.baidu.com">百度</a>&nbsp;<a
                            href="https://www.google.com">Google</a>&nbsp;<a
                            href="https://www.github.com">GitHub</a></p>
                    <div class="text-center">
                        <p>© 学生论坛版权所有</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    /*
    * */
    $("tr").click(function () {
        window.location.href = '../post/post_list.jsp';
    })
</script>
</body>
</html>