<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>post</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/css/panel/panel.css">

    <!--引入一些样式-->
    <link rel="stylesheet" href="/css/modal/modal_login.css">
    <link rel="stylesheet" href="/css/commons/sidebar_left.css">
    <link rel="stylesheet" href="/css/commons/commons.css">
    <link rel="stylesheet" href="/css/post/post_list.css">


    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/sidebar-left-control.js"></script>

    <!--动态添加留言的对话框-->
    <script src="/lib/ueditor/ueditor.config.js"></script>
    <script src="/lib/ueditor/ueditor.all.js"></script>
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
        <!--路径导航栏-->
        <div class="row post-nav">
            <ol class="breadcrumb">
                <li><a href="../../public/index.jsp">Home</a></li>
                <li><a href="../panel/panel.jsp">Panel</a></li>
                <li><a href="../board/board.jsp">School</a></li>
                <li><a href="../area/area.jsp">Computer Science</a></li>
                <li class="active">计算机发展</li>
            </ol>
        </div>
        <div id="main">
            <div class="row post-container">
                <div class="col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <a href="#">
                                <img src="/images/路飞.jpg" class="showUserHeadImg" value="${post.user.userBaseInfo.headImage}"/></a>
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
                                        <span>

                                                </span>
                                        <span href="#comment1" class="glyphicon glyphicon-comment"
                                              style="padding-left: 10px"></span>&nbsp;&nbsp;
                                        <span style="padding-left: 50px;">
                                                    发布于：<em>
                                                                <f:formatDate value="${post.createTime}"
                                                                              pattern="yyyy-MM-dd HH:mm:ss"/>
                                                            </em>
                                                </span>
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
                                                    <span>
                                                            ${(pageResult.currentPage-1)*pageResult.pageSize+i.index+1}楼
                                                    </span>
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
                        <%--分页--%>
                        <div id="footPage" class="row panel-footer panel-default">
                            <div class="col-md-offset-4 col-md-4">
                                <nav class="Page navigation">
                                    <ul class="pagination">
                                        <li id="firstPage" style="margin-right: 20px">
                                            <a href="javascript:goPage(1)" aria-label="Previous">
                                                <span aria-hidden="true">首页</span>
                                            </a>
                                        </li>
                                            <%--class="${pageResult.currentPage==1?'disabled':''}"--%>
                                        <li id="prevPage">
                                            <a href="javascript:goPage(1)" aria-label="Previous">
                                                上一页
                                            </a>
                                        </li>
                                        <c:forEach begin="${pageResult.beginIndex}" end="${pageResult.endIndex}"
                                                   var="pageNumber">
                                            <li class="${pageNumber==pageResult.currentPage?'active':''}">
                                                <a href="javascript:goPage(${pageNumber})">${pageNumber}</a>
                                            </li>
                                        </c:forEach>
                                            <%--class="${pageResult.endIndex==pageResult.totalPage?'disabled':''}"--%>
                                        <li id="nextPage">
                                            <a href="javascript:goPage(${pageResult.nextPage})" aria-label="Previous">
                                                下一页
                                            </a>
                                        </li>
                                        <li id="lastPage"
                                            class="${pageResult.endIndex==pageResult.totalPage?'disabled':''}">
                                            <a href="javascript:goPage(${pageResult.totalPage})">
                                                末页
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="col-md-2" style="margin-left:-70px;height: 78px;padding-top: 10px;">
                                    <%--跳转的框--%>
                                <form id="goPage" action="/post/${post.id}" method="get">
                                    <input type="hidden" name="currentPage">
                                    <input type="hidden" name="pageSize">
                                </form>
                                <div id="toPage">
                                    <input type="text" name="toPage"
                                           class="form-text">&nbsp;/&nbsp;${pageResult.totalPage}
                                    <button type="button" class="btn btn-success">跳转</button>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="row" style="text-align: center;margin-top: 50px;margin-bottom: 30px">
                            <h3>暂无评论</h3>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="row" style="width: 1150px;margin-left: 10px">
                <form id="myInput" action="/comment" method="post">
                    <%--当前用户--%>
                    <input type="hidden" name="userId">
                    <input type="hidden" name="postUserId" value="${post.userId}">
                    <input type="hidden" name="postId" value="${post.id}"/>
                    <input type="hidden" name="toCommentId"/>
                    <input type="hidden" name="toUserId">
                    <input type="hidden" name="replyId">
                    <script id="comment1" name="commentContent"
                            type="text/plain">
                    </script>
                    <div class="form-group">
                        <span>&nbsp;</span>
                        <button type="submit" class="btn btn-success pull-right">评论</button>
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
    //分页的
    function goPage(pageNumber) {
        $(":hidden[name='currentPage']").val(pageNumber);
        $(":hidden[name='pageSize']").val(5);
        $("#goPage").submit();
    }

    $(function () {
        $(".comment-textarea").hide();
        $(".glyphicon-comment").on("click", function () {
            var comment2 = $(".comment-textarea");
            console.log(comment2)
            $(this).parents("div.panel-body").append(comment2);
        })
        //点赞
        $(".good-post").on("click", function () {
            //两种状态
            //贴子
            var curPostId = '${post.id}';
            var id = {
                id: curPostId
            }
            var tmpSpan=$(this)
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
                        $(tmpSpan).next("span").html(data)
                        $(tmpSpan).addClass("glyphicon-thumbs-up-done");
                    }
                });
                /*console.log(this)*/
               /* $(this).addClass("glyphicon-thumbs-up-done");*/
            } else {
                //取消点赞
                $.ajax({
                    url: "/post/update/praise/" + 0,
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify(id),
                    success: function (data) {
                        //赋值,修改样式
                        $(tmpSpan).next("span").html(data)
                        $(tmpSpan).removeClass("glyphicon-thumbs-up-done");
                    }
                    //添加样式
                });
                /*$(this).removeClass("glyphicon-thumbs-up-done");*/
            }
            //评论
            return false;
        })
        //回显点赞
        var praises = '${post.praises}'
        $(".good-post").next("span").html(praises)

        var hasPraised = '${requestScope.hasPraised}'
        if (hasPraised !== '') {
            $(".good-post").addClass("glyphicon-thumbs-up-done");
        }

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
        });

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
        //console.log(curUserId);
        let curPostUserId = '${post.userId}'
        //console.log(curPostUserId)
        let curPostId = '${post.id}';
        //console.log(curPostId);
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
        //为editor 添加监听器，来改变表单的action
        editor.addListener('selectionchange', function () {
            var currentContent = editor.getContentTxt();
            if (currentContent.match("回复@")) {
                $("#myInput").attr("action", "/comment/reply");
            } else {
                $("#myInput").attr("action", "/comment");
            }
        })
        var isComment = '${post.banComment}'
        //禁止评论
        if (isComment !== '0') {
            $("#myInput").submit(function () {
                alert("该贴不可评论")
                return false;
            })
        }

        //分页一些东西的隐藏与显示
        let search = ${pageResult.totalPage};
        //如果只有一页,隐藏所有
        if (search < 2) {
            $("#footPage").hide();
        }
        //如果当前页等于第一页,那么隐藏上一页的按钮
        let currentPage =${pageResult.currentPage};
        if (currentPage === 1) {
            $("#prevPage").hide();
        }
        //如果当前页,等于最后一页,那么隐藏下一页
        let endPages = ${pageResult.endIndex};
        if (endPages === currentPage) {
            $("#nextPage").hide();
        }
        $("#toPage>button").on("click", function () {
            let toPage = $("input[name='toPage']").val();
            if (toPage !== null && toPage !== '' && toPage !== 'undefined') {
                let endPage = ${pageResult.totalPage};
                if (endPage + 1 > toPage) {
                    goPage(toPage);
                } else {
                    alert("请输入正确的页码");
                }
            } else {
                alert("请输入页码");
            }
        });
    });

</script>
</body>
</html>