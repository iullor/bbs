<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <!--top栏样式-->
    <link rel="stylesheet" href="../../../../../css/commons/top.css">
    <link rel="stylesheet" href="../../../../../css/person/person_manager-left.css">
    <link rel="stylesheet" href="../../../../../css/person/basic_info/person_account.css">
    <script src="../../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../../lib/bootstrap/bootstrap.min.js"></script>
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

                    <a class="navbar-brand" href="../../../public/index.jsp">BBS-Student</a>
                    <!--
                        搜索框放在导航栏的头，可以在响应式的时候在上面
                    -->
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <form class="navbar-form row">
                        <div class="form-group col-xs-8 col-sm-8 col-md-8">
                            <input type="text" class="form-control" id="search" placeholder="贴子/用户/板块">
                        </div>
                        <button type="submit" class="btn btn-default col-xs-4 col-sm-4 col-md-4"><span
                                class="glyphicon glyphicon-search"></span>Search
                        </button>
                    </form>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-2 row text-center">
                    <a href="#">当前用户</a>
                    <a id="login" href="#" data-toggle="modal" data-target="#loginModal" data-keyboard="true">注销<span
                            class="glyphicon glyphicon-log-out"></span></a>
                </div>
            </div>
        </div>
    </nav>
</header>
<div class="container-fluid">
    <div class="row main">
        <div class=" col-md-offset-1 col-md-2">
            <!--侧边栏信息-->
            <div id="panel-parent" class="panel-group">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person-basic-info" data-toggle="collapse" data-parent="#panel-parent">
                                <span class="glyphicon glyphicon-user"></span><span>个人信息</span>
                            </a>
                        </div>
                    </div>
                    <div id="person-basic-info" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="person_account.jsp" class="">账号信息</a>
                                </li>
                                <li class="active"><a href="#" class="">基本信息</a></li>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person_posts" data-toggle="collapse" data-parent="#panel-parent">
                                <span class="glyphicon glyphicon-flag"></span><span>贴子</span>
                            </a>
                        </div>
                    </div>
                    <div id="person_posts" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="post/person_posts.jsp">我的贴子</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="../message/message.jsp">
                                <span class="glyphicon glyphicon-comment"></span><span>消息</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person_collections" data-toggle="collapse" data-parent="#panel-parent">
                                <span class="glyphicon glyphicon-star"></span><span>收藏夹</span>
                            </a>
                        </div>
                    </div>
                    <div id="person_collections" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="#" class="">贴子</a></li>
                                <li><a href="#" class="">板块</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="../focus/focus_person.jsp" class="">
                                <span class="glyphicon glyphicon-heart"></span><span>关注</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person_themes_setting" data-toggle="collapse"
                               data-parent="#panel-parent"><span
                                    class="glyphicon glyphicon-certificate"></span><span>系统主题</span></a>
                        </div>
                    </div>
                    <div id="person_themes_setting" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="#" class="">基本样式</a></li>
                                <li><a href="#" class="">颜色搭配</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8 container-inner">
            <h3><b>账号信息</b></h3>
            <hr>
            <form action="">
                <div class="row">
                    <div class="col-md-8">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="Username" class="control-label">Username
                                    <small>&nbsp;(不可选)</small>
                                </label>
                                <input type="text" id="Username" class="form-control" disabled
                                       placeholder="Username">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="Nickname" class="control-label">Nickname
                                    <small>&nbsp;(必填)</small>
                                </label>
                                <input type="text" id="Nickname" class="form-control" placeholder="Nickname"
                                       disabled>
                                <small><a href="#"><span
                                        class="glyphicon glyphicon-edit pull-right">修改</span></a></small>
                            </div>
                        </div>
                        <hr>
                        <h6><b>密码修改</b></h6>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="control-label">Password
                                    <small>&nbsp;(现有密码)</small>
                                </label>
                                <input type="password" class="form-control input_width" name="password"
                                       id="Password"
                                       placeholder="password">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="control-label">New Password
                                    <small>&nbsp;(必填)</small>
                                </label>
                                <input type="password" class="form-control input_width" name="check_password"
                                       id="Check_Password"
                                       placeholder="password">
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Repeat Password
                                    <small>&nbsp;(必填)</small>
                                </label>
                                <input type="password" class="form-control input_width" name="check_password"
                                       id="Repeat_Password"
                                       placeholder="password">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="control-label">Email
                                    <small>&nbsp;(必填)</small>
                                </label>
                                <input type="email" class="form-control input_width" name="email" id="Email"
                                       placeholder="abc@gmail.com" disabled>
                                <small><a href="#"><span
                                        class="glyphicon glyphicon-edit pull-right">修改</span></a></small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 image text-center">
                        <!--使用Ajax异步上传-->
                        <form action="">
                            <div style="height: 80px;margin-bottom: 10px">
                                <img src="../../../../../images/favicon.ico" width="80px" height="80px"
                                     style="margin-top: -50px;margin-right:10px "/>
                                <span class="glyphicon glyphicon-plus" id="uploadImage"></span>
                            </div>
                            <input type="file" name="headImage" id="headImage">
                            <button type="submit" class="btn btn-info">上传头像</button>
                        </form>
                    </div>
                </div>
                <hr>
                <div class="">
                    <button type="submit" class="btn btn-success">
                        提交
                    </button>&nbsp;&nbsp;&nbsp;
                    <button type="submit" class="btn btn-success">
                        取消
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>

</script>
</body>
</html>