<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>一个panel</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../css/panel/panel.css">

    <!--引入一些样式-->
    <link rel="stylesheet" href="../../../../css/commons/sidebar_left.css">
    <link rel="stylesheet" href="../../../../css/commons/top.css">
    <link rel="stylesheet" href="../../../../css/modal/modal_login.css">
    <link rel="stylesheet" href="../../../../css/board/board.css">
    <link rel="stylesheet" href="../../../../css/commons/commons.css">
    <link rel="stylesheet" href="../../../../css/post/post_list.css">


    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <script src="../../../../js/sidebar-left-control.js"></script>

    <!--动态添加留言的对话框-->
    <script src="/lib/ueditor/ueditor.config.js"></script>
    <script src="/lib/ueditor/ueditor.all.js"></script>
    <%-- <link href="/lib/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
     <script type="text/javascript" charset="utf-8" src="/lib/umeditor/umeditor.config.js"></script>
     <script type="text/javascript" charset="utf-8" src="/lib/umeditor/umeditor.min.js"></script>
     <script type="text/javascript" src="/lib/umeditor/lang/zh-cn/zh-cn.js"></script>--%>

    <style>
        .container .glyphicon-comment {
            color: rgba(0, 183, 238, 0.59);
        }

        .glyphicon-thumbs-up-done {
            color: rgba(255, 0, 0, 0.97);
        }

    </style>
