<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>公共圈子</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <!--sidebar-left样式-->
    <link rel="stylesheet" href="../../css/commons/sidebar_left.css">
    <!--login的模态框-->
    <link rel="stylesheet" href="../../css/modal/modal_login.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <!--主样式，覆盖前面的样式-->
    <link rel="stylesheet" href="../../css/commons/index.css">
    <link href="/lib/jQuery/jquery-ui-1.12.1.custom/jquery-ui.css">
    <!--=====================js=============================-->
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/bootstrap.min.js"></script>
    <script src="/lib/jQuery/jquery-ui-1.12.1.custom/jquery-ui.js"/>
    <!--控制侧栏-->
    <script src="../../js/sidebar-left-control.js"></script>
    <style>
        .public-body {
            margin-top: 80px;
            width: auto;
            height: 1000px;
        }

        .public-body-left {
            background-color: white;
            height: 1000px;
            width: auto;

        }

        .public-body-left > div:first-child {
            margin-top: 100px;
            border-bottom: 1px gray solid;
        }

        .area {
            border-radius: 5px;
            z-index: 5;
            background-color: #f5f5f5;
            width: 90%;
            height: 250px;
            margin-left: 30px;
            margin-top: 20px;
            border-bottom: 1px solid blue;
        }

        .public-body-right {
            background-color: white;
            height: 1000px;
            width: auto;
            margin-top: 200px;
            border-radius: 5px;
        }

        .hotArea {
            width: 90%;
            height: 250px;
            margin-left: 20px;
        }

        .hotArea > div:first-child {
            height: 50px;
            padding-top: 5px;
            border-top: 1px solid #2D64B3;
            background-color: #f5f5f5;
        }

        .hot1 {
            text-align: center;
            height: 40px;
            border: 1px #f5f5f5 solid;
            font-size: 18px;
            padding-top: 8px;
        }

        .hotUser {
            width: 90%;
            height: 250px;
            margin-left: 20px;
            margin-top: 50px;
        }

        .hotUserTitle {
            height: 50px;
            padding-top: 5px;
            border-top: 1px solid #2D64B3;
            background-color: #f5f5f5;
        }

        .hot2 {
            text-align: center;
            height: 40px;
            border: 1px #f5f5f5 solid;
            font-size: 18px;
            padding-top: 8px;
        }

        /*==========================*/
        .trash {
            position: fixed;
            width: 50px;
            height: 800px;
            bottom: 50px;
            right: 20px;
            border: 1px gray solid;
        }

        .trash img {
            margin-top: 730px;
        }
    </style>
</head>
<body>
<link rel="stylesheet" href="../../css/commons/sidebar_left.css">
<script src="../../js/sidebar-left-control.js"></script>
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
        <div class="public-body">
            <div class="col-md-8">
                <div class="public-body-left">
                    <div>
                        <h4>广场</h4>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="area ui-widget-content">

                        </div>
                        <div class="area ui-widget-content">
                            哈哈哈哈哈
                        </div>
                        <div class="area ui-widget-content">
                            哈哈哈哈哈
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="public-body-right">
                    <%--热点小分区--%>
                    <div class="row">
                        <div class="hotArea">
                            <div class="com-md-12 text-center">
                                <h4>热门板块</h4>
                            </div>
                            <div class="col-md-6 hot1">
                                <a href="#">量子计算机</a>
                            </div>
                            <div class="col-md-6 hot1">
                                <a href="#">光伏电池</a>
                            </div>
                            <div class="col-md-6 hot1">
                                <a href="#">幽默喜剧</a>
                            </div>
                        </div>
                    </div>
                    <%--热门用户--%>
                    <div class="row">
                        <div class="hotUser">
                            <div class="col-md-12 hotUserTitle text-center">
                                <h4>热门的用户</h4>
                            </div>
                            <div class="hot2 col-md-6">
                                小狼
                            </div>
                            <div class="hot2 col-md-6">
                                白雪
                            </div>
                            <div class="hot2 col-md-6">
                                泪滴
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="trash ui-widget-header">
    <img src="/images/public/trash.png" alt="" height="50" width="50">
</div>
<script>
    $(function () {
        //animation: myfirst 5s;
        $(".area").draggable(function () {

        });
        /*$(".trash").droppable({
            drop: function (event, ui) {
                $(this).addClass("ui-state-highlight")
            }
        });*/
    });
</script>
</body>
</html>