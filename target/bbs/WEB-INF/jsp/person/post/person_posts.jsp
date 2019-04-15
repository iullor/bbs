<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <!--top栏样式-->
    <link rel="stylesheet" href="/css/commons/top.css">
    <link rel="stylesheet" href="/css/person/person_manager-left.css">
    <link rel="stylesheet" href="/css/person/post/person_posts.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/bootstrap.min.js"></script>
    <script src="/js/person-left.js"></script>
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
            <div class="sort-search">
                <div class="row">
                    <div class="col-md-4 text-center">
                        <b>时间</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#">升序 <span class="glyphicon glyphicon-sort-by-order"></span></a>&nbsp;&nbsp;
                        <a href="#">降序 <span class="glyphicon glyphicon-sort-by-order-alt"></span></a>
                    </div>
                    <div class="col-md-1">
                        <b>分类</b>
                    </div>
                    <div class="col-md-2">
                        <select name="choose" id="myPostType" class="form-control">
                            <option value="">全部</option>
                            <option value="">娱乐</option>
                            <option value="">求助</option>
                            <option value="">学术</option>
                        </select>
                    </div>
                    <div class="col-md-offset-1 col-md-4">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="关键字">
                            <span class="input-group-btn" style="padding-top: 8px;">
                               <button class="btn btn-default" type="button"><span
                                       class="glyphicon glyphicon-search">查找</span></button>
                           </span>
                        </div>

                    </div>

                </div>
            </div>
            <hr>
            <div id="post-list" class="panel-group">
                <c:choose>
                    <c:when test="${not empty posts}">
                        <c:forEach items="${posts}" var="post">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <a href="/post/${post.id}"><h4>${post.postTitle}</h4></a>
                                        </div>
                                        <div class="col-md-1">
                                            <span>&nbsp;&nbsp;&nbsp;<i>${post.postType}</i></span>
                                        </div>
                                        <div class="col-md-2">
                                           <span><small>
                                                <f:formatDate value="${post.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
                                            </small></span>
                                        </div>
                                        <div class="col-md-1">
                                            <a href="/post/input/${post.id}"><span
                                                    class="glyphicon glyphicon-edit btn btn-sm btn-primary">&nbsp;编辑</span></a>

                                        </div>
                                        <div class="col-md-1">
                                            <a href="#" class="pull-right secret"
                                               val="${post.id}"
                                               status="${post.secret}"
                                               style="margin-left: 20px;"><span
                                                    class="btn btn-sm btn-default  glyphicon glyphicon-eye-open">&nbsp;公开</span></a>
                                        </div>
                                        <div class="col-md-1">
                                            <a href="#" class="btn btn-sm btn-default pull-right banComment"
                                               val="${post.id}"
                                               status="${post.banComment}"
                                               style="margin-left: 10px;">&nbsp;允许评论</a>
                                        </div>
                                        <div class="col-md-1">
                                            <a href="/post/delete/${post.id}"><span
                                                    class="glyphicon glyphicon-remove text-danger btn-sm btn btn btn-danger">&nbsp;删除</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        您暂时没有贴子，请去<a href="/post/input/0">添加</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>


