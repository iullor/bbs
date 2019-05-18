<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico"/>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <!--login的模态框-->
    <link rel="stylesheet" href="/css/modal/modal_login.css">
    <link rel="stylesheet" href="/lib/bxslider/jquery.bxslider.css">
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==0 || empty sessionScope.CURRENT_USER}">
        <link id="navbar-top" rel="stylesheet" href="/css/commons/sidebar_left.css">
    </c:if>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==1}">
        <link id="navbar-top" rel="stylesheet" href="/css/commons/sidebar_left-pink.css">
    </c:if>
    <script src="/lib/jQuery/jquery.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/jsrender/1.0.2/jsrender.js"></script>
    <script src="/js/sidebar-left-control.js"></script>
</head>
<body>
<header class="navbar navbar-fixed-top">
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
                        <div class="search-result-user"></div>
                        <div class="search-result-post"></div>
                        <div class="search-result-topic"></div>
                        <div class="search-result-area"></div>
                    </div>
                </div>
                <div class="col-md-2  nav-addon">
                    <a href="/public"><span class="glyphicon glyphicon-cloud">&nbsp;话题广场</span></a>
                    <c:if test="${not empty sessionScope.CURRENT_USER}">
                        <a href="/person/myCircle"><span
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
<script type="text/x-jsrender" id="renderUser">
    {{for users}}
    {{:users}}
    {{else}}
        <p>
            <a href="/account/{{:id}}">
                <img src="" height="30" width="30"
                     style="margin-left: 1%;border: 1px solid blue;" value="{{:userBaseInfo.headImage}}"
                     alt="">
                <span style="margin-left: 3%">{{:nickName}}</span>
                 <span  style="margin-right: 1%" class="text-primary pull-right">
                     用户
                </span>
            </a>
        </p>
    {{/for}}



</script>
<script type="text/x-jsrender" id="renderArea">
    {{for areas}}
    {{:areas}}
    {{else}}
         <p style="font-size: 17px;margin-bottom: 0px;line-height: 35px">
            <a href="/area/{{:id}}">
                <span style="margin-right:1%"  class="text-success pull-right">
                     分区
                </span>
                <span style="margin-left: 2%">
                    {{:areaTitle}}
                </span>
             </a>
          </p>
    {{/for}}



</script>
<script type="text/x-jsrender" id="renderPost">
    {{for posts}}
    {{:posts}}
    {{else}}
         <p style="font-size: 17px;margin-bottom: 0px;line-height: 35px">
            <a href="/post/{{:id}}">
                <span style="margin-left: 1%">
                   {{:postTitle}}
                </span>
                <span style="margin-right:1%" class="text-danger pull-right">
                     贴子
                </span>
             </a>
          </p>
    {{/for}}



</script>
<script type="text/x-jsrender" id="renderTopic">
     {{for topics}}
    {{:topics}}
    {{else}}
         <p style="font-size: 17px;margin-bottom: 0px;line-height: 35px">
            <a href="/public/{{:id}}">
                <span style="margin-left: 2%">
                    {{:topicTitle}}
                </span>
                 <span class="text-info pull-right" style="margin-right:1%">
                     话题
                </span>
             </a>
          </p>
    {{/for}}



</script>
<%--搜索渲染的样式--%>
<script>
    $(function () {
        $(".dropdown-toggle").on("click", function () {
            $(".dropdown-menu").hide()
            $(this).siblings("ul").show()
        })
        $(".dropdown-menu").mouseleave(function () {
            $(this).hide();

        })
        $("#search").bind("input oninput", function () {
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
            } else {
                alert("请输出搜索的内容")
                return false;
            }
        })
    })
</script>
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
</body>
</html>
