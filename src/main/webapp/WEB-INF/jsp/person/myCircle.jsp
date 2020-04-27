<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>朋友圈</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <%--左侧栏的样式--%>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==0}">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/person/person_manager-left.css">
    </c:if>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==1}">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/person/person_manager-left-pink.css">
    </c:if>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/person/circle/circle.css">
    <script src="${pageContext.request.contextPath}/lib/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sidebar-left-control.js"></script>
</head>
<body>
<%--引入顶栏--%>
<jsp:include page="/WEB-INF/jsp/foreground/commons/top-navbar.jsp"/>
<div class="container-fluid">
    <div class="row" style="margin-top: 80px">
        <div class="col-md-offset-2 col-md-8">
            <div class="circle-right">
                <p class="circle-right-tab">
                    <span class="text-warning">我的圈子</span>
                    <select class="choose">
                        <option value="1">帖子</option>
                        <option value="2">话题</option>
                    </select>
                </p>
                <div class="circle-list-post">
                    <c:forEach items="${posts}" var="post">
                        <div class="circle-list">
                            <div class="col-md-2"
                                 style="margin-top:-30px;border-right: 1px black solid;height: 90px;padding-top: 20px;font-size: 20px;color: green;">
                                <p class="date" style="margin-right: 40px;color: blue">
                                    <span class="glyphicon glyphicon-calendar"></span>&nbsp;
                                    <f:formatDate value="${post.createTime}" pattern="yyyy-MM-dd"/>
                                    <br>
                                </p>
                                <p class="time"
                                   style="color: silver;font-size: 16px;margin-top: 20px;margin-left: 80px">
                                    <f:formatDate value="${post.createTime}" pattern="HH:mm:ss"/>
                                    <span class="glyphicon glyphicon-time"></span><br>
                                </p>
                            </div>
                            <div class="col-md-2" style="border-top: 1px solid rgba(153, 51, 51, 0.46);;">
                                <p class="text-center" style="margin-top: 8px;">
                                    <a href="${pageContext.request.contextPath}/account/${post.userId}">
                                        <img src="${pageContext.request.contextPath}/images/superman.png" class="showUserHeadImg"
                                             path="${pageContext.request.contextPath}"
                                             value="${post.user.userBaseInfo.headImage}" width="50" height="40" alt="">
                                    </a>
                                </p>
                                <p class="text-center">
                                    <a href="${pageContext.request.contextPath}/account/${post.userId}">${post.user.nickName}</a>
                                </p>
                            </div>
                            <div class="col-md-8" style="border-top: 1px solid rgba(153, 51, 51, 0.46);">
                                <p class="circle-list-head" style="font-size: 18px;margin-top: 30px">
                                    <a href="${pageContext.request.contextPath}/post/${post.id}">${post.postTitle}</a>
                                    <span class="pull-right" style="margin:0px 50px;">${post.postType}</span>
                                    <span class="pull-right" style="margin:0px 50px;">
                                        <span class="glyphicon glyphicon-comment"></span>
                                        ${post.comm}
                                    </span>
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="circle-list-topic">
                    <c:forEach items="${topics}" var="topic">
                        <div class="circle-list"
                             style="height: 120px;padding-top: 5px;border-top: 1px solid rgba(153, 51, 51, 0.46);">
                            <div class="col-md-2">
                                <p class="text-center">
                                    <a href="${pageContext.request.contextPath}/account/${topic.userId}">
                                        <img src="${pageContext.request.contextPath}/images/superman.png" class="showUserHeadImg"
                                             path="${pageContext.request.contextPath}"
                                             value="${topic.user.userBaseInfo.headImage}" width="80" height="80" alt="">
                                    </a>
                                </p>
                                <p class="text-center">
                                    <a href="${pageContext.request.contextPath}/account/${topic.userId}">${topic.user.nickName}</a>
                                </p>
                            </div>
                            <div class="col-md-10">
                                <p class="circle-list-head">
                                    <a href="${pageContext.request.contextPath}/public/${topic.id}">${topic.topicTitle}</a>
                                </p>
                                <p class="circle-list-body">
                                    &nbsp;&nbsp;
                                    <c:set var="longDescribe" value="${topic.topicDescribe}"/>
                                    <c:set var="longDescribe" value="${topic.topicDescribe}"/>
                                    <c:set var="shortDescribe" value="${fn:substring(longDescribe, 0, 130)}"/>
                                    <c:if test="${topic.topicDescribe.length()>130}">
                                        ${shortDescribe}...
                                    </c:if>
                                    <c:if test="${topic.topicDescribe.length()<130}">
                                        ${longDescribe}
                                    </c:if>
                                </p>
                                <p class="circle-list-foot" style="margin-top: 10px">
                                    <span>
                                        <span class="glyphicon glyphicon-time"></span>
                                        <f:formatDate value="${topic.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </span>
                                    <span>
                                            ${topic.topicParticipations}
                                    </span>
                                    <span>
                                        <span class="glyphicon glyphicon-eye-open"></span>
                                        ${topic.topicSeen}
                                    </span>
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="text-center" style="margin-top: 150px">
                    <h3>到底了</h3>
                </div>
            </div>
        </div>
        <div class="col-md-1">
            <div class="circle-left">
                <h4 class="text-center text-default">
                    我的关注
                </h4>
                <c:forEach items="${myFocusUsers}" var="focus">
                    <p class="recent-friend">
                        <a href="${pageContext.request.contextPath}/account/${focus.user.id}">
                            <img src="${pageContext.request.contextPath}/images/superman.png" class="showUserHeadImg"
                                 path="${pageContext.request.contextPath}"
                                 value="${focus.user.userBaseInfo.headImage}" width="50" height="50" class="img-circle"
                                 alt="">
                        </a>
                        <a href="${pageContext.request.contextPath}/account/${focus.user.id}">${focus.user.nickName}</a>
                        <a href="#" class="pull-right send-email" data-toggle="modal" data-target="#email">
                            <img src="${pageContext.request.contextPath}/images/public/email.png" width="25" height="25" alt="" style="margin-top: 10px">
                        </a>
                        <input type="hidden" value="${focus.user.email}">
                    </p>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="modal fade" id="email" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="exampleModalLabel">
                        <img src="${pageContext.request.contextPath}/images/public/email.png" width="40" height="40" alt="">新邮件
                    </h4>
                </div>
                <form action="${pageContext.request.contextPath}/email" method="post">
                    <div class="modal-body">

                        <div class="form-group">
                            <label class="control-label fromUserNickName">发送者:${sessionScope.CURRENT_USER.nickName}</label>
                            <input type="text" class="form-control" name="fromEmailAddress" readonly="readonly"
                                   value="${sessionScope.CURRENT_USER.email}">
                        </div>
                        <div class=" form-group">
                            <label class="control-label toUserNickName">接收人:</label>
                            <input type="email" class="form-control" name="toEmailAddress" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label class="control-label">主题:</label>
                            <input type="text" class="form-control" name="emailTitle">
                        </div>
                        <div class="form-group">
                            <label class="control-label">邮件内容:</label>
                            <textarea class="form-control" name="emailContent" rows="15" placeholder="邮件内容，最多150字"
                                      maxlength="150" required="required" style="resize: none;"></textarea>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="reset" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-success">
                            发送&nbsp;
                            <img src="${pageContext.request.contextPath}/images/public/send.png" width="30" height="30" alt="">
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(".circle-list-topic").hide();
    $(function () {
        $(".choose").change(function () {
            let value = $(this).val()
            if (value == 1) {
                $(".circle-list-topic").hide()
                $(".circle-list-post").fadeIn(500)
            }
            if (value == 2) {
                $(".circle-list-post").hide()
                $(".circle-list-topic").fadeIn(500)
            }
        })
        //时间线
        var dateTmp;
        $(".date").each(function () {
            var everyDate = $(this).html();
            console.log(everyDate)
            if (everyDate == dateTmp) {
                $(this).html("<br/>");
            } else {
                dateTmp = everyDate;
            }
        })
        //互相发送邮件
        //找到对方的昵称,和邮箱
        $(".send-email").on("click", function () {
            let nickName = $(this).prev("a").html()
            let email = $(this).next("input").val();
            //alert(nickName + " " + email)
            $(".toUserNickName").html("接收人:" + nickName);
            $(":input[name='toEmailAddress']").val(email)

        })

    })
</script>
</body>
</html>