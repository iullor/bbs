<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>申请公版显示</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <%--左侧栏的样式--%>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==0}">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/person/person_manager-left.css">
    </c:if>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==1}">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/person/person_manager-left-pink.css">
    </c:if>
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/person-left.js"></script>
    <script src="${pageContext.request.contextPath}/js/sidebar-left-control.js"></script>
    <style>
    </style>
</head>
<body>
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
                    <div id="person_collections" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="${pageContext.request.contextPath}/person/collection/myPosts" class="">贴子</a></li>
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
                    <div id="person_apply" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="${pageContext.request.contextPath}/person/apply" class="">申请</a></li>
                                <li class="active"><a href="${pageContext.request.contextPath}/person/apply/progress" class="">进度</a></li>
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
            <div>
                <h3>申请进程</h3>
                <hr>
            </div>
            <c:choose>
                <c:when test="${not empty myApplies}">
                    <table class="table  table-hover">
                        <thead>
                        <th>序号</th>
                        <th>类型</th>
                        <th>内容</th>
                        <th>时间</th>
                        <th>进度</th>
                        <th>操作</th>
                        </thead>
                        <c:forEach items="${myApplies}" var="apply" varStatus="i">
                            <tbody>
                            <tr>
                                <td>${i.index+1}</td>
                                <td>${apply.applyType}</td>
                                <td>
                                        ${apply.brief}
                                    &nbsp;&nbsp; <a href="${pageContext.request.contextPath}/person/apply/showApplyReason/${apply.id}">详情</a>
                                </td>
                                <td>
                                    <f:formatDate value="${apply.applyTime}"
                                                  pattern="yyyy-MM-dd HH:mm:ss"></f:formatDate>
                                </td>
                                <td>${apply.progress}</td>
                                <td>
                                    <c:if test="${apply.progress!='已经撤销'&& apply.progress!='审核通过'}">
                                        <a href="${pageContext.request.contextPath}/person/apply/cancelApply/${apply.id}">撤销</a>
                                    </c:if>
                                    <c:if test="${apply.progress=='已经撤销'}">
                                        <a href="${pageContext.request.contextPath}/person/apply/deleteApply/${apply.id}">删除</a>
                                    </c:if>
                                </td>
                            </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="text-center" style="font-size: 25px;margin-top: 80px;">
                        <h3>
                            暂无申请
                        </h3>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>

</body>
</html>