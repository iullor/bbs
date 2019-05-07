<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>主页</title>
    <jsp:include page="/WEB-INF/jsp/foreground/commons/top-navbar.jsp"/>
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <!--login的模态框-->
    <link rel="stylesheet" href="/css/modal/modal_login.css">
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">--%>
    <link rel="stylesheet" href="/lib/bxslider/jquery.bxslider.css">
    <!--主样式，覆盖前面的样式-->
    <link rel="stylesheet" href="/css/commons/index.css">
    <link rel="stylesheet" href="/css/commons/sidebar_left.css">
    <!--=====================js=============================-->
    <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>--%>
    <%--<script src="/lib/jQuery/jquery-2.1.4.min.js"></script>--%>
    <script src="/lib/jQuery/jquery.js"></script>
    <script src="https://cdn.bootcss.com/jsrender/1.0.2/jsrender.js"></script>
    <!--控制侧栏-->
    <script src="/js/sidebar-left-control.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <%--    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>--%>
    <script src="/lib/bxslider/jquery.bxslider.min.js"></script>
    <style>
        .glyphicon-fire {
            color: red;
        }

        /*覆盖插件的样式*/
        .bx-wrapper .bx-controls-direction a {
            position: absolute;
            top: 50%;
            margin-top: -16px;
            outline: 0;
            width: 32px;
            height: 32px;
            text-indent: -9999px;
            z-index: 1;
        }
    </style>
</head>
<body>

