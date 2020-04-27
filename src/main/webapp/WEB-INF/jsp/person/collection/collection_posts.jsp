<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>收藏贴子</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <%--左侧栏的样式--%>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==0}">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/person/person_manager-left.css">
    </c:if>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==1}">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/person/person_manager-left-pink.css">
    </c:if>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/person/collection/collection_posts.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sidebar-left-control.js"></script>
    <style>

    </style>
</head>
<body>
<%--引入顶栏--%>
<jsp:include page="/WEB-INF/jsp/foreground/commons/top-navbar.jsp"/>
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
                    <div id="person-basic-info" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="${pageContext.request.contextPath}/account/${sessionScope.CURRENT_USER.id}" class="">个人主页</a></li>
                                <li><a href="${pageContext.request.contextPath}/person/basic/account" class="">账号信息</a></li>
                                <li><a href="${pageContext.request.contextPath}/person/basic/info" class="">基本信息</a></li>
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
                                <li><a href="${pageContext.request.contextPath}/person/mypost">我的贴子</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="${pageContext.request.contextPath}/person/message/0">
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
                    <div id="person_collections" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li class="active"><a href="${pageContext.request.contextPath}/person/collection/myPosts" class="">贴子</a></li>
                                <li><a href="${pageContext.request.contextPath}/person/collection/myAreas" class="">分区</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="${pageContext.request.contextPath}/person/myfocus" class="">
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
                                <li><a href="${pageContext.request.contextPath}/person/themes/basic" class="">主题显示</a></li>
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
                                <li><a href="${pageContext.request.contextPath}/person/apply" class="">申请</a></li>
                                <li><a href="${pageContext.request.contextPath}/person/apply/progress" class="">进度</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="${pageContext.request.contextPath}/person/myCircle"><span
                                    class="glyphicon glyphicon-globe"></span><span>朋友圈</span></a>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#createMyBoard" data-toggle="collapse"
                               data-parent="#panel-parent"><span
                                    class="glyphicon glyphicon-cloud"></span><span>话题</span></a>
                        </div>
                    </div>
                    <div id="createMyBoard" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="${pageContext.request.contextPath}/person/topic/input/0" class="">创建</a></li>
                                <li><a href="${pageContext.request.contextPath}/person/topic" class="">查看</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="list" class="col-md-8 container-inner">
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
                                <a href="${pageContext.request.contextPath}/post/${p.postId}"><span>${p.post.postTitle}</span></a>
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
                                暂无收藏的贴子，前去 <a href="${pageContext.request.contextPath}/index">浏览</a>
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
