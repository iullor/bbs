<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${panel.title}</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/panel/panel.css">
    <!--引入一些样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commons/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal/modal_login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commons/sidebar_left.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/board.css">

    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sidebar-left-control.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/foreground/commons/top-navbar.jsp"/>
<div class="container">
    <div class="row">
        <div class="row">
            <!--路径导航栏-->
            <div class="row border-nav">
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
                    <li class="active">${panel.title}</li>
                </ol>
            </div>
            <div id="main">
                <div id="collapseParent" class="panel-group">
                    <div class="panel">
                        <div class="row panel-message">
                            <div class="col-md-4">
                                <div class="panel-logo text-center">
                                    <img src="" alt="" value="${panel.logoPath}"
                                         path="${pageContext.request.contextPath}"
                                         class="showUserHeadImg" width="250"
                                         height="250">
                                    <br>
                                    <div class="logo-title">
                                        ${panel.title}
                                    </div>
                                </div>
                                <div class="panel-detail">
                                    <div>
                                        <p>
                                            简介：${panel.info}
                                        </p>
                                    </div>
                                    <div>
                                        <p>
                                            详细信息：${panel.detail}
                                        </p>
                                    </div>
                                    <div>
                                        <p>
                                            创建时间：<f:formatDate value="${panel.createTime}" pattern="yyyy-MM-dd HH:mm"/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8" style="margin-left: 50px;background-color: white;">
                                <div class="text-left">
                                    <h2><a href="#">${panel.title}</a></h2>
                                </div>
                                <div class="hotPost">
                                    <c:forEach items="${panel.hotPosts}" var="post">
                                        <p>
                                        <span>
                                            <a href="${pageContext.request.contextPath}/post/${post.id}"><span
                                                    class="glyphicon glyphicon-option-vertical"></span>
                                                    ${post.postTitle}
                                            </a>
                                        </span>
                                        <span class="pull-right">
                                            [${post.boardTitle}]
                                        </span>
                                        </p>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${not empty panel.boards}">
                            <c:forEach items="${panel.boards}" var="b" varStatus="i">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <span class="lead"><a href="${pageContext.request.contextPath}/board/${b.id}">${b.boardTitle}</a></span>
                                        <div class="pull-right">
                                            <a role="button" data-toggle="collapse" href="#collapse${i.index}"
                                               aria-expanded="true"
                                               aria-controls="collapseOne" style="font-size: 18px">抽屉<span
                                                    class="caret"></span></a>
                                        </div>
                                    </div>
                                    <div id="collapse${i.index}" class="panel-collapse collapse in">
                                        <div class="panel-body panel-border">
                                            <c:forEach items="${b.areas}" var="a">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <a href="${pageContext.request.contextPath}/area/${a.id}">[${a.areaTitle}]</a>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <p class="text-info">[贴子数]:&nbsp;${a.postNumbers}</p>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <p>
                                                            <small>
                                                                <f:formatDate value="${a.createTime}"
                                                                              pattern="yyyy-MM-dd HH:mm:ss"/>
                                                            </small>
                                                        </p>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <span>暂时为空</span>
                                    <div class="drop_span pull-right">
                                        <a role="button" data-toggle="collapse" href="#collapse1"
                                           aria-expanded="true"
                                           aria-controls="collapseOne"><span class="caret"></span></a>
                                    </div>
                                    </button>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
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
</div>
<script>
    $(function () {
        $(".panel-detail").hide()
        $(".panel-logo").mouseover(function () {
            $(".logo-title").hide()
            $(".panel-detail").show()
        }).mouseleave(function () {
            $(".logo-title").show()
            $(".panel-detail").hide()
        })


        $(".panel-border .row:even").css("border-left", "blue solid 3px")
        $(".panel-border .row:odd").css("border-left", "red solid 3px")
    })
</script>
</body>
</html>