<%--<header class="navbar navbar-fixed-top navbar-default">
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
                    <a class="navbar-brand logo" href="/index.jsp">
                    </a>
                </div>
                <div class="col-md-5">
                    <div class="row" style="margin-top: 6px">
                        <form id="searchForm" action="/search">
                            <div class="form-group col-md-6">
                                <input type="text" class="form-control" id="search" name="keyword" placeholder="Search">
                            </div>
                            <div class="form-group col-md-6">
                                <button type="submit" class="btn btn-default"><span
                                        class="glyphicon glyphicon-search"></span>Search
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="search-result-show">
                        <div class="search-result-user">
                        </div>
                        <div class="search-result-post">

                        </div>
                        <div class="search-result-topic">

                        </div>
                        <div class="search-result-area">

                        </div>
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
</header>--%>
<div class="container">
    <div class="row">
        <%--侧边栏--%>
        <%--<input type="hidden" id="currentUser" value="${sessionScope.CURRENT_USER}">--%>
        <div class="right-nav">
            <%--判断如果当前session 中无用户就让不显示--%>
            <c:if test="${not empty sessionScope.CURRENT_USER}">
                <div class="person-center">
                    <img src="/images/nav/center.png" width="30" height="30"><br>
                    <label>个人中心</label>
                </div>
                <div class="person-collect">
                    <img src="/images/nav/collect.png" width="30" height="30"><br>
                    <label>收藏</label>
                </div>
            </c:if>
            <div class="post-edit">
                <a href="/post/input/0">
                    <img src="/images/nav/editor.png" width="30" height="30"><br>
                </a>
                <label>发帖</label>
            </div>
            <c:if test="${not empty sessionScope.CURRENT_USER}">
                <div class="person-message">
                    <img src="/images/nav/message.png" width="30" height="30"><br>
                    <label>消息</label>
                </div>
            </c:if>
            <div class="goTop">
                <img src="/images/nav/up.png" width="30" height="30"><br>
                <label>返回顶部</label>
            </div>
        </div>
        <div class="row">
            <div class="messageImg">
                <div class="slider">
                    <c:forEach items="${hotTopics}" var="hotTopic">
                        <div style="position: relative;">
                            <a href="/public/${hotTopic.id}" target="_blank">
                                <img src="/images/index/1.jpg" class="showUserHeadImg topicUrlPicture"
                                     value="${hotTopic.topicPicture}"
                                     width="800"
                                     height="450">
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="messageTopic">
                <h4 class="text-left text-danger" style="margin-left: 10px;">
                    <img src="/images/index/topic.png" alt="" width="20" height="20">
                    热门话题
                </h4>
                <hr style="margin-top: 0px;margin-bottom: -15px">
                <div class="nowadays-activity">
                    <c:forEach items="${hotTopics}" var="hotTopic">
                        <p>
                                <span>
                                    <img src="/images/index/hot2png" width="40" height="20" alt="">
                                </span>
                            <a href="/public/${hotTopic.id}">${hotTopic.topicTitle}</a>
                        </p>
                    </c:forEach>
                </div>
            </div>
            <div class="publicMessage">
                <h4 class="text-left text-primary" style="margin-left:10px;">
                    <img src="/images/index/laba.png" alt="" width="20" height="20">
                    &nbsp;公告
                </h4>
                <hr>
                <c:forEach items="${notices}" var="notice" varStatus="i">
                    <div class="notice">
                        <img src="/images/index/notice.png" width="20" height="20" alt="" style="margin-right: 20px">
                        <a href="/admin/notice/${notice.id}" target="_blank"
                           style="color:#0b0aff ;font-size: 16px">${notice.noticeTitle}</a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="row head">
            <nav class="navbar">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="/public">话题广场</a></li>
                            <c:if test="${not empty sessionScope.CURRENT_USER}">
                                <li><a href="/person/myCircle/${sessionScope.CURRENT_USER.id}">我的圈子</a></li>
                            </c:if>
                        </ul>
                        <c:forEach items="${panels}" var="panel">
                            <ul class="nav navbar-nav">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-haspopup="true" aria-expanded="false">${panel.title} <span
                                            class="caret"></span></a>

                                    <ul class="dropdown-menu">
                                        <c:forEach items="${panel.boards}" var="board">
                                            <li><a href="/board/${board.id}">${board.boardTitle}</a></li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </ul>
                        </c:forEach>
                    </div>
                </div>
            </nav>
        </div>
        <%--个性热门推荐--%>
        <div class="hot row">
            <p>
                <span>猜你喜欢</span>
                <a href="#" class="changeOthers">
                    <span class="pull-right" style="color: white;margin-right: 5px">
                        <img src="/images/index/change3.png" height="16" width="16" alt="">
                    </span>
                    <span class="pull-right" style="color: #00d3db;margin-right: 2px">换一批</span>
                </a>
            </p>
            <!--
                json字符串
            -->
            <div class="hot-posts-holder">
                <c:forEach items="${hotPosts}" var="hotPost">
                    <div class="col-md-3">
                        <div class="piece">
                            <div class="text-center">
                                <a href="/post/${hotPost.id}">
                                    <img src="" class="showPostFirstImage" value='${hotPost.firstImage}' alt=""
                                         height="220"
                                         width="220">
                                </a>
                            </div>
                            <p style="margin-top:3px;padding-left:10px">
                                <lead>
                                    <a href="/account/${hotPost.userId}" target="_blank"
                                       class="text-primary">${hotPost.user.nickName}</a>
                                </lead>
                                <strong>
                                    <a href="/post/${hotPost.id}" target="_blank">&nbsp;&nbsp;${hotPost.postTitle}</a>
                                </strong>
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div id="main" class="row">
            <c:forEach items="${panels}" var="p">
                <c:if test="${p.boards.size()>0}">
                    <div class="component">
                        <h3>
                            <a href="/panel/${p.id}">
                                <img src="" class="showUserHeadImg" value="${p.logoPath}" width="25" height="25"
                                     style="margin-top: -10px">
                                    ${p.title}
                            </a>
                        </h3>
                        <p>
                            <c:forEach items="${p.boards}" var="b">
                                <span><small><a href="/board/${b.id}">${b.boardTitle}</a></small></span>
                            </c:forEach>
                            <span>
                           <small><a href="/panel/${p.id}">
                               <span class="pull-right">更多</span></a>
                           </small>
                    </span>
                        </p>
                        <div class="row board-items">
                                <%--板块--%>
                            <div class="items-content">
                                <c:forEach items="${p.boards}" var="b">
                                    <div class="col-md-3 board-item">
                                        <div class="text-left" style="margin-top: 10px">
                                            <a href="#" style="font-size: 18px;"><span>[${b.boardTitle}]</span></a>&nbsp;
                                        </div>
                                        <div class="text-center" style="margin-bottom: 5px">
                                            <img src="" value="${b.logoPath}" class="showUserHeadImg" width="150"
                                                 height="150">
                                        </div>
                                        <div class="board-hot-posts">
                                            <!--找到浏览量比较多的-->
                                            <c:forEach items="${b.posts}" var="post">
                                                <p>
                                                    <a href="/post/${post.id}">
                                                        <span class="glyphicon glyphicon-fire">&nbsp;</span>${post.postTitle}
                                                    </a>
                                                </p>
                                            </c:forEach>
                                        </div>
                                        <div class="board-info">
                                            <div>
                                                创建时间：
                                                <f:formatDate value="${b.createTime}" pattern="yyyy-MM-dd HH:mm"/>
                                            </div>
                                            <!--院系的详情-->
                                            <c:set var="detailsString" value="${b.details}"/>
                                            <c:set var="details1String"
                                                   value="${fn:substring(detailsString, 0,100)}"/>
                                            <div>
                                                详情:${details1String}
                                                <c:if test="${detailsString.length()>100}">
                                                    ... <a href="#">更多</a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
            <div id="foot" class="row">
                <p class="text-center"><span><a href="#">联系我们</a>&nbsp;&nbsp;<small>--</small></span>友情连接&nbsp;<a
                        href="https://www.baidu.com">百度</a>&nbsp;<a
                        href="https://www.google.com">Google</a>&nbsp;<a
                        href="https://www.github.com">GitHub</a></p>
                <div class="text-center">
                    <p>© 学生论坛版权所有</p>
                </div>
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
                        <form action="/checkLogon" method="get">
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
                                <input type="password" class="form-control" name="password" id="password">
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
    $(function () {
        //轮播图
        $('.slider').bxSlider({
            speed: 800,
            auto: true,
        });
        //鼠标悬浮，显示板块信息
        $(".board-info").hide();
        $(".showUserHeadImg").mouseover(function () {
            $(this).parent("div").siblings("div.board-hot-posts").hide();
            $(this).parent("div").siblings("div.board-info").show();
        }).mouseleave(function () {
            $(this).parent("div").siblings("div.board-info").hide();
            $(this).parent("div").siblings("div.board-hot-posts").show();
        })

        //获取请求中热门贴子,获取到json 字符串
        //显示图片
        $(".showPostFirstImage").each(function () {
            var headImg = $(this).attr("value");
            $(this).attr("src", headImg);
            //添加动画效果
            $(this).mouseover(function () {
                $(this).css({
                    'height': '240',
                    'width': '240'
                })
            }).mouseleave(function () {
                $(this).css({
                    'height': '220',
                    'width': '220'
                })
            })
        })

        //换一批
        $(".changeOthers").on("click", function () {
            $.ajax({
                'url': '/post/changeOthers',
                'method': 'get',
                'contentType': 'application/json',
                success: function (data) {
                    $(".piece").each(function (index, post) {
                        $(this).children("div.text-center").children("a").attr("href", "/post/" + data[index].id);
                        $(this).children("div.text-center").children("a").children("img.showPostFirstImage").attr("src", data[index].firstImage)
                        $(this).children("p").children("lead").children("a").attr("href", "/account/" + data[index].userId).html(data[index].user.nickName)
                        $(this).children("p").children("strong").children("a").attr("href", "/post/" + data[index].id).html("&nbsp;&nbsp;" + data[index].postTitle)
                    })
                }
            })
            return false;
        })
        let times = 1;
        //动态改变公告栏10s更换一次
        window.setInterval(function () {
            $.ajax({
                'url': '/index/changeNotices/' + times,
                'method': 'get',
                'contentType': 'application/json',
                success: function (data) {
                    console.log(data)
                    times = times + 1;
                    $(".notice").each(function (index, notice) {
                        $(this).children("a").attr("href", "/admin/notice/" + data[index].id);
                        $(this).children("a").html(data[index].noticeTitle);
                    })
                }
            })
        }, 30000)
        $(window).scroll(function () {
            var scrollTop = $(this).scrollTop();
            //alert(scrollTop)
            //当页面滑动的范围大于一$(".post-edit个高度，显示返回顶栏的标志
            if (scrollTop > 500) {
                $(".goTop").fadeIn(200);
            } else {
                $(".goTop").fadeOut(200);
            }

        })
        //返回顶栏显示
        $(".goTop").click(function () {
            //window.scrollTo(0, 0, 0, 0);
            let currentTop = $(this).offset().top
            let currentLeft = $(this).offset().left
            $('body,html').animate({
                scrollTop: 0
            }, 1000);
        })
        $(".post-edit").on("click", function () {
            $(this).children("a").click();
        })
        $(".post-edit>a").on("click", function () {
            //先去判断session 中有没有用户，有的话跳转否则出发登录弹窗
            $.ajax({
                url: '/postCheckLogin',
                type: 'get',
                success: function (data) {
                    if (data == 1) {
                        window.location.href = "/post/input/0"
                        return true;
                    } else {
                        $("#login").click();
                        return false;
                    }
                }
            })
            return false;
        });
        //首先对input的内容变化进行监听
        /*$("#search").bind("input oninput", function () {
            //对监听的结果进行判断，去除左右空格
            let keyword = $(this).val().trim();
            console.log(keyword)
            if (keyword !== null && keyword !== '' && keyword !== 'undefined') {
                //发送ajax请求
                $.ajax({
                    url: '/search/asynchronous/' + keyword,
                    type: 'get',
                    success: function (data) {
                        console.log("成功查询----")
                        console.log(data)
                        $(".search-result-show").fadeIn(500)
                        let users = data.users;
                        let areas = data.areas;
                        let posts = data.posts;
                        let topics = data.topics;
                        console.log(users)
                        console.log(areas)
                        console.log(posts)
                        console.log(topics)

                        //若每个都有值，这让他去详细查询的列表
                        //重新渲染后的数据,让结果的div显示
                        var usersResult = $("#renderUser").render(users);
                        var areasResult = $("#renderArea").render(areas);
                        var postsResult = $("#renderPost").render(posts);
                        var topicsResult = $("#renderTopic").render(topics);
                        $(".search-result-user").html(usersResult);
                        $(".search-result-area").html(areasResult);
                        $(".search-result-post").html(postsResult);
                        $(".search-result-topic").html(topicsResult);
                        $(".search-result-user img").each(function () {
                            console.log(this)
                            var currentSrc = $(this).attr("value")
                            let tmp = currentSrc.indexOf("/upload")
                            let src = currentSrc.substring(tmp, currentSrc.length)
                            $(this).attr("src", src)
                            //alert(src)
                        })
                        //判断每个div下有没有儿子，有的话为它添加上边线
                        $(".search-result-show>div").each(function () {
                            let childrenNumbers = $(this).children("p").length
                            //alert(childrenNumbers)
                            if (childrenNumbers > 0) {
                                console.log("要添加边框")
                                $(this).css({
                                    "border-top": "1px solid black"
                                })
                            }
                        })
                    }
                })
            } else {
                $(".search-result-show").fadeOut(500)
            }
        })
        //失去焦点，隐藏查询框
        $("#search").blur(function () {
            $(".search-result-show").fadeOut(500)
        })
        $("#searchForm").submit(function () {
            let keyword = $("#search").val();
            if (keyword !== null && keyword !== '' && keyword !== 'undefined') {
                return true;
            }
            return false;
        })*/
    })
</script>
</body>
</html>