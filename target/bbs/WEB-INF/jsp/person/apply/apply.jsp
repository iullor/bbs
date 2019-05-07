<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>申请贴子置顶</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <!--sidebar-left样式-->
    <link rel="stylesheet" href="/css/commons/sidebar_left.css">
    <link rel="stylesheet" href="/css/person/person_manager-left.css">
    <link rel="stylesheet" href="/css/person/post/person_posts.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/person-left.js"></script>
    <script src="/lib/ueditor/ueditor.config.js"></script>
    <script src="/lib/ueditor/ueditor.all.js"></script>
    <script src="/js/sidebar-left-control.js"></script>
    <style>
        #list > form {
            padding-left: 50px;
        }

        .one-line {
            width: 350px;
            height: 50px;
            margin-top: 20px;
            margin-left: 10px;

        }

        .one-line label {
            font-size: 15px;
            padding-top: 10px;
        }

        .one-line select {
            width: 250px;
            height: 40px;
            background-color: white;
            margin-top: 5px;
            margin-left: 20px;
            font-size: 16px;
            border-radius: 5px;
        }

        .reason {
            margin-top: 50px;
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
                    <div id="person-basic-info" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="/account/${sessionScope.CURRENT_USER.id}" class="">个人主页</a></li>
                                <li><a href="/person/basic/account" class="">账号信息</a></li>
                                <li><a href="/person/basic/info" class="">基本信息</a></li>
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
                                <li><a href="/person/mypost">我的贴子</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="/person/message/0">
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
                                <li><a href="/person/collection/myPosts" class="">贴子</a></li>
                                <li><a href="/person/collection/myAreas" class="">分区</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="/person/myfocus" class="">
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
                                <li><a href="/person/themes/basic" class="">基本样式</a></li>
                                <li><a href="#" class="">颜色搭配</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person_apply" data-toggle="collapse"
                               data-parent="#panel-parent"><span
                                    class="glyphicon glyphicon-send"></span><span>我的申请</span></a>
                        </div>
                    </div>
                    <div id="person_apply" class="panel-collapse  collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li class="active"><a href="/person/apply" class="">申请</a></li>
                                <li><a href="/person/apply/progress" class="">进度</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="/person/myCircle"><span
                                    class="glyphicon glyphicon-globe"></span><span>朋友圈</span></a>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#createMyBoard" data-toggle="collapse"
                               data-parent="#panel-parent"><span
                                    class="glyphicon glyphicon-cloud"></span><span>话题</span></a>
                        </div>
                    </div>
                    <div id="createMyBoard" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="/person/topic/input/0" class="">创建</a></li>
                                <li><a href="/person/topic" class="">查看</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="list" class="col-md-8 container-inner">
            <div class="text-left">
                <h3>申请置顶</h3>
                <hr>
            </div>
            <form action="/person/apply" method="post">
                <div class="one-line">
                    <div class="form-group">
                        <label>类型</label>
                        <select id="options" name="applyType">
                            <option value="-1">请选择</option>
                            <option value="1">贴子置顶</option>
                            <option value="2">版主</option>
                            <option value="3">首页显示话题</option>
                        </select>
                    </div>
                </div>
                <div class="one-line">
                    <div class="form-group">
                        <label>选择</label>
                        <select id="waitOptions" name="post">
                            <option value="">请选择</option>
                        </select>
                    </div>
                </div>
                <div class="reason">
                    <label>输入申请理由</label>
                    <script id="content" name="applyReason">
                    </script>
                </div>
                <input type="hidden" name="brief">
                <div class="form-group" style="margin-top: 10px;text-align: center;margin-left: 450px">
                    <span>&nbsp;</span>
                    <button id="apply1" class="btn btn-warning" type="submit">
                        申请
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<script>
    var ueditor = UE.getEditor('content', {
        initialFrameHeight: 400,
        initialFrameWidth: 900,
        topOffset: 60,
        toolbars: [
            ['attachment', 'horizontal', 'simpleupload']
        ]
    });
    $(function () {
        //根据option去判断
        $("#options").on("change", function () {
            let op = $(this).val();
            console.log(op)
            $.ajax({
                url: "/person/apply/" + op,
                type: 'get',
                success: function (data) {
                    console.log(data)
                    var option = '<option value="-1">请选择</option>'
                    $("#waitOptions").empty();
                    $("#waitOptions").append(option);
                    $.each(data, function (index, d) {
                        //数组中，放置的是一个一个对象，通过对象.属性的方式来获取每一个属性的值
                        console.log(d.boardTitle)
                        console.log(d.postTitle)
                        console.log(d.topicTitle)
                        if (d.topicTitle !== 'undefined' && d.topicTitle != null) {
                            $("#waitOptions").append("<option value=" + d.id + ">" + d.topicTitle + "</option>");
                        }
                        if (d.postTitle !== 'undefined' && d.postTitle != null) {
                            $("#waitOptions").append("<option value=" + d.id + ">" + d.postTitle + "</option>");
                        }
                        if (d.boardTitle !== 'undefined' && d.boardTitle != null) {
                            $("#waitOptions").append("<option value=" + d.id + ">" + d.boardTitle + "</option>");
                        }
                    })
                }
            })
            if (op === '1') {
                $("#waitOptions").attr("name", "postId")
            } else if (op === '2') {
                $("#waitOptions").attr("name", "boardId")
            } else if (op === '3') {
                $("#waitOptions").attr("name", "topicId")
            }
        })
        $("#waitOptions").on("click", function () {
            if ($(this).children().length < 2) {
                alert("请先选择类别")
            }
        })
        $("#apply1").on("click", function () {
            var realContentTxt = ueditor.getContentTxt();
            $(":hidden[name='brief']").val(realContentTxt);
        })
    })
</script>
</body>
</html>