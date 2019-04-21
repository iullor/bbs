<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>收藏贴子</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <!--top栏样式-->
    <link rel="stylesheet" href="/css/commons/top.css">
    <link rel="stylesheet" href="/css/person/person_manager-left.css">
    <link rel="stylesheet" href="/css/person/collection/collection_posts.css">

    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <style>
        .collectedPost {
            height: 50px;
            border-bottom: 1px slategrey dashed;
            color: black;
            font-size: 17px;
            padding-top: 18px;
        }

        .collectedPost:hover {
            background-color: #f1f4f5;
        }

        .collectedPost > div:last-child {
            margin-top: -8px;
        }

    </style>
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

                    <a class="navbar-brand" href="../../public/index.jsp">BBS-Student</a>
                    <!--
                        搜索框放在导航栏的头，可以在响应式的时候在上面
                    -->
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="row" style="margin-top: 6px">
                        <form>
                            <div class="form-group col-md-8">
                                <input type="text" class="form-control" id="search" placeholder="Search">
                            </div>
                            <div class="form-group col-xs-4 col-sm-4 col-md-4">
                                <button type="submit" class="btn btn-default"><span
                                        class="glyphicon glyphicon-search"></span>Search
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${empty sessionScope.CURRENT_USER}">
                        <div class="col-xs-12 col-sm-12 col-md-2" style="margin-top: 8px;font-size: 18px">
                            <a id="login" href="#" data-toggle="modal" data-target="#loginModal" data-keyboard="true">请登录<span
                                    class="glyphicon glyphicon-log-in"></span></a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-xs-12 col-sm-12 col-md-2"
                             style="margin-top: 8px;font-size: 18px;">
                            <a id="logout" href="/logout">注销<span class="glyphicon glyphicon-log-in"></span></a>
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
                    <div id="person-basic-info" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li class="active"><a href="/person/basic/account" class="">账号信息</a>
                                </li>
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
                    <div id="person_apply" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="/person/apply" class="">申请版主</a></li>
                                <li><a href="#" class="">申请区主</a></li>
                                <li><a href="#" class="">申请贴子置顶</a></li>
                                <li><a href="#" class="">申请公版展示</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#friends_circle" data-toggle="collapse"
                               data-parent="#panel-parent"><span
                                    class="glyphicon glyphicon-globe"></span><span>朋友圈</span></a>
                        </div>
                    </div>
                    <div id="friends_circle" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="#" class="">我的分享</a></li>
                                <li><a href="#" class="">他人</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#createMyBoard" data-toggle="collapse"
                               data-parent="#panel-parent"><span
                                    class="glyphicon glyphicon-cloud"></span><span>我的公版</span></a>
                        </div>
                    </div>
                    <div id="createMyBoard" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="#" class="">创造</a></li>
                                <li><a href="#" class="">维修</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="list" class="col-md-8">
            <p>
                <span class="text-danger">收藏贴子</span>
                <span class="text-info pull-right">条数:${posts.size()}</span>
            </p>
            <c:choose>
                <c:when test="${not empty posts}">
                    <c:forEach items="${posts}" var="p" varStatus="i">
                        <div class="row collectedPost">
                            <div class="col-md-1">
                                <span>${i.index+1}</span>
                            </div>
                            <div class="col-md-6">
                                <a href="/post/${p.postId}"><span>${p.post.postTitle}</span></a>
                            </div>
                            <div class="col-md-3">
                                 <span>
                                        收藏时间:
                                        <f:formatDate value="${p.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </span>
                            </div>
                            <div class="col-md-2">
                                <span><a href="#" value="${p.postId}"
                                         class="btn btn-default cancelCollectedPost">取消收藏</a></span>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="row" style="margin-top: 100px">
                        <div class="col-md-offset-4 col-md-4">
                            <h4>
                                暂无收藏的贴子，前去 <a href="/index">浏览</a>
                            </h4>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
</div>

<script>
    $(function () {


        //收藏贴子
        $(".cancelCollectedPost").on("click", function () {
            let curPostId = $(this).attr("value");
            let obj = {
                postId: curPostId
            }
            $.ajax({
                url: '/person/collection/mypost/' + 0,
                type: 'post',
                data: JSON.stringify(obj),
                contentType: "application/json",
                success: function (data) {
                    if (data.status === '3003') {
                        alert("取消成功")
                        window.location.href = '/person/collection/myPosts';
                    }
                }
            })
        })
    })
</script>
</body>
</html>
