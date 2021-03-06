<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${topNavbarInfo.boardTitle}</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <!--引入一些样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commons/sidebar_left.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commons/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal/modal_login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/board.css">
    <!--js-->
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sidebar-left-control.js"></script>
    <style>
        .panel{
            height: 250px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/foreground/commons/top-navbar.jsp"/>
<div class="container">
    <div class="row">
        <!--路径导航栏-->
        <div class="row area-nav" style="margin-top: 55px">
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/panel/${topNavbarInfo.panelId}">${topNavbarInfo.panelTitle}</a></li>
                <li class="active">${topNavbarInfo.boardTitle}</li>
            </ol>
        </div>
        <div class="row">
            <c:forEach items="${areas}" var="area">
                <div class="col-sm-6 col-md-6">
                    <div class="panel">
                        <div class="panel-heading">
                            <h5 class="panel-title">
                                <span>
                                    <span class="text-center">
                                        <img src="${pageContext.request.contextPath}/images/board/school.svg" width="25" height="25">
                                    </span>&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath}/area/${area.id}">${area.areaTitle}</a>
                                </span>
                                <a href="${pageContext.request.contextPath}/area/${area.id}"><span
                                        class="pull-right glyphicon glyphicon-chevron-right"></span></a>
                            </h5>
                        </div>
                        <div class="panel-body">
                            <c:forEach items="${area.posts}" var="post">
                                <p>
                                    <a href="${pageContext.request.contextPath}/post/${post.id}"><span>${post.postTitle}</span></a>
                                    <span class="pull-right glyphicon glyphicon-eye-open">&nbsp;${post.comm}</span>
                                </p>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<script>

    //为panel 动态添加样式
    $(function () {
        $(".panel:odd").addClass("panel-info")
        $(".panel:even").addClass("panel-danger")
    })

</script>
</body>
</html>