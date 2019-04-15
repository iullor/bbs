<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>主页</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">

    <!--sidebar-left样式-->
    <link rel="stylesheet" href="../../css/commons/sidebar_left.css">
    <!--login的模态框-->
    <link rel="stylesheet" href="../../css/modal/modal_login.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <!--主样式，覆盖前面的样式-->
    <link rel="stylesheet" href="../../css/commons/index.css">
    <!--=====================js=============================-->
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>--%>
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="https://cdn.bootcss.com/jsrender/1.0.2/jsrender.js"></script>
    <script src="/lib/bootstrap/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <!--控制侧栏-->
    <script src="/js/sidebar-left-control.js"></script>
    <style>
        .glyphicon-fire {
            color: red;
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
                <div class="col-md-2 nav-addon">
                    <a href="/public"><span class="glyphicon glyphicon-cloud">&nbsp;公共</span></a>
                    <a href="/person/myCircle"><span class="glyphicon glyphicon-globe">&nbsp;圈子</span></a>
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
        <%--侧边栏--%>
        <div class="right-nav">
            <div>
                <img src="/images/nav/center.png" width="30" height="30"><br>
                <label>个人中心</label>
            </div>
            <div>
                <img src="/images/nav/collect.png" width="30" height="30"><br>
                <label>收藏</label>
            </div>
            <div>
                <img src="/images/nav/editor.png" width="30" height="30"><br>
                <label>发帖</label>
            </div>
            <div>
                <img src="/images/nav/message.png" width="30" height="30"><br>
                <label>消息</label>
            </div>
            <div>
                <img src="/images/nav/up.png" width="30" height="30"><br>
                <label>返回顶部</label>
            </div>
        </div>
        <div class="row">
            <div class="messageImg">
                <div class="slider">
                    <div>
                        <img src="/images/index/1.jpg" alt="" width="800" height="450">
                    </div>
                    <div>
                        <img src="/images/index/2.jpg" alt="" alt="" width="800" height="450">
                    </div>
                    <div>
                        <img src="/images/index/3.jpg" alt="" alt="" width="800" height="450">
                    </div>
                </div>
            </div>
            <div class="messageTopic">
                <h3>本站热点</h3>
                <div class="nowdays-activity">
                    <h4>二手交易</h4>
                    <p>
                        <a href="#"><span class="glyphicon glyphicon-option-vertical"></span>雪山美景</a>
                    </p>
                </div>
                <div class="nowdays-activity">
                    <h4>西操场面基</h4>
                    <p>
                        <a href="#"><span class="glyphicon glyphicon-option-vertical">加入我们吧</span></a>
                    </p>
                </div>
                <div class="nowdays-activity">
                    <h4>毕业季分手季</h4>
                    <p>
                        <a href="#"><span class="glyphicon glyphicon-option-vertical">别说了，上车</span></a>
                    </p>
                </div>
            </div>
        </div>
        <div class="row head">
            <nav class="navbar">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="#">公共圈子</a></li>
                            <li><a href="#">我的圈子</a></li>
                            <li><a href="#"><span class="sr-only">|</span></a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="false">院系<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">信息技术学院</a></li>
                                    <li><a href="#">基础医学院</a></li>
                                    <li><a href="#">第一临床医学院</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">One more separated link</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="false">运动健身 <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">球类</a></li>
                                    <li><a href="#">田径</a></li>
                                    <li><a href="#">骑行</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <%--个性热门推荐--%>
        <div class="hot row">
            <p>
                <span>猜你喜欢</span>
                <a href="#" class="changeOthers">
                    <span class="pull-right" style="color: white;margin-right: 5px">换一批</span>
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
                    <div class="compent">
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
    /*
    * 点击回顶部
    * */
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

        $("#goTop button").click(function () {
            window.scrollTo(0, 0, 0, 0);
        })
        if ($(window).width() > 750) {
        }
        //获取请求中热门贴子,获取到json 字符串
        //转化为js对象
        /* var hostPostsJS = JSON.parse(hostPosts);
         for(var index in hostPostsJS){
             console.log(hostPostsJS[index])
         }
         console.log(hostPostsJS[0].areaId)*/
        /*var hostPosts = '
        console.log(hostPosts)
        var html = $("#showHotPosts").render(hostPosts);
        $(".hot-posts-holder").html(html);*/
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


        //动态改变宽度.items-content
        /*$(".items-content").css("w")*/
    })
</script>
</body>
</html>