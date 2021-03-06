<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理页面首页</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin.css">
    <!--js-->
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sidebar-left-control.js"></script>
    <style>
        #pageContainer {
            top: 50px;
            background-color: white;
        }
    </style>
</head>
<body>
<div>
    <!--顶栏-->
    <div class="navbar-fixed-top">
        <nav class="navbar navbar-default navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/main">管理员界面</a>
                </div>
                <div class="navbar-right">
                    <div class="dropdown" style=";margin-top: 10px;margin-right: 20px">
                        <a href="#" class="dropdown-toggle" style="color: white;font-size: 20px" type="button"
                           id="dropdownMenu1"
                           data-toggle="dropdown" aria-expanded="true">
                            操作<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <li><a href="${pageContext.request.contextPath}/index">主页面</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/logout">注销</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </div>
    <!--侧栏-->
    <div class="col-md-2">
        <div id="navbar-left" class="navbar-fixed-left">
            <ul>
                <li class="text-center" style="margin-left: -80px">
                    <a href="#">
                        <img src="" width="60" height="60"
                             value='${sessionScope.ADMIN_USER.userBaseInfo.headImage}'
                             path="${pageContext.request.contextPath}"
                             class="showUserHeadImg"/>
                    </a>
                    <span>
                        ${sessionScope.ADMIN_USER.nickName}
                    </span>
                </li>
                <li id="system">
                    <a href="${pageContext.request.contextPath}/admin/system/info">
                        <span class="glyphicon glyphicon-cog"></span>系统<span></span>
                    </a>
                </li>
                <li id="public">
                    <a href="${pageContext.request.contextPath}/admin/notice">
                        <span class="glyphicon glyphicon-volume-up"></span>公告板<span></span>
                    </a>
                </li>
                <li id="public">
                    <a href="#">
                        <span class="glyphicon glyphicon-list-alt"></span>热门话题<span class="caret"></span>
                    </a>
                    <div>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/admin/topic/input/0">新建</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/topic">列表</a></li>
                        </ul>
                    </div>
                </li>
                <%--模块管理--%>
                <c:if test="${sessionScope.ADMIN_USER.userAccountStatus.role<3}">
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-th-large"></span>模块管理<span class="caret"></span>
                        </a>
                        <div>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/admin/panel">列表</a></li>
                            </ul>
                        </div>
                    </li>
                </c:if>
                <%--板块管理--%>
                <c:if test="${sessionScope.ADMIN_USER.userAccountStatus.role<4}">
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-equalizer"></span>板块管理<span class="caret"></span>
                        </a>
                        <div>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/admin/board">列表</a></li>
                            </ul>
                        </div>
                    </li>
                </c:if>
                <%--分区管理--%>
                <li>
                    <a href="#">
                        <span class="glyphicon glyphicon-th"></span>区管理<span class="caret"></span>
                    </a>
                    <div>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/admin/area">列表</a></li>
                        </ul>
                    </div>
                </li>
                <%--贴子管理--%>
                <li>
                    <a href="#postManager">
                        <span class="glyphicon glyphicon-flag"></span>贴子管理<span class="caret"></span>
                    </a>
                    <div id="postManager">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/admin/post">列表</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/post/input/0">添加类型</a></li>
                        </ul>
                    </div>
                </li>
                <%--用户管理--%>
                <c:if test="${sessionScope.ADMIN_USER.userAccountStatus.role<2}">
                    <li>
                        <a href="#userManager">
                            <span class="glyphicon glyphicon-user"></span>用户管理<span class="caret"></span>
                        </a>
                        <div id="userManager">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/admin/user">用户列表</a></li>
                                <%--<li><a href="${pageContext.request.contextPath}/admin/user/brokeRolesUser">违规用户</a></li>--%>
                            </ul>
                        </div>
                    </li>
                </c:if>
                <%--申请审核--%>
                <li>
                    <a href="#">
                        <span class="glyphicon glyphicon-retweet"></span>申请审核<span class="caret"></span>
                    </a>
                    <div>
                        <ul>
                            <c:if test="${sessionScope.ADMIN_USER.userAccountStatus.role<3}">
                                <li><a href="${pageContext.request.contextPath}/admin/check/boardManager">版主申请</a></li>
                            </c:if>
                            <li><a href="${pageContext.request.contextPath}/admin/check/myTopicUp">话题申请</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/check/post">贴子的申请</a></li>
                        </ul>
                    </div>
                </li>

              <%--  <c:if test="${sessionScope.ADMIN_USER.userAccountStatus.role<2}">
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-lock"></span>权限管理<span class="caret"></span>
                        </a>
                        <div>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/admin/permission">列表</a></li>
                                <li><a href="${pageContext.request.contextPath}/admin/permission/input/0">设置权限</a></li>
                            </ul>
                        </div>
                    </li>
                </c:if>--%>
               <%-- <li>
                    <a href="#">
                        <span class="glyphicon glyphicon-share"></span>系统反馈<span class="caret"></span>
                    </a>
                    <div>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/admin/feedback">反馈列表</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/feedback/input/0">回复</a></li>
                        </ul>
                    </div>
                </li>--%>
                <li class="mt-5 mb-3">
                    <p class="text-center">管理页面</p>
                </li>
            </ul>
        </div>
    </div>
    <!--内容-->
    <div id="pageContainer" class="col-md-10  pull-right">
        <iframe src="${pageContext.request.contextPath}/admin/system/info" frameborder="0" scrolling="no" id="external-frame" width="100%"
                onload="setIframeHeight(this)" style="margin-left: -30px;"></iframe>
    </div>
</div>
<script>
    $(function () {
        var $perents = $("#navbar-left>ul>li>a");
        var $childen = $("#navbar-left>ul>li>div");
        var $links = $("#navbar-left>ul>li>div>ul>li");
        $childen.hide();//隐藏所有的子
        $perents.on("click", function () {
            if ($(this).next("div").is(":hidden")) {
                $childen.hide(200);
                $(this).next("div").show(200);
            } else {
                $(this).next("div").hide(200);
            }
        })
        $perents.on("click", function () {
            var hrefs = $(this).next("div").children("ul").children("li:first-child").children("a").attr("href");
            $("iframe").attr("src", hrefs);
        })
        //点击切换页面
        $links.on("click", function () {
            var tmp = $(this).children("a").attr("href")
            $("iframe").attr("src", tmp);
            return false;
        })
        //对于那些单个的li
        $("#system").on("click", function () {
            var tmp = $(this).children("a").attr("href")
            $("iframe").attr("src", tmp);
            //隐藏所有的子
            $childen.hide();//隐藏所有的子
            return false;
        })
        $("#public").on("click", function () {
            var tmp = $(this).children("a").attr("href")
            $("iframe").attr("src", tmp);
            $childen.hide();//隐藏所有的子
            return false;
        })

    })

    //切换页面动态跳针iframe 的高
    function setIframeHeight(iframe) {
        if (iframe) {
            var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
            if (iframeWin.document.body) {
                iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
            }
        }
    };
    window.onload = function () {
        setIframeHeight(document.getElementById('external-frame'));
    };
</script>
</body>

</html>