</head>
<body>
<a href="../area/area.jsp">进入该版</a>
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
                        <img src="/images/favicon.ico" class="img-circle showUserHeadImg" width="100" height="100"
                             value="${sessionScope.CURRENT_USER.userBaseInfo.headImage}"/>
                    </li>
                    <li role="presentation">
                        <span class="text-danger">${sessionScope.CURRENT_USER.nickName}</span>
                    </li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-home">&nbsp</span>首页</a>
                    </li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-user">&nbsp</span>基本信息</a></li>
                    <li role="  presentation"><a href="#"><span
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
                    <div class="row">
                        <ol class="breadcrumb">
                            <li><a href="../../public/index.jsp">Home</a></li>
                            <li><a href="../panel/panel.jsp">Panel</a></li>
                            <li><a href="../board/board.jsp">School</a></li>
                            <li><a href="../area/area.jsp">Computer Science</a></li>
                            <li class="active">计算机发展</li>
                        </ol>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="panel panel-default">
                                <div class="panel-heading text-center">
                                    <a href="#"><img src="/images/路飞.jpg" class="showUserHeadImg"
                                                     value="${post.user.userBaseInfo.headImage}"/></a>
                                    <p><a href="#">${post.user.nickName}</a></p>
                                </div>
                                <div class="panel-border panel-default">
                                    <p class="text-center"><a href="#"><span class="text-grey">发帖：100</span></a></p>
                                    <p class="text-center">
                                            <span id="collectUser" class="glyphicon glyphicon-heart-empty btn btn-info"
                                                  tempClass="glyphicon glyphicon-heart btn btn-success">&nbsp;关注</span>
                                        <span><input type="hidden" id="postUserId" value="${post.user.id}"/></span>
                                    </p>
                                    <p class="text-center">
                                        <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;
                                        <span class="glyphicon glyphicon-envelope"></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="post-content">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <span id="collectPost"
                                              class="glyphicon glyphicon-star-empty btn btn-info pull-right"
                                              tempClass="glyphicon glyphicon-star btn btn-success pull-right ">&nbsp;收藏</span>
                                        <div class="panel-title">
                                            <h2>${post.postTitle}</h2>
                                        </div>
                                        <p class="post-content-part">&nbsp;&nbsp;
                                            <span> </span>
                                            <span class="pull-right">[${post.postType}]</span>
                                        </p>
                                    </div>
                                    <div id="post-content" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <p class="post-content-p">
                                                ${post.postContent}
                                            </p>
                                            <p class="text-center pull-right"
                                               style="font-size: 18px;padding-top: 13px;">
                                                <span class="glyphicon glyphicon-thumbs-up good-post"
                                                      style="padding-left: 10px"></span>
                                                <span></span>
                                                <span href="#comment1" class="glyphicon glyphicon-comment"
                                                      style="padding-left: 10px"></span>&nbsp;&nbsp;
                                                <span style="padding-left: 50px;">发布于：<em>2019-03-24 10:31:44</em></span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="panel-footer text-center">
                                        <a href="#post-content" data-toggle="collapse" data-target="#post-content"><span
                                                class="glyphicon glyphicon-menu-up"
                                                tempClass="glyphicon glyphicon-menu-down"
                                                onclick="changeUpDown(event,this)"></span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-group">
                        <!--评论列表-->
                        <c:choose>
                            <c:when test="${not empty post.comments}">
                                <c:forEach items="${post.comments}" var="comment" varStatus="i">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="media">
                                                <div class="row">
                                                    <div class="col-md-1">
                                                        <div class="media-left">
                                                            <span>${i.index+1}楼</span>
                                                            <a href="#">
                                                                <img src="/images/哈士奇.jpg" class="showUserHeadImg"
                                                                     value="${comment.user.userBaseInfo.headImage}"
                                                                     width="60" height="60">
                                                            </a>
                                                            <span>
                                                                <a href="/account/${comment.user.id}">${comment.user.nickName}</a></span>
                                                        </div>
                                                        <p></p>
                                                    </div>
                                                    <div class="col-md-11">
                                                        <div class="media-body">
                                                            <div class="comment-level1">
                                                                <p>${comment.commentContent}</p>
                                                            </div>
                                                            <div class="comment-bar media-bottom">
                                                                <p class="text-center pull-right"
                                                                   style="font-size: 16px;padding-top: 13px">
                                                                    <c:if test="${comment.replyNumber>0}">
                                                                        <span>
                                                                            <a href="#comment-level2-${i.index+1}"
                                                                               data-toggle="collapse"><span
                                                                                    class="glyphicon glyphicon-menu-down"
                                                                                    tempClass="glyphicon glyphicon-menu-down"
                                                                                    onclick="changeUpDown(event,this)">
                                                                                        <small><em>查看</em></small>
                                                                                    ${comment.replyNumber}</span></a>
                                                                         </span>
                                                                    </c:if>
                                                                    <span class="glyphicon glyphicon-thumbs-up good"></span>&nbsp;&nbsp;
                                                                    <span class="glyphicon glyphicon-comment reply-comment"
                                                                          CID="${comment.id}"
                                                                          CNickName="${comment.user.nickName}"
                                                                          CToUserId="${comment.user.id}"></span>&nbsp;&nbsp;
                                                                    <span style="padding-right: 50px">时间：<em>
                                                                        <f:formatDate value="${comment.createTime}"
                                                                                      pattern="yyyy-MM-dd HH:mm:ss"/>
                                                                    </em></span>
                                                                </p>
                                                            </div>
                                                            <!--二级评论-->
                                                            <div id="comment-level2-${i.index+1}"
                                                                 class="panel-collapse collapse comment-level2">
                                                                <c:choose>
                                                                    <c:when test="${not empty comment.replies}">
                                                                        <c:forEach items="${comment.replies}"
                                                                                   var="reply" varStatus="j">
                                                                            <div class="panel-body panel-comment">
                                                                                <div class="media">
                                                                                    <div class="media-left">
                                                                                        <a href="/account/${reply.user.id}">
                                                                                            <img
                                                                                                    class="showUserHeadImg"
                                                                                                    src="/images/favicon.ico"
                                                                                                    width="50"
                                                                                                    height="50"
                                                                                                    value="${reply.user.userBaseInfo.headImage}"></a>
                                                                                        <small><a
                                                                                                href="/account/${reply.user.id}">${reply.user.nickName}</a>
                                                                                        </small>
                                                                                    </div>
                                                                                    <div class="media-body media-middle">
                                                                                            ${reply.replyContent}
                                                                                    </div>
                                                                                    <div class="media-bottom comment-bar">
                                                                    <span style="float: left">
                                                                        <em>${j.index+1}层</em>
                                                                    </span>
                                                                                        <span>
                                                                         <a href="#" class="replyToReply"
                                                                            replyId="${reply.id}"
                                                                            toCommentId="${comment.id}"
                                                                            toUserId="${reply.fromUserId}"
                                                                            toUserNickName="${reply.user.nickName}"
                                                                         >回复Ta</a>
                                                                     </span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </c:forEach>
                                                                    </c:when>

                                                                    <c:otherwise>

                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="panel-footer row comment-textarea">
                                    <form action="" class="col-md-offset-1 col-md-11">
                                        <div class="form-group">
                                            <script id="comment2" class="secondComment" name="postContent"
                                                    type="text/plain">
                                            </script>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-success" type="submit">评论
                                            </button>
                                        </div>
                                    </form>
                                </div>
                                <%--分页--%>
                                <div class="panel-footer panel-default">
                                    <nav class="Page navigation text-center">
                                        <ul class="pagination">
                                            <li>
                                                <a href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <li><a href="#">1</a></li>
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
                            </c:when>
                            <c:otherwise>
                                暂无评论
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="row">
                        <form id="myInput" action="/comment" method="post">
                            <%--当前用户--%>
                            <input type="hidden" name="userId">
                            <input type="hidden" name="postId" value="${post.id}"/>
                            <input type="hidden" name="toCommentId"/>
                            <input type="hidden" name="toUserId">
                            <input type="hidden" name="replyId">
                            <script id="comment1" name="commentContent"
                                    type="text/plain">
                            </script>
                            <div class="form-group">
                                <button type="submit" class="btn btn-success">评论</button>
                            </div>
                        </form>
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
        <script>

            /*
            * 主评论的
            * */
            var editor = UE.getEditor('comment1', {
                    initialFrameHeight: 300,
                    toolbars: [
                        ['emotion', 'link', 'attachment', 'simpleupload']
                    ]
                }
            );


            $(function () {
                $(".comment-textarea").hide();
                $(".glyphicon-comment").on("click", function () {
                    var comment2 = $(".comment-textarea");
                    console.log(comment2)
                    $(this).parents("div.panel-body").append(comment2);
                })


                $(".panel-border .row:even").css("border-left", "blue solid 3px")
                $(".panel-border .row:odd").css("border-left", "red solid 3px")
                $(".board-hot-topic .row:even").css("border-top", "black solid 1px")
                $(".board-hot-topic .row:odd").css("border-top", "red solid 1px")

                //点赞
                $(".good-post").on("click", function () {
                    //两种状态
                    //贴子
                    var curPostId = '${post.id}';
                    var id = {
                        id: curPostId
                    }
                    var parten = $(this).attr("class");
                    let num = 0;
                    if (parten.match("glyphicon-thumbs-up-done") == null) {
                        $.ajax({
                            url: "/post/update/praise/" + 1,
                            type: "post",
                            contentType: "application/json",
                            data: JSON.stringify(id),
                            success: function (data) {
                                //赋值,修改样式
                                $(".good-post").next("span").html(data)
                            }
                        });
                        console.log(this)
                        $(this).addClass("glyphicon-thumbs-up-done");
                    } else {
                        //取消点赞
                        $.ajax({
                            url: "/post/update/praise/" + 0,
                            type: "post",
                            contentType: "application/json",
                            data: JSON.stringify(id),
                            success: function (data) {
                                //赋值,修改样式
                                $(".good-post").next("span").html(data)
                            }
                            //添加样式
                        });
                        $(this).removeClass("glyphicon-thumbs-up-done");
                    }
                    //评论
                    return false;
                })
                //踩
                //收藏贴子
                $("#collectPost").on("click", function () {
                    //判断当前的状态
                    let currentClass = $(this).attr("class");
                    let postId = '${post.id}';
                    let obj3 = {
                        postId: postId
                    }
                    //未收藏是蓝色，已经收藏是绿色
                    //如果当前的样式没有收藏，就发送收藏
                    if (currentClass.match("btn-success") == null) {
                        $.ajax({
                            url: "/collection/post/" + 1,
                            type: "post",
                            data: JSON.stringify(obj3),
                            contentType: "application/json",
                            success: function (data) {
                                if (data.status === '3002') {
                                    alert("收藏成功")
                                } else {
                                    alert("网络问题")
                                }
                            }
                        })
                        $(this).removeClass("glyphicon-star-empty").removeClass("btn-info");
                        $(this).addClass("glyphicon-star").addClass("btn-success");
                        $(this).html("已收藏")
                    } else {
                        //取消收藏
                        $.ajax({
                            url: "/collection/post/" + 0,
                            type: "post",
                            data: JSON.stringify(obj3),
                            contentType: "application/json",
                            success: function (data) {
                                if (data.status === '3003') {
                                    alert("取消成功")
                                } else {
                                    alert("网络问题")
                                }

                            }
                        })
                        $(this).removeClass("glyphicon-star").removeClass("btn-success");
                        $(this).addClass("glyphicon-star-empty").addClass("btn-info");
                        $(this).html("收藏")
                    }
                })

                //添加关注
                $("#collectUser").on("click", function () {
                    let userId = '${post.userId}'
                    let obj = {
                        userId: userId
                    };
                    let currentClass = $(this).attr("class");
                    //判断当前的状态,未关注是蓝色，已经关注是绿色
                    //如果当前的样式没有绿色，就发送关注
                    if (currentClass.match("btn-success") == null) {
                        $.ajax({
                            url: "/collection/user/" + 1,
                            type: "post",
                            data: JSON.stringify(obj),
                            contentType: "application/json",
                            success: function (data) {
                                console.log(data)
                                if (data.status === '3000') {
                                    alert("关注成功")
                                } else {
                                    alert("网络问题")
                                }
                            }
                        })
                        $(this).removeClass("glyphicon-heart-empty").removeClass("btn-info");
                        $(this).addClass("glyphicon-heart").addClass("btn-success");
                        $(this).html("已关注")
                    } else {
                        //取消关注
                        $.ajax({
                            url: "/collection/user/" + 0,
                            type: "post",
                            data: JSON.stringify(obj),
                            contentType: "application/json",
                            success: function (data) {
                                console.log(data)
                                if (data.status === '3001') {
                                    alert("已取消")
                                } else {
                                    alert("网络问题")
                                }
                            }
                        })
                        $(this).removeClass("glyphicon-heart").removeClass("btn-success");
                        $(this).addClass("glyphicon-heart-empty").addClass("btn-info");
                        $(this).html(" 关注")
                    }
                })

                //显示关注
                //当准备刷新页面的时候,获取当前的用户id,贴子id
                let curUserId = '${sessionScope.CURRENT_USER.id}'
                console.log(curUserId);
                let curPostUserId = '${post.userId}'
                console.log(curPostUserId)
                let curPostId = '${post.id}';
                console.log(curPostId);
                //根据用户名和贴子的作者去找
                if (curUserId != null && curPostUserId != null) {
                    var obj1 = {
                        currentUserId: curUserId,
                        userId: curPostUserId
                    }
                    $.ajax({
                        url: '/collection/user',
                        type: 'post',
                        data: JSON.stringify(obj1),
                        contentType: "application/json",
                        success: function (data) {
                            //表明数据库中有值
                            if (data.collectedUser === '1') {
                                $("#collectUser").removeClass("glyphicon glyphicon-heart-empty btn btn-info");
                                $("#collectUser").addClass("glyphicon glyphicon-heart btn btn-success");
                                $("#collectUser").html("已关注")
                            }
                        }
                    })
                }

                //根据贴子的id和当前登录的用户id去找
                if (curPostId != null && curUserId != null) {
                    let obj2 = {
                        currentUserId: curUserId,
                        postId: curPostId
                    }
                    $.ajax({
                        url: '/collection/post',
                        type: 'post',
                        data: JSON.stringify(obj2),
                        contentType: "application/json",
                        success: function (data) {
                            //表明数据库中有值
                            if (data.collectedPost === '1') {
                                $("#collectPost").removeClass("glyphicon glyphicon-heart-empty btn btn-info");
                                $("#collectPost").addClass("glyphicon glyphicon-star btn btn-success");
                                $("#collectPost").html("已收藏")
                            }
                        }
                    });
                }


                //平滑到评论框
                $("span[href='#comment1']").on("click", function () {
                    //alert($(window).scrollTop())
                    var windowBottom = $(window).height();
                    $('body,html').animate({scrollTop: windowBottom}, 1000);
                })

                //回复评论，平滑到下方,获取当前评论用户的id，评论的id，评论的昵称
                $(".reply-comment").on("click", function () {
                    let windowBottom = $(window).height();
                    $('body,html').animate({scrollTop: windowBottom}, 1000);
                    //获取当前被评论用户的id,昵称，回复的内容，回复的评论的id
                    let toCommentId = $(this).attr("CID");
                    let CNickName = $(this).attr("CNickName");
                    let toUserId = $(this).attr("CToUserId");
                    if (toCommentId !== '' && CNickName !== '' && toUserId !== '') {
                        //$("#myInput").attr("action", "/comment/reply")
                        $("input[name='toUserId']").val(toUserId);
                        $("input[name='toCommentId']").val(toCommentId);
                        //获取当前的用户传递给这个
                        editor.setContent(" 回复@" + CNickName + ":");
                    }
                })

                $(".replyToReply").on("click", function () {
                        let toUserNickName = $(this).attr("toUserNickName");//回复的用户名
                        let toUserId = $(this).attr("toUserId");//回复的对象
                        let replyId = $(this).attr("replyId")//回复的回复的id
                        let toCommentId = $(this).attr("toCommentId");//回复的id
                        if (toCommentId !== '' && replyId !== '' && toUserId !== '') {
                            $("input[name='toUserId']").val(toUserId);
                            $("input[name='toCommentId']").val(toCommentId);
                            $("input[name='replyId']").val(replyId);
                            editor.setContent("回复@" + toUserNickName + "  :");
                            return false;
                        }
                    }
                )
                editor.addListener('selectionchange', function () {
                    var currentContent = editor.getContentTxt();
                    if (currentContent.match("回复@")) {
                        $("#myInput").attr("action", "/comment/reply");
                    } else {
                        $("#myInput").attr("action", "/comment");
                    }
                })
            });
        </script>
    </div>
</div>
</body>
</html>