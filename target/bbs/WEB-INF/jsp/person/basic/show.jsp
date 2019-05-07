<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人管理</title>
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/css/commons/sidebar_left.css">
    <link rel="stylesheet" href="/css/person/person_manager-left.css">
    <link rel="stylesheet" href="/css/person/basic_info/person_account.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/person-left.js"></script>
    <script src="/js/sidebar-left-control.js"></script>
    <style>
        .container-inner {
            margin-top: -20px;
            border-radius: 20px;
            margin-bottom: 50px;
            height: auto;
            min-height: 1000px;
            _height: 1000px;
            background-color: white;
        }

        .nav-tabs li {
            margin: 20px 0px 0px 10px;
            padding-left: 0px;
            font-size: 18px;
            padding-top: 0px;
            text-align: center;
        }

        .tab-content {
            width: 97.5%;
            margin-left: 15px;
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
    <div class="row  col-md-offset-2 col-md-8">
        <div class="container-inner">
            <h3 style="padding-left: 50px;padding-top: 10px;">
                <b>
                    <c:if test="${user.id==sessionScope.CURRENT_USER.id}">
                        我的主页
                    </c:if>
                    <c:if test="${user.id!=sessionScope.CURRENT_USER.id}">
                        ${user.nickName}
                    </c:if>
                </b>
            </h3>
            <hr>
            <div class="row" style="height: 300px;border-bottom: 2px solid #f5f5f5;">
                <div class="col-md-4" style="border-right: 1px solid silver;">
                    <div class="text-center" style="height: 100%;font-size: 16px">
                        <img src="/images/superman.png" class="showUserHeadImg" value="${user.userBaseInfo.headImage}"
                             width="200" height="200" alt=""
                             style="border: 1px solid #afd9ee">
                        <p style="margin-top: 5px;">
                            <span>${user.nickName}</span>
                        </p>
                        <p style="margin-top: -10px">
                            <c:if test="${user.userBaseInfo.gender=='男'}">
                                <span style="color: blue;font-size: 30px">&male;&nbsp;</span>
                            </c:if>
                            <c:if test="${user.userBaseInfo.gender=='女'}">
                                <span style="color: pink;font-size: 30px">&female;&nbsp;</span>
                            </c:if>
                            <span>${user.userBaseInfo.age}岁</span>
                        </p>
                        <p style="margin-top: -10px">
                            <span class="glyphicon glyphicon-home">&nbsp;${user.userBaseInfo.province}&nbsp;${user.userBaseInfo.city}</span>
                        </p>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="" style="height: 100%">
                        <div style="height: 230px;padding-top: 20px">
                            <label>个人介绍</label>
                            <c:if test="${sessionScope.CURRENT_USER.id==user.id}">
                            </c:if>
                            <!--
                                三种情况，是他自己，就不显示关注，他关注过显示已关注，没关注的显示 关注
                            -->
                            <button class="btn btn-primary pull-right"
                                    style="margin-top: -10px;margin-left:20px;margin-right: 15px">关注&nbsp;<span
                                    class="glyphicon glyphicon-plus" style="font-size: 15px;"></span></button>

                            <p class="introduce"
                               style="text-indent: 2em;font-size: 16px;padding-top: 10px;border: 1px solid #f5f5f5;width: 85%;margin-left: 10px;height: 140px;">
                                <c:if test="${user.userBaseInfo.introduce==null}">
                                    <span>
                                        这家伙很懒，没有更新简介
                                    </span>
                                </c:if>
                                <c:if test="${user.userBaseInfo.introduce!=null}">
                                <span>
                                        ${user.userBaseInfo.introduce}
                                </span>
                                </c:if>
                                <textarea style="margin-left: -30px" name="introduce" cols="80" rows="5"></textarea>
                            </p>
                            <c:if test="${sessionScope.CURRENT_USER.id==user.id}">
                                <a id="updateIntroduce" href="#" class="btn btn-primary btn-sm pull-left"
                                   style="margin-left: 10px;margin-top: -5px;">修改&nbsp;<span
                                        class="glyphicon glyphicon-edit"></span></a>
                            </c:if>
                            <a id="exitUpdate" href="#" class="btn btn-default btn-sm pull-left"
                               style="margin-left: 10px;margin-top: -5px;">取消</a>
                            <a id="submitIntroduce" href="#" class="btn btn-info btn-sm pull-left"
                               style="margin-left: 10px;margin-top: -5px;">确认</a>
                        </div>
                        <div style="height: 70px;border-top: 1px solid #f5f5f5">
                            <p class="text-right" style="padding-top: 30px;font-size: 18px;">
                                <span style="padding-left: 50px;margin-right: 30px">帖子数&nbsp;${postCount}</span>
                                <span style="padding-left: 50px;margin-right: 30px">粉丝&nbsp;${fansCount}</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div style="height: 80px;">
                    <ul class="nav nav-tabs" style="margin-left: 15px">
                        <li class="active">
                            <a href="#recent" data-toggle="tab" class="text-danger">动态&nbsp;<span class=" badge"
                                                                                                  style="background-color: red;">100</span></a>
                        </li>
                        <li>
                            <a href="#collect" data-toggle="tab" class="text-primary">收藏&nbsp;<span class=" badge"
                                                                                                    style="background-color: blue;">${posts.size()}</span></a>
                        </li>
                        <li>
                            <a href="#focus" data-toggle="tab" class="text-warning">关注&nbsp;<span class=" badge"
                                                                                                  style="background-color: gold;">${focusUsers.size()}</span></a>
                        </li>
                        <li>
                            <a href="#topic" data-toggle="tab" class="text-success">话题&nbsp;<span class="badge"
                                                                                                  style="background-color: green;">100</span></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="tab-content">
                    <div id="recent" class="tab-pane fade in active"
                         style="background-color: white;color: rebeccapurple">
                        <div class="row">
                            <div class="col-md-2">
                                <div style="margin-left: 30px;padding-top: 20px;">
                                    <img class="img-circle" style="border: 1px blue solid;" src="/images/superman.png"
                                         width="50" height="50" alt="">
                                </div>
                            </div>
                            <div class="col-md-10">
                                <div style="padding-top: 10px;font-size: 18px;padding-right: 15px">
                                    <p>这家伙很懒，没有个人简介这家伙很懒，没有个人简介这家伙很懒，没有个人简介这家伙很懒，没有个人简介这家伙很懒，没有个人简介这家伙很懒，没有个人简介</p>
                                    <p class="text-right">2019/04/25 14:20</p>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-2">
                                <div style="margin-left: 30px;padding-top: 20px;">
                                    <img class="img-circle" style="border: 1px blue solid;" src="/images/superman.png"
                                         width="50" height="50" alt="">
                                </div>
                            </div>
                            <div class="col-md-10">
                                <div style="padding-top: 10px;font-size: 18px;padding-right: 15px">
                                    <p>这家伙很懒，没有个人简介这家伙很懒，没有个人简介这家伙很懒，没有个人简介这家伙很懒，没有个人简介这家伙很懒，没有个人简介这家伙很懒，没有个人简介</p>
                                    <p class="text-right">2019/04/25 14:20</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="collect" class="tab-pane fade" style="background-color: white;color: rebeccapurple;">
                        <c:choose>
                            <c:when test="${not empty posts}">
                                <c:forEach items="${posts}" var="post" varStatus="i">
                                    <div class="row" style="font-size: 17px;margin-top: 10px;">
                                        <div class="col-md-1" style="padding-left: 20px">
                                                ${i.index+1}
                                        </div>
                                        <div class="col-md-8">
                                            <a href="/post/${post.postId}">${post.post.postTitle}</a>
                                        </div>
                                        <div class="col-md-3">
                                            收藏时间:
                                            <f:formatDate value="${post.createTime}" pattern="yyyy/MM/dd HH:mm:ss"/>
                                        </div>
                                    </div>
                                    <hr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center" style="margin-top: 150px;margin-bottom: 150px">
                                    <h3>暂无收藏</h3>
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <div id="focus" class="tab-pane fade" style="background-color: white;color: rebeccapurple">
                        <c:choose>
                            <c:when test="${not empty focusUsers}">
                                <c:forEach items="${focusUsers}" var="focusUser" varStatus="j">
                            <div class="row" style="font-size: 17px;margin-top: 10px;">
                                <div class="col-md-1" style="padding-left: 20px">
                                        ${j.index+1}
                                </div>
                                <div class="col-md-4">
                                    <a href="/account/${focusUser.user.id}">
                                        <img src="" style="height: 30px;width: 30px;" class="showUserHeadImg"
                                             value="${focusUser.user.userBaseInfo.headImage}" alt="">
                                    </a>
                                </div>
                                <div class="col-md-4">
                                    <a href="/account/${focusUser.user.id}">${focusUser.user.nickName}</a>
                                </div>
                                <div class="col-md-3">
                                    <button class="btn btn-primary pull-right"
                                            style="margin-top: -10px;margin-left:20px;margin-right: 15px">关注&nbsp;<span
                                            class="glyphicon glyphicon-plus" style="font-size: 15px;"></span>
                                    </button>
                                </div>
                            </div>
                            <hr>
                        </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center" style="margin-top: 150px;margin-bottom: 150px">
                                    <h3>暂没有关注用户</h3>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div id="topic" class="tab-pane fade"
                         style="background-color: white;color: black ;font-size: 17px;margin-top: 10px;">
                        <c:choose>
                            <c:when test="${not empty topics}">
                                <c:forEach items="${topics}" var="topic" varStatus="k">
                                    <div class="row">
                                        <div class="col-md-1" style="padding-left: 20px">
                                                ${k.index+1}
                                        </div>
                                        <div class="col-md-5">
                                            <a href="/public/${topic.id}">${topic.topicTitle}</a>
                                        </div>
                                        <div class="col-md-3">
                                            发起时间:
                                            <f:formatDate value="${topic.createTime}" pattern="yyyy/MM/dd HH:mm:ss"/>
                                        </div>
                                        <div class="col-md-3">
                                            <span>浏览人数&nbsp;<span class="glyphicon glyphicon-eye-open">&nbsp;${topic.topicSeen}</span></span>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <span>评论人数:&nbsp;${topic.topicParticipations}</span>
                                        </div>
                                    </div>
                                    <hr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center" style="margin-top: 150px;margin-bottom: 150px">
                                    <h3>没有发表过话题</h3>
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $(".introduce textarea").hide();
        $("#exitUpdate").hide();
        $("#submitIntroduce").hide();

        $("#updateIntroduce").on("click", function () {
            $(".introduce span").hide();
            $(".introduce>textarea").show();
            let tmp = $(".introduce span").html();
            //取出两边的空字符串
            $(".introduce>textarea").html($.trim(tmp));
            $(this).hide();
            $("#exitUpdate").show();
            $("#submitIntroduce").show();
            return false;
        })
        $("#exitUpdate").on("click", function () {
            $(".introduce span").show();
            $(".introduce>textarea").hide();
            $("#updateIntroduce").show();
            $("#submitIntroduce").hide();
            $(this).hide();
            return false;
        });
        //确认修改个人简介
        $("#submitIntroduce").on("click", function () {
            //alert($(".introduce>textarea").val());
            let introduce = $(".introduce>textarea").val();
            let id = '${sessionScope.CURRENT_USER.id}';
            $.ajax({
                url: "/account/updateIntroduce?id=" + id + "&&introduce=" + introduce,
                type: "post",
                success: function (data) {
                    if (data === 1) {
                        $(".introduce span").html(introduce);
                        $(".introduce span").show();
                        $(".introduce>textarea").hide();
                        $("#updateIntroduce").show();
                        $("#exitUpdate").hide();
                        $("#submitIntroduce").hide();
                    }
                }
            })
        });


    })
</script>
</body>
</html>