<script>
    /**
     * 改变NickName，email的可选状态
     */
    $(function () {
        $(".glyphicon-edit").on("click", function () {
            $(this).parent().parent().prev().attr("disabled", false)
        })
    })

    /**
     *
     * 页面头像显示
     */
    $(function () {
        $("#uploadImage").on("click", function () {
            $("#headImage").click()
            $("#headImage").on("change", function () {
                var filePath = $(this).val()
                var src = window.URL.createObjectURL(this.files[0]);
                //alert(src)
                var fileFormat = filePath.split(".")
                var fileSuffix = fileFormat[fileFormat.length - 1].toLowerCase()
                //alert(fileSuffix)
                if (!fileSuffix.match("png|jpg|jpeg")) {
                    alert("格式错误")
                    return;
                }
                $("img").attr("src", src)

            })
        })

        //改变贴子的显示状态
        $(".secret").on("click", function () {
            var postId = $(this).attr("val")
            var id = {
                id: postId
            }
            var tmpClass = $(this).children("span").attr("class");
            //找到了,就设置为私密
            if (tmpClass.match("glyphicon-eye-open") !== null) {
                //公开
                var isOpen = window.confirm("设置为私密?");
                if (isOpen) {
                    $.ajax({
                        url: '/person/mypost/update/' + 1,
                        type: 'post',
                        data: JSON.stringify(id),
                        contentType: 'application/json',
                        success: function (data) {

                        }
                    })
                    //更改状态，显示私密
                    $(this).children("span").removeClass("glyphicon-eye-open").removeClass("btn-default");
                    $(this).children("span").addClass("glyphicon-eye-close").addClass("btn-warning");
                    $(this).children("span").html("&nbsp;私密")
                }
            } else {
                let currentStatus = $(this).children("span").html();
                //alert(currentStatus)
                //被管理员禁止显示
                if (currentStatus !== '&nbsp;被私密') {
                    var isOpen = window.confirm("设置为公开?");
                    if (isOpen) {
                        $.ajax({
                            url: '/person/mypost/update/' + 0,
                            type: 'post',
                            data: JSON.stringify(id),
                            contentType: 'application/json',
                            success: function (data) {

                            }
                        });
                        //更改状态，显示私密
                        $(this).children("span").addClass("glyphicon-eye-open").addClass("btn-default");
                        $(this).children("span").removeClass("glyphicon-eye-close").removeClass("btn-warning");
                        $(this).children("span").html("&nbsp;公开")
                    }
                } else {
                    alert('请联系管理员解除限制')
                }
            }
            return false;
        })

        //改变贴子的是否禁止评论状态
        $(".banComment").on("click", function () {
            var postId = $(this).attr("val")
            var id = {
                id: postId
            }
            var tmpClass = $(this).attr("class");
            //找到了,就设置为私密
            if (tmpClass.match("btn-default") !== null) {
                //公开
                var isBan = window.confirm("禁止评论?");
                if (isBan) {
                    $.ajax({
                        url: '/person/mypost/update/' + 3,
                        type: 'post',
                        data: JSON.stringify(id),
                        contentType: 'application/json',
                        success: function (data) {
                        }
                    })
                    //更改状态，显示私密
                    $(this).removeClass("btn-default");
                    $(this).addClass("btn-warning");
                    $(this).html("&nbsp;禁止评论")
                }
            } else {
                //私密
                let currentInfo = $(this).html();
                if (currentInfo !== '&nbsp;被禁止评论') {
                    var isBan = window.confirm("打开评论?");
                    if (isBan) {
                        $.ajax({
                            url: '/person/mypost/update/' + 2,
                            type: 'post',
                            data: JSON.stringify(id),
                            contentType: 'application/json',
                            success: function (data) {
                            }
                        });
                        //更改状态，显示私密
                        $(this).addClass("btn-default");
                        $(this).removeClass("btn-warning");
                        $(this).html("&nbsp;允许评论")
                    }
                } else {
                    alert('请联系管理员解除限制')
                }
            }
            return false;
        })
        /*
        * 状态按钮回显
        * */

        $(".secret").each(function () {
            if ($(this).attr("status") === '1') {
                $(this).children("span").removeClass("glyphicon-eye-open").removeClass("btn-default");
                $(this).children("span").addClass("glyphicon-eye-close").addClass("btn-warning");
                $(this).children("span").html("&nbsp;私密")
            }
            //被管理员禁止的显示
            if ($(this).attr("status") === '2') {
                $(this).children("span").removeClass("glyphicon-eye-open").removeClass("btn-default");
                $(this).children("span").addClass("glyphicon-eye-close").addClass("btn-warning");
                $(this).children("span").html("&nbsp;被私密")
            }
        })
        $(".banComment").each(function () {
            if ($(this).attr("status") === '1') {
                $(this).removeClass("btn-default");
                $(this).addClass("btn-warning");
                $(this).html("&nbsp;禁止评论")
            }
            //被管理员禁止评论
            if ($(this).attr("status") === '2') {
                $(this).removeClass("btn-default");
                $(this).addClass("btn-warning");
                $(this).html("&nbsp;被禁止评论")
            }
        })

        //想后台发送一个查询，返回来一个map
        $("#myPostType").on("change", function () {
        })
    })
</script>
</body>
</html>