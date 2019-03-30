<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>搜索结果</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">

    <!--top栏样式-->
    <link rel="stylesheet" href="../../css/commons/top.css">
    <!--sidebar-left样式-->
    <link rel="stylesheet" href="../../css/commons/sidebar_left.css">
    <!--login的模态框-->
    <link rel="stylesheet" href="../../css/modal/modal_login.css">

    <!--主样式，覆盖前面的样式-->
    <link rel="stylesheet" href="../../css/commons/index.css">
    <!--=====================js=============================-->
    <script src="../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../lib/bootstrap/bootstrap.min.js"></script>

    <!--控制侧栏-->
    <script src="../../js/sidebar-left-control.js"></script>
   
   
   

</head>
<body>
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
                        <img src="../../images/路飞.jpg" class="img-circle" width="100" height="100"/>
                    </li>
                    <li role="presentation">
                        <span class="text-danger">路飞</span>
                    </li>
                    <li role="presentation"><a href="index.jsp"><span
                            class="text-left glyphicon glyphicon-home">&nbsp;</span>首页</a>
                    </li>
                    <li role="presentation"><a href="foreground/person/basic_info/basic_info.jsp"><span
                            class="text-left glyphicon glyphicon-user">&nbsp;</span>基本信息</a></li>
                    <li role="presentation"><a href="foreground/person/basic_info/person_account.jsp"><span
                            class="text-left glyphicon glyphicon-user">&nbsp;</span>账户信息</a></li>
                    <li role="  presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-comment">&nbsp;</span>消息</a></li>
                    <li role="presentation"><a href="foreground/person/collection/collection_posts.jsp"><span
                            class="text-left glyphicon glyphicon-star">&nbsp;</span>收藏夹</a>
                    </li>
                    <li role="presentation"><a href="foreground/person/post/person_posts.jsp"><span
                            class="text-left glyphicon glyphicon-user">&nbsp;</span>我的贴子</a></li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-question-sign">&nbsp;</span>帮助</a></li>
                    <!-- <li role="presentation"><a href="#"><span
                             class="text-left glyphicon glyphicon-calendar">&nbsp;</span>日期</a>
                     </li>
                     <li role="presentation"><a href="#"><span
                             class="text-left glyphicon glyphicon-time">&nbsp;</span>时间</a>
                     </li>-->
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-cog">&nbsp;</span>设置</a>
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
                    <div class="row">
                        <span class="text-left text-info"><i><small>搜索结果展示...</small></i></span>
                        <div class="panel-group">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <span><small>贴子</small></span>
                                </div>
                                <div class="panel-body">
                                    <table class="table table-striped  table-hover">
                                        <tr>
                                            <td><a href="foreground/post/post_list.jsp">计算机发展史</a></td>
                                        </tr>
                                        <tr>
                                            <td><a href="foreground/post/post_list.jsp">计算机发展史</a></td>
                                        </tr>
                                        <tr>
                                            <td><a href="foreground/post/post_list.jsp">计算机发展史</a></td>
                                        </tr>
                                        <tr>
                                            <td> &nbsp;
                                                <span class="pull-right"><a href="#">更多..</a></span></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <hr>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <span><small>板块</small></span>
                                </div>
                                <div class="panel-body">
                                    <table class="table table-striped  table-hover">
                                        <tr>
                                            <td><a href="foreground/post/post_list.jsp">计算机</a></td>
                                        </tr>
                                        <tr>
                                            <td><a href="foreground/post/post_list.jsp">计算机</a></td>
                                        </tr>
                                        <tr>
                                            <td><a href="foreground/post/post_list.jsp">计算机</a></td>
                                        </tr>
                                        <tr>
                                            <td> &nbsp;
                                                <span class="pull-right"><a href="#">更多..</a></span></td>
                                        </tr>

                                    </table>
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
            </div>
        </div>
    </div>
</div>

<!--button组-->
<div id="goTop" class="btn-group-vertical dropup">
    <button type="button" class="btn btn-primary" onclick="writePost()">
        <span class="glyphicon glyphicon-comment"></span>
        发帖
    </button>
    <button type="button" data-toggle="dropup" class="btn btn-success">
        <span class="caret"></span>
        Home
    </button>
</div>

<script>

    /*快速发帖*/
    function writePost() {
        window.location = "foreground/post/write_post_quickly.jsp";
    }

    /*
    * 点击回顶部
    * */
    $(function () {
        $("#goTop button").click(function () {
            window.scrollTo(0, 0, 0, 0);
        })
        if ($(window).width() > 750) {
            $(".school-hot").css({"border-right": "2px solid blue"});
            $(".board-hot").css({"border-left": "2px solid blue"})

        }
    })

</script>
</body>
</html>