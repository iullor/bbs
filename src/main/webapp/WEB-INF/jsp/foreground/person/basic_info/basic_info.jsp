<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <!--top栏样式-->
    <link rel="stylesheet" href="../../../../../css/commons/top.css">
    <link rel="stylesheet" href="../../../../../css/person/person_manager-left.css">
    <link rel="stylesheet" href="../../../../../css/person/basic_info/basic_info.css">

    <script src="../../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../../lib/bootstrap/bootstrap.min.js"></script>
    <!--  <script src="../../../js/iframe-height-automitic.js"></script>-->
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
                    <!--<div class="navbar-form  input-group">
                        <input type="text" class="form-control" placeholder="贴子/用户/板块">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Search</button>
                        </span>
                    </div>-->

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
            <form action="">
                <h3><b>基本信息</b></h3>
                <hr style="background-color: grey;height: 1px; border: none;width: 92%;margin-left: 0px">
                <div class="row" style="width: 92%">
                    <div class="form-group col-md-4">
                        <label class="control-label">姓名
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="text" class="form-control" name="name" id="Name"
                               placeholder="zhangsan">
                    </div>
                    <div class="form-group col-md-4">
                        <label class="control-label">age
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="number" class="form-control" name="name" id="Age"
                               placeholder="18">
                    </div>
                    <div class="form-group col-md-4">
                        <label class="control-label">Birthday
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="date" class="form-control" name="name" id="Date">
                    </div>
                </div>
                <div class="row" style="width: 92%">
                    <div class="form-group col-md-4">
                        <label class="control-label">QQ
                        </label>
                        <input type="number" class="form-control" name="qqNumber" id="qqNumber"
                               placeholder="100000">
                    </div>
                    <div class="form-group col-md-5">
                        <label class="control-label">Phone Number
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="number" class="form-control" name="phoneNumber" id="phoneNumber"
                               placeholder="13781100219">
                    </div>
                </div>
                <div class="row" style="width: 92%">
                    <div class="form-group col-md-12">
                        <label class="control-label">wechat number
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="number" class="form-control" name="wechatNumber" id="wechat"
                               placeholder="13781100219">
                    </div>
                </div>
                <div class="row" style="width: 92%">
                    <div class="form-group col-md-4">
                        <label class="control-label">省份
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="text" class="form-control" name="province" id="province" placeholder="河南">
                    </div>
                    <div class="form-group col-md-4">
                        <label class="control-label">城市
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="text" class="form-control" name="city" id="city" placeholder="郑州市">
                    </div>
                    <div class="form-group col-md-4">
                        <label class="control-label">街道
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="text" class="form-control" name="street" id="street" placeholder="金水区">
                    </div>
                </div>
                <div class="row" style="width: 92%">
                    <div class="form-group col-md-12">
                        <label class="control-label">详细地址
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="text" class="form-control" name="detail" id="detail">
                    </div>
                </div>
                <hr style="background-color: wheat;height: 1px; border: none;width: 92%;margin-left: 0px">
                <div class="form-group">
                    <div class="col-md-offset-1 col-md-2">
                        <button type="reset" class="btn btn-lg btn-default">取消</button>
                    </div>
                    <div class="col-md-offset-1 col-md-2">
                        <button type="submit" class="btn btn-lg btn-success">保存